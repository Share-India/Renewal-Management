import pandas as pd
import datetime
import os

excel_path = r'c:\Users\Admin\.gemini\antigravity\scratch\insurance-renewal-app\backend\src\main\resources\AdditionalMumbai_data.xlsx'
sql_path = r'c:\Users\Admin\.gemini\antigravity\scratch\insurance-renewal-app\backend\src\main\resources\data.sql'

def escape_sql(val):
    if pd.isna(val) or str(val).lower() == 'nan' or str(val).lower() == 'null':
        return 'NULL'
    val_str = str(val).strip()
    if not val_str:
        return 'NULL'
    return "'" + val_str.replace("'", "''") + "'"

def format_date(val):
    if pd.isna(val) or str(val).lower() == 'nan':
        return 'NULL'
    try:
        if isinstance(val, str):
            pd.to_datetime(val) 
        return "'" + pd.to_datetime(val).strftime('%Y-%m-%d') + "'"
    except:
        return 'NULL'

def clean_decimal(val):
    if pd.isna(val):
        return '0.00'
    return str(float(val))

try:
    df = pd.read_excel(excel_path)
    
    with open(sql_path, 'w', encoding='utf-8') as f:
        f.write("INSERT IGNORE INTO branches (id, name) VALUES (1, 'Mumbai'), (2, 'Delhi'), (3, 'Noida');\n\n")
        
        for index, row in df.iterrows():
            
            # --- PHONE NUMBER HANDLING ---
            raw_phone = row.get('Contact No')
            if pd.isna(raw_phone):
                phone_list = "NULL"
                phone_sql = "NULL"
            else:
                s_phone = str(raw_phone).replace('.0', '').strip()
                if s_phone == '0' or not s_phone or s_phone == '-':
                    phone_sql = "NULL"
                else:
                    phone_sql = f"'{s_phone}'"

            # --- Other Columns ---
            full_name = str(row.get('Customer Name', '')).strip()
            if full_name.lower() == 'nan' or not full_name:
                full_name = 'Unknown'
            first_name = full_name.split(' ')[0]
            last_name = ' '.join(full_name.split(' ')[1:]) if len(full_name.split(' ')) > 1 else '.'
            
            email = str(row.get('Email ID', '')).strip()
            if email.lower() in ['nan', '-', 'na', 'n/a', 'none'] or not email:
                 email = f"no_email_{index}_{datetime.datetime.now().timestamp()}@example.com"

            address = str(row.get('Address 1', '')).strip()
            city = str(row.get('City', '')).strip()
            state = str(row.get('State', '')).strip()
            billing = str(row.get('Billing Frequency', '')).strip()
            
            # clean up hyphens in other string fields
            if address == '-': address = ''
            if city == '-': city = ''
            if state == '-': state = ''
            if billing == '-': billing = ''
            
            cust_sql = f"""
INSERT INTO customers (first_name, last_name, email, phone, address, city, state, billing_frequency, created_at)
VALUES ({escape_sql(first_name)}, {escape_sql(last_name)}, '{email}', {phone_sql}, 
        {escape_sql(address)}, {escape_sql(city)}, {escape_sql(state)}, {escape_sql(billing)}, NOW())
ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(id), phone=VALUES(phone);
SET @cust_id = LAST_INSERT_ID();
"""
            f.write(cust_sql)

            # --- Policy Data ---
            p_number = str(row.get('Policy No', '')).strip()
            if not p_number or p_number.lower() == 'nan':
                p_number = f"DRAFT-{index}-{datetime.datetime.now().timestamp()}"
            
            ins_name = str(row.get('Insurer Name', '')).strip()
            prod_name = str(row.get('Product Name', '')).strip()
            ins_type = str(row.get('Insurance Type', '')).strip()
            if not ins_type or ins_type.lower() in ['nan', '-']:
                ins_type = 'General'
            start_date = format_date(row.get('Policy Start Date'))
            end_date = format_date(row.get('Policy End Date'))
            expiry_date = format_date(row.get('Renewal Due date'))
            
            amount = row.get('Amount')
            amount = float(amount) if not pd.isna(amount) else 0.0
            due_premium = row.get('Premium')
            due_premium = float(due_premium) if not pd.isna(due_premium) else 0.0
            
            rm_name = str(row.get('RM Name', '')).strip()
            assoc_name = str(row.get('Associate name', '')).strip()
            assoc_code = str(row.get('Associate Code', '')).strip()
            veh_reg = str(row.get('Car/RegNo', '')).strip()
            veh_model = str(row.get('Model Name', '')).strip()

            policy_sql = f"""
INSERT INTO policies (policy_number, customer_id, insurance_name, product_name, type, 
                      policy_start_date, policy_end_date, expiry_date, 
                      amount, due_premium, status, branch,
                      rm_name, associate_name, associate_code, 
                      vehicle_reg_no, vehicle_model, created_at)
VALUES ({escape_sql(p_number)}, @cust_id, {escape_sql(ins_name)}, {escape_sql(prod_name)}, {escape_sql(ins_type)},
        {start_date}, {end_date}, {expiry_date},
        {amount}, {due_premium}, 'ACTIVE', 'Mumbai (Lost Cases)',
        {escape_sql(rm_name)}, {escape_sql(assoc_name)}, {escape_sql(assoc_code)},
        {escape_sql(veh_reg)}, {escape_sql(veh_model)}, NOW())
ON DUPLICATE KEY UPDATE customer_id=VALUES(customer_id), type=VALUES(type), amount=VALUES(amount), branch=VALUES(branch), due_premium=VALUES(due_premium), rm_name=VALUES(rm_name), associate_name=VALUES(associate_name), associate_code=VALUES(associate_code), policy_start_date=VALUES(policy_start_date), policy_end_date=VALUES(policy_end_date), expiry_date=VALUES(expiry_date);
"""
            f.write(policy_sql)
            
    print("SQL generation complete.")
except Exception as e:
    print(f"Error: {e}")
