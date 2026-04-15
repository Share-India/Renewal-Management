import pandas as pd
import math
import re
import os

excel_path = "backend/src/main/resources/Delhi_Data.xlsx"
sql_path = "delhi_data_insert.sql"

if not os.path.exists(excel_path):
    print(f"Error: {excel_path} not found.")
    exit(1)

df = pd.read_excel(excel_path)

# Ensure NaN is cleaned
df = df.replace({math.nan: None})

def clean_sql(val):
    if val is None:
        return "NULL"
    if isinstance(val, str):
        val = val.replace("'", "''")
        return f"'{val.strip()}'"
    return str(val)

customers_dict = {}

# Start generating SQL, no DELETE, to append data safely.
sql_script = "SET FOREIGN_KEY_CHECKS=0;\n\n"

seen_emails = set()
seen_policies = set()

for index, row in df.iterrows():
    # Customer Data Construction
    c_name = str(row.get('Customer Name', ''))
    if " " in c_name:
        first_name, last_name = c_name.split(" ", 1)
    else:
        first_name = c_name
        last_name = ""

    # Check if we already processed this exact customer name to reuse their ID, saving DB rows
    if c_name not in customers_dict:
        var_name = f"@curr_c_{index}"
        customers_dict[c_name] = var_name
        
        raw_email = str(row.get('Email ID', '')).strip()
        raw_email = re.sub(r'[^a-zA-Z0-9@._-]', '', raw_email)
        
        if not raw_email or raw_email == '-' or raw_email.lower() == 'nan' or raw_email == '0':
            email = f"no-email-dl-{index}@default.com"
        else:
            email = f"dl-{index}-{raw_email}" # Prefix to ensure no collision with live/Mumbai data
            
        if email.lower() in seen_emails:
             email = f"duplicate-dl-{index}-{email}"
             
        seen_emails.add(email.lower())
        
        phone = row.get('Contact No') if row.get('Contact No') and str(row.get('Contact No')).strip() != '-' else "0"
        
        dob = clean_sql(row.get('DOB').strftime('%Y-%m-%d') if pd.notnull(row.get('DOB')) and hasattr(row.get('DOB'), 'strftime') else None)
        
        address = clean_sql(row.get('Address 1'))
        city = clean_sql(row.get('City'))
        state = clean_sql(row.get('State'))
        pincode = clean_sql(row.get('Pin Code'))
        
        # INSERT IGNORE to prevent collisions and crashes with pre-existing records on AWS
        sql_script += f"INSERT IGNORE INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) "
        sql_script += f"VALUES ({clean_sql(first_name)}, {clean_sql(last_name)}, {clean_sql(email)}, {clean_sql(phone)}, {dob}, {address}, {city}, {state}, 'Delhi', {pincode}, NULL, NULL);\n"
        sql_script += f"SET {var_name} = LAST_INSERT_ID();\n\n"
    else:
        var_name = customers_dict[c_name]
        
    # Policy Construction
    raw_p_num = str(row.get('Policy No', '')).strip()
    raw_p_num = re.sub(r'[^a-zA-Z0-9/.\s-]', '', raw_p_num)
    
    if not raw_p_num or raw_p_num == '-' or raw_p_num.lower() == 'nan':
        raw_p_num = f"NO-POLICY-DL-{index}"
    
    if raw_p_num.upper() in seen_policies:
        raw_p_num = f"{raw_p_num}-DUP-{index}"
        
    seen_policies.add(raw_p_num.upper())
    
    p_num = clean_sql(raw_p_num)
    p_type = clean_sql(row.get('Insurance Type')) if pd.notnull(row.get('Insurance Type')) else "'Miscellaneous Insurance'"
    i_name = clean_sql(row.get('Insurer Name'))
    prod_name = clean_sql(row.get('Product Name'))
    
    ps_date = clean_sql(row.get('Policy Start Date').strftime('%Y-%m-%d') if pd.notnull(row.get('Policy Start Date')) and hasattr(row.get('Policy Start Date'), 'strftime') else None)
    pe_date = clean_sql(row.get('Policy End Date').strftime('%Y-%m-%d') if pd.notnull(row.get('Policy End Date')) and hasattr(row.get('Policy End Date'), 'strftime') else None)
    px_date = clean_sql(row.get('Renewal Due date').strftime('%Y-%m-%d') if pd.notnull(row.get('Renewal Due date')) and hasattr(row.get('Renewal Due date'), 'strftime') else '1970-01-01')
    
    prem = clean_sql(row.get('Premium')) if pd.notnull(row.get('Premium')) else "0.0"
    amt = clean_sql(row.get('Amount')) if pd.notnull(row.get('Amount')) else "0.0"
    
    rm_name = clean_sql(row.get('RM Name'))
    asc_name = clean_sql(row.get('Associate name'))
    asc_code = clean_sql(row.get('Associate Code'))
    
    v_reg = clean_sql(row.get('Car/RegNo'))
    v_mod = clean_sql(row.get('Model Name'))
    
    # We set Branch to Delhi
    branch = "'Delhi'"
    
    # Use INSERT IGNORE to skip if police_number already exists!
    sql_script += f"INSERT IGNORE INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) "
    sql_script += f"VALUES ({p_num}, {p_type}, {i_name}, {prod_name}, {ps_date}, {pe_date}, {px_date}, {prem}, {amt}, {var_name}, 'ACTIVE', {rm_name}, {asc_name}, {asc_code}, {v_reg}, {v_mod}, {branch});\n\n"

sql_script += "SET FOREIGN_KEY_CHECKS=1;\n"

with open(sql_path, 'w', encoding='utf-8') as f:
    f.write(sql_script)

print(f"Successfully generated {sql_path} safely. It can be run on AWS or local without dropping any existing records.")
