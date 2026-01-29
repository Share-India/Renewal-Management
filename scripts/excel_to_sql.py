import pandas as pd
import datetime
import os

# Configuration
excel_path = r'c:\Users\Sagar Dagle\.gemini\antigravity\scratch\insurance-renewal-app\backend\target\classes\Copy of Renewal Data 2024-25-26.xlsx'
sql_path = r'c:\Users\Sagar Dagle\.gemini\antigravity\scratch\insurance-renewal-app\backend\src\main\resources\data.sql'

def escape_sql(val):
    if pd.isna(val) or str(val).lower() == 'nan' or str(val).lower() == 'null':
        return 'NULL'
    # If it's already a string that looks like a clean number, just return string
    val_str = str(val).strip()
    if not val_str:
        return 'NULL'
    return "'" + val_str.replace("'", "''") + "'"

def format_date(val):
    # ... (same as before) ...
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
    
    with open(sql_path, 'a', encoding='utf-8') as f:
        f.write("\n\n-- Bulk Import Final Fix " + str(datetime.datetime.now()) + " --\n")
        
        for index, row in df.iterrows():
            
            # --- PHONE NUMBER HANDLING ---
            raw_phone = row.get('Contact Number')
            # 1. Handle NaNs
            if pd.isna(raw_phone):
                phone_list = "NULL"
            else:
                # 2. Convert to string, remove decimal points (e.g., 98201.0 -> 98201)
                s_phone = str(raw_phone).replace('.0', '').strip()
                # 3. Handle '0' or empty
                if s_phone == '0' or not s_phone:
                    phone_sql = "NULL"
                else:
                    phone_sql = f"'{s_phone}'"

            # --- Other Columns ---
            full_name = str(row.get('Customer Name', '')).strip()
            first_name = full_name.split(' ')[0] if full_name else 'Unknown'
            last_name = ' '.join(full_name.split(' ')[1:]) if len(full_name.split(' ')) > 1 else '.'
            
            email = str(row.get('Email ID', '')).strip()
             # Basic cleanup for email "nan"
            if email.lower() == 'nan' or not email:
                 # Use a dummy email to satisfy UNIQUE constraint if necessary, or allow NULL/Empty if schema permits
                 # Schema says unique=true, nullable=false usually. So we need a dummy unique email.
                 email = f"no_email_{index}_{datetime.datetime.now().timestamp()}@example.com"

            address = str(row.get('Address 1', '')).strip()
            city = str(row.get('City', '')).strip()
            state = str(row.get('State', '')).strip()
            billing = str(row.get('Billing Frequency', '')).strip()
            
            cust_sql = f"""
INSERT INTO customers (first_name, last_name, email, phone, address, city, state, billing_frequency, created_at)
VALUES ({escape_sql(first_name)}, {escape_sql(last_name)}, '{email}', {phone_sql}, 
        {escape_sql(address)}, {escape_sql(city)}, {escape_sql(state)}, {escape_sql(billing)}, NOW())
ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(id), phone=VALUES(phone);
SET @cust_id = LAST_INSERT_ID();
"""
            f.write(cust_sql)

            # --- Policy Data (Same as before) ---
            p_number = str(row.get('Policy Number', '')).strip()
            if not p_number or p_number.lower() == 'nan':
                p_number = f"DRAFT-{index}-{datetime.datetime.now().timestamp()}"
            
            ins_name = str(row.get('Insurer Name', '')).strip()
            prod_name = str(row.get('Product Name', '')).strip()
            start_date = format_date(row.get('Policy Start Date'))
            end_date = format_date(row.get('Policy End Date'))
            expiry_date = format_date(row.get('Renewal Due date'))
            amount = clean_decimal(row.get('Due Premium'))
            due_premium = clean_decimal(row.get('Due Premium'))
            rm_name = str(row.get('RM Name', '')).strip()
            assoc_name = str(row.get('Associate name', '')).strip()
            assoc_code = str(row.get('Associate Code', '')).strip()
            veh_reg = str(row.get('Car/RegNo', '')).strip()
            veh_model = str(row.get('Model Name', '')).strip()
            
            policy_sql = f"""
INSERT INTO policies (policy_number, customer_id, insurance_name, product_name, type, 
                      policy_start_date, policy_end_date, expiry_date, 
                      amount, due_premium, status, 
                      rm_name, associate_name, associate_code, 
                      vehicle_reg_no, vehicle_model, created_at)
VALUES ({escape_sql(p_number)}, @cust_id, {escape_sql(ins_name)}, {escape_sql(prod_name)}, 'General',
        {start_date}, {end_date}, {expiry_date},
        {amount}, {due_premium}, 'ACTIVE',
        {escape_sql(rm_name)}, {escape_sql(assoc_name)}, {escape_sql(assoc_code)},
        {escape_sql(veh_reg)}, {escape_sql(veh_model)}, NOW())
ON DUPLICATE KEY UPDATE amount=VALUES(amount);
"""
            f.write(policy_sql)
            
    print(f"Successfully processed {len(df)} rows.")

except Exception as e:
    print(f"FAILED: {e}")
    import traceback
    traceback.print_exc()
