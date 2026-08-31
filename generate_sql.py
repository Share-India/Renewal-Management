import pandas as pd
import numpy as np
import datetime
import math
import uuid

def clean_val(val):
    if pd.isna(val) or val == '' or val == '-':
        return None
    if isinstance(val, str):
        val = val.strip()
        if val == '' or val == '-':
            return None
    return val

def generate_sql():
    df = pd.read_excel('backend/src/main/resources/Renewal data 30.7.2026.xlsx', header=0)
    
    # Rename columns to lower case
    df.columns = [str(c).lower().strip() for c in df.columns]
    
    # Map header variations
    def get_col(names):
        for n in names:
            if n in df.columns:
                return n
        return None
        
    sql_lines = []
    email_to_name = {}
    resolved_emails = {}
    
    for idx, row in df.iterrows():
        policy_no = clean_val(row.get(get_col(['policy no', 'policy no 1', 'policy number'])))
        if not policy_no:
            continue
            
        customer_name = clean_val(row.get(get_col(['customer name']))) or 'Unknown'
        parts = customer_name.split(' ', 1)
        first_name = parts[0]
        last_name = parts[1] if len(parts) > 1 else 'Unknown'
        first_name_lower = first_name.lower()
        
        # CUSTOMER DATA
        email = clean_val(row.get(get_col(['email id', 'email'])))
        phone = clean_val(row.get(get_col(['contact no', 'phone'])))
        
        if not email:
            if phone:
                email = f"dummy_{phone}@example.com"
            else:
                email = f"dummy_{uuid.uuid4().hex[:8]}@example.com"
                
        email = str(email).lower()
        original_email = email
        
        # Prevent customer overwriting if they share the same email or phone dummy email
        if (original_email, first_name_lower) in resolved_emails:
            email = resolved_emails[(original_email, first_name_lower)]
        elif original_email in email_to_name:
            if email_to_name[original_email].split(' ')[0].lower() != first_name_lower:
                email = f"{uuid.uuid4().hex[:5]}_{original_email}"
                resolved_emails[(original_email, first_name_lower)] = email
            else:
                resolved_emails[(original_email, first_name_lower)] = original_email
        else:
            email_to_name[original_email] = customer_name
            resolved_emails[(original_email, first_name_lower)] = original_email
                
        address = clean_val(row.get(get_col(['address 1', 'address'])))
        city = clean_val(row.get(get_col(['city'])))
        state = clean_val(row.get(get_col(['state'])))
        
        # Format date for SQL
        dob = clean_val(row.get(get_col(['dob'])))
        dob_str = "NULL"
        if isinstance(dob, datetime.datetime):
            dob_str = f"'{dob.strftime('%Y-%m-%d')}'"
            
        first_name_sql = first_name.replace("'", "''") if first_name else "Unknown"
        last_name_sql = last_name.replace("'", "''") if last_name else "Unknown"
            
        sql_lines.append(f"INSERT INTO customers (email, first_name, last_name, phone, address, city, state, dob) "
                         f"VALUES ('{email}', '{first_name_sql}', '{last_name_sql}', "
                         f"{repr(phone) if phone else 'NULL'}, {repr(address) if address else 'NULL'}, "
                         f"{repr(city) if city else 'NULL'}, {repr(state) if state else 'NULL'}, {dob_str}) "
                         f"ON DUPLICATE KEY UPDATE first_name=VALUES(first_name), last_name=VALUES(last_name), phone=VALUES(phone), "
                         f"address=VALUES(address), city=VALUES(city), state=VALUES(state), dob=VALUES(dob);\n")
                         
        # POLICY DATA
        insurance_type = clean_val(row.get(get_col(['insurance type']))) or 'General'
        insurer_name = clean_val(row.get(get_col(['insurer name'])))
        product_name = clean_val(row.get(get_col(['product name'])))
        rm_name = clean_val(row.get(get_col(['rm name'])))
        rm_email = clean_val(row.get(get_col(['rm email'])))
        
        assoc = clean_val(row.get(get_col(['associate name', 'associate'])))
        assoc_code = clean_val(row.get(get_col(['associate code'])))
        car_reg = clean_val(row.get(get_col(['car/regno', 'vehicle reg no'])))
        model = clean_val(row.get(get_col(['model name', 'vehicle model'])))
        
        premium = clean_val(row.get(get_col(['premium'])))
        amount = clean_val(row.get(get_col(['amout', 'amount', 'premium'])))
        
        prem_val = float(premium) if premium else "NULL"
        amt_val = float(amount) if amount else 0.0
        
        def get_date(names):
            d = clean_val(row.get(get_col(names)))
            if isinstance(d, datetime.datetime):
                return f"'{d.strftime('%Y-%m-%d')}'"
            return "NULL"
            
        start_date = get_date(['policy start date', 'start date'])
        end_date = get_date(['policy end date', 'renewal end date'])
        expiry = get_date(['renewal due date', 'expiry date'])
        if expiry == "NULL":
            expiry = f"'{datetime.datetime.now().strftime('%Y-%m-%d')}'"
            
        status = 'ACTIVE'
        branch = 'Mumbai'
        target_team = 'RENEWER'
        
        ins_type_sql = insurance_type.replace("'", "''") if insurance_type else "General"
        
        sql_lines.append(f"INSERT INTO policies (policy_number, type, amount, due_premium, expiry_date, status, branch, "
                         f"target_team, insurance_name, product_name, rm_name, rm_email, associate_name, associate_code, "
                         f"vehicle_reg_no, vehicle_model, policy_start_date, policy_end_date, customer_id) "
                         f"VALUES ('{policy_no}', '{ins_type_sql}', {amt_val}, {prem_val}, {expiry}, '{status}', '{branch}', '{target_team}', "
                         f"{repr(insurer_name) if insurer_name else 'NULL'}, {repr(product_name) if product_name else 'NULL'}, "
                         f"{repr(rm_name) if rm_name else 'NULL'}, {repr(rm_email) if rm_email else 'NULL'}, "
                         f"{repr(assoc) if assoc else 'NULL'}, {repr(assoc_code) if assoc_code else 'NULL'}, "
                         f"{repr(car_reg) if car_reg else 'NULL'}, {repr(model) if model else 'NULL'}, "
                         f"{start_date}, {end_date}, (SELECT id FROM customers WHERE email='{email}')) "
                         f"ON DUPLICATE KEY UPDATE type=VALUES(type), amount=VALUES(amount), due_premium=VALUES(due_premium), "
                         f"expiry_date=VALUES(expiry_date), status=VALUES(status), branch=VALUES(branch), target_team=VALUES(target_team), "
                         f"insurance_name=VALUES(insurance_name), product_name=VALUES(product_name), rm_name=VALUES(rm_name), "
                         f"rm_email=VALUES(rm_email), associate_name=VALUES(associate_name), associate_code=VALUES(associate_code), "
                         f"vehicle_reg_no=VALUES(vehicle_reg_no), vehicle_model=VALUES(vehicle_model), policy_start_date=VALUES(policy_start_date), "
                         f"policy_end_date=VALUES(policy_end_date), customer_id=VALUES(customer_id);\n")

    with open('mumbai_data.sql', 'w', encoding='utf-8') as f:
        f.writelines(sql_lines)
        
    print("mumbai_data.sql generated successfully.")

if __name__ == '__main__':
    generate_sql()
