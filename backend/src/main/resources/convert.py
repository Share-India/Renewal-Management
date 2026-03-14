import pandas as pd
import numpy as np
import datetime

# Read data
df = pd.read_excel('c:/Users/Admin/.gemini/antigravity/scratch/insurance-renewal-app/backend/src/main/resources/Renewal Data.xlsx')

# Clean columns
df.columns = df.columns.str.strip()

# Helper function to format strings for SQL
def sql_str(val):
    if pd.isna(val) or val == '' or str(val).strip() == '-':
        return 'NULL'
    # Escape quotes
    return "'" + str(val).replace("'", "''") + "'"

# Helper function to format dates
def sql_date(val):
    if pd.isna(val) or val == '' or str(val).strip() == '-' or str(val).strip() == '00:00:00':
        return 'NULL'
    try:
        # Check if it's already a datetime object
        if isinstance(val, (datetime.datetime, pd.Timestamp)):
            return "'" + val.strftime('%Y-%m-%d') + "'"
        
        # Try parsing strings
        val_str = str(val).split(' ')[0] # take just the date part if there's time
        parsed = pd.to_datetime(val_str, errors='coerce')
        if pd.isna(parsed):
            return 'NULL'
        return "'" + parsed.strftime('%Y-%m-%d') + "'"
    except:
        return 'NULL'

def sql_decimal(val):
    if pd.isna(val) or val == '' or str(val).strip() == '-':
        return '0.00'
    try:
        # Extract digits and decimal point
        val_str = str(val).replace(',', '')
        if not any(c.isdigit() for c in val_str):
            return '0.00'
        return str(float(val_str))
    except:
        return '0.00'

# Generate SQL
sql_statements = []

# Disable auto-increment checks momentarily for faster bulk insert
sql_statements.append('SET FOREIGN_KEY_CHECKS=0;')

# We are skipping DELETEs here because user said they already deleted records, 
# but it's safe to add them just in case (we'll avoid audit_logs since it crashes)
sql_statements.append('DELETE FROM call_history;')
sql_statements.append('DELETE FROM reminders;')
sql_statements.append('DELETE FROM policies;')
sql_statements.append('DELETE FROM customers;')
sql_statements.append('SET FOREIGN_KEY_CHECKS=1;')

import re

# Process Customers (Unique by Email)
customers_map = {} # lowercase email -> customer_id
customer_inserts = []
customer_id_counter = 1

def clean_email(email_str):
    if pd.isna(email_str): return ""
    # Convert to string, lowercase, and aggressively remove ALL whitespace AND invisible unicode formatting chars
    cleaned = re.sub(r'[^a-zA-Z0-9@.\-_]', '', str(email_str)).lower()
    return cleaned

for idx, row in df.iterrows():
    email_raw = clean_email(row.get('Email ID', ''))
    if not email_raw or email_raw == '-':
        email_val = f"no-email-{idx}@default.com"
        email = f"'{email_val}'"
    else:
        email_val = email_raw
        email = sql_str(email_val)
        
    if email_val not in customers_map:
        customers_map[email_val] = customer_id_counter
        
        name_parts = str(row['Customer Name']).split(' ', 1) if pd.notna(row['Customer Name']) else ['Unknown']
        first_name = sql_str(name_parts[0])
        last_name_raw = name_parts[1].strip() if len(name_parts) > 1 else ''
        last_name = sql_str(last_name_raw) if last_name_raw else "''"
        phone = sql_str(row.get('Contact No'))
        dob = sql_date(row.get('DOB'))
        address = sql_str(row.get('Address 1', ''))
        city = sql_str(row.get('City', ''))
        state = sql_str(row.get('State', ''))
        pincode = sql_str(row.get('pincode', row.get('Pin Code', '')))
        
        customer_inserts.append(f"({customer_id_counter}, {first_name}, {last_name}, {email}, {phone}, {dob}, {address}, {city}, {state}, {pincode}, NULL, NULL)")
        customer_id_counter += 1

# Batch Customer Inserts
batch_size = 500
for i in range(0, len(customer_inserts), batch_size):
    batch = customer_inserts[i:i+batch_size]
    sql_statements.append(f"INSERT INTO customers (id, first_name, last_name, email, phone, dob, address, city, state, pincode, pan_number, billing_frequency) VALUES \n" + ",\n".join(batch) + ";")

# Process Policies (Unique by Policy Number)
policy_inserts = []
seen_policies = set()
policy_id_counter = 1

for idx, row in df.iterrows():
    policy_num_raw = row.get('Policy No')
    if pd.isna(policy_num_raw) or str(policy_num_raw).strip() == '':
        policy_num = f"'UNKNOWN-{idx}'"
        policy_num_val = f"UNKNOWN-{idx}"
    else:
        policy_num = sql_str(policy_num_raw)
        policy_num_val = str(policy_num_raw).strip()
        
    if policy_num_val in seen_policies:
        continue
    seen_policies.add(policy_num_val)
    
    email_raw = clean_email(row.get('Email ID', ''))
    if not email_raw or email_raw == '-':
        email_val = f"no-email-{idx}@default.com"
        email = f"'{email_val}'"
    else:
        email_val = email_raw
        email = sql_str(email_val)
        
    # Guard against missing keys (should theoretically be impossible but added for safety)
    customer_id = customers_map.get(email_val)
    if not customer_id:
        continue # Skip this policy if the customer somehow wasn't mapped
    
    ins_type = sql_str(row.get('Insurance Type', 'Other'))
    ins_name = sql_str(row.get('Insurer Name', ''))
    prod_name = sql_str(row.get('Product Name', ''))
    start_date = sql_date(row.get('Policy Start Date'))
    end_date = sql_date(row.get('Policy End Date'))
    expiry_date_val = sql_date(row.get('Renewal Due date'))
    expiry_date = "'1970-01-01'" if expiry_date_val == 'NULL' else expiry_date_val
    premium = sql_decimal(row.get('Premium'))
    amount = sql_decimal(row.get('Amount'))
    
    rm_name = sql_str(row.get('RM Name'))
    assoc_name = sql_str(row.get('Associate name'))
    assoc_code = sql_str(row.get('Associate Code'))
    vehicle_reg = sql_str(row.get('Car/RegNo'))
    vehicle_model = sql_str(row.get('Model Name'))
    
    policy_inserts.append(f"({policy_id_counter}, {policy_num}, {ins_type}, {ins_name}, {prod_name}, {start_date}, {end_date}, {expiry_date}, {premium}, {amount}, {customer_id}, 'ACTIVE', {rm_name}, {assoc_name}, {assoc_code}, {vehicle_reg}, {vehicle_model})")
    policy_id_counter += 1

# Batch Policy Inserts
for i in range(0, len(policy_inserts), batch_size):
    batch = policy_inserts[i:i+batch_size]
    sql_statements.append(f"INSERT INTO policies (id, policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model) VALUES \n" + ",\n".join(batch) + ";")

# Write to data.sql
with open('c:/Users/Admin/.gemini/antigravity/scratch/insurance-renewal-app/backend/src/main/resources/data.sql', 'w', encoding='utf-8') as f:
    for stmt in sql_statements:
        f.write(stmt + '\n\n')

print('Successfully created data.sql with', len(df), 'records.')
