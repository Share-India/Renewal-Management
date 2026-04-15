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
        
        raw_email = str(row.get('Mail ID', '')).strip()
        raw_email = re.sub(r'[^a-zA-Z0-9@._-]', '', raw_email)
        
        if not raw_email or raw_email == '-' or raw_email.lower() == 'nan' or raw_email == '0':
            email = f"no-email-dl-{index}@default.com"
        else:
            email = f"dl-{index}-{raw_email}" # Prefix to ensure no collision with live/Mumbai data
            
        if email.lower() in seen_emails:
             email = f"duplicate-dl-{index}-{email}"
             
        seen_emails.add(email.lower())
        
        phone = row.get('Customer Ph No') if row.get('Customer Ph No') and str(row.get('Customer Ph No')).strip() != '-' else "0"
        
        dob = clean_sql(row.get('Dob').strftime('%Y-%m-%d') if pd.notnull(row.get('Dob')) and hasattr(row.get('Dob'), 'strftime') else None)
        
        # Address info not in Delhi Excel
        address = "NULL"
        city = "NULL"
        state = "NULL"
        pincode = "NULL"
        
        # We use ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(id) to safely skip duplicating customers, 
        # while STILL retrieving their exact ID to link their policies properly on re-runs!
        sql_script += f"INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) "
        sql_script += f"VALUES ({clean_sql(first_name)}, {clean_sql(last_name)}, {clean_sql(email)}, {clean_sql(phone)}, {dob}, {address}, {city}, {state}, 'Delhi', {pincode}, NULL, NULL) "
        sql_script += f"ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(id);\n"
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
    p_type = "'Miscellaneous Insurance'"
    i_name = "NULL" # Not in Delhi
    prod_name = clean_sql(row.get('Product'))
    
    ps_date = clean_sql(row.get('Policy Start Date').strftime('%Y-%m-%d') if pd.notnull(row.get('Policy Start Date')) and hasattr(row.get('Policy Start Date'), 'strftime') else None)
    pe_date = clean_sql(row.get('Policy End Date').strftime('%Y-%m-%d') if pd.notnull(row.get('Policy End Date')) and hasattr(row.get('Policy End Date'), 'strftime') else None)
    px_date = clean_sql(row.get('Renew Date').strftime('%Y-%m-%d') if pd.notnull(row.get('Renew Date')) and hasattr(row.get('Renew Date'), 'strftime') else '1970-01-01')
    
    prem = clean_sql(row.get('Total Due NET')) if pd.notnull(row.get('Total Due NET')) else "0.0"
    amt = clean_sql(row.get('NET')) if pd.notnull(row.get('NET')) else "0.0"
    
    rm_name = "NULL"
    asc_name = "NULL"
    asc_code = "NULL"
    v_reg = "NULL"
    v_mod = "NULL"
    
    # We set Branch to Delhi
    branch = "'Delhi'"
    
    # We use ON DUPLICATE KEY UPDATE to overwrite the previously corrupted import records 
    # from the last run without erroring out on pre-existing valid policies constraints.
    sql_script += f"INSERT INTO policies (policy_number, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, due_premium, amount, customer_id, status, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, branch) "
    sql_script += f"VALUES ({p_num}, {p_type}, {i_name}, {prod_name}, {ps_date}, {pe_date}, {px_date}, {prem}, {amt}, {var_name}, 'ACTIVE', {rm_name}, {asc_name}, {asc_code}, {v_reg}, {v_mod}, {branch}) "
    sql_script += f"ON DUPLICATE KEY UPDATE expiry_date=VALUES(expiry_date), policy_start_date=VALUES(policy_start_date), policy_end_date=VALUES(policy_end_date), product_name=VALUES(product_name), due_premium=VALUES(due_premium), amount=VALUES(amount);\n\n"


sql_script += "SET FOREIGN_KEY_CHECKS=1;\n"

with open(sql_path, 'w', encoding='utf-8') as f:
    f.write(sql_script)

print(f"Successfully generated {sql_path} safely. It can be run on AWS or local without dropping any existing records.")
