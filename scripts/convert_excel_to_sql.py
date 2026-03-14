import pandas as pd
import datetime
import sys

def convert_excel_to_sql():
    input_file = 'backend/src/main/resources/Copy of Renewal Data 2024-25-26.xlsx'
    output_file = 'backend/src/main/resources/data.sql'

    print(f"Reading {input_file}...")
    try:
        df = pd.read_excel(input_file)
    except Exception as e:
        print(f"Error reading Excel: {e}")
        return

    sql_statements = []
    
    customers_vals = []
    policies_vals = []
    reminders_vals = []
    sql_statements.append("SET FOREIGN_KEY_CHECKS = 0;")
    sql_statements.append("SET UNIQUE_CHECKS = 0;") # Disable unique checks for speed/safety during bulk load?
    sql_statements.append("")

    seen_emails = set()
    
    # 1-based IDs
    customer_id = 1
    policy_id = 1
    
    # Column Mapping Helpers
    # Excel Headers: ['Sr. No.', 'Customer Name', 'DOB', 'Contact Number', 'Email ID', 'Policy Number', 'Insurance Type', 'Insurer Name', 'Policy issue date', 'Policy Start Date', 'Policy End Date', 'Renewal Due date', 'Product Name', 'Due Premium', 'Due Net Premium', 'RM Name', 'Associate name', 'Associate Code', 'Address 1', 'City', 'State', 'Pin Code', ... 'Payment Date']

    print(f"Processing {len(df)} rows...")
    
    for idx, row in df.iterrows():
        # --- 1. Expiry Date Check (Mandatory) ---
        # Prioritize 'Policy End Date', fallback to 'Renewal Due date'
        expiry_val = row.get('Policy End Date')
        if pd.isna(expiry_val):
            expiry_val = row.get('Renewal Due date')
        
        if pd.isna(expiry_val):
            # SKIP record if no expiry date (Validation Rule)
            continue
            
        try:
            expiry_date_str = pd.to_datetime(expiry_val).strftime('%Y-%m-%d')
        except:
            # Skip if invalid date format
            continue

        # --- 2. Start Date Check (Optional) ---
        start_val = row.get('Policy Start Date')
        policy_start_date_sql = "NULL"
        if not pd.isna(start_val):
            try:
                policy_start_date_sql = f"'{pd.to_datetime(start_val).strftime('%Y-%m-%d')}'"
            except:
                pass # Keep as NULL

        # --- 3. Customer Data ---
        full_name = str(row.get('Customer Name', '')).strip()
        parts = full_name.split(' ', 1)
        first_name = parts[0][:50].replace("'", "''") # Truncate to be safe?
        last_name = parts[1][:50].replace("'", "''") if len(parts) > 1 else "."
        if not first_name: first_name = "Unknown"

        raw_email = str(row.get('Email ID', '')).strip()
        if not raw_email or raw_email.lower() == 'nan':
            email = f"missing_{customer_id}@placeholder.com"
        else:
            email = raw_email.replace("'", "")
        
        # Ensure Uniqueness
        email_lower = email.lower()
        if email_lower in seen_emails:
            email = f"{email.split('@')[0]}_{customer_id}@{email.split('@')[-1]}"
            email_lower = email.lower()
        seen_emails.add(email_lower)

        phone = str(row.get('Contact Number', '')).replace("'", "").split('.')[0] # Remove decimal if float
        if len(phone) > 20: phone = phone[:20]
        
        billing_freq = str(row.get('Billing Frequency', 'Yearly')).replace("'", "")
        
        # DOB
        dob_val = row.get('DOB')
        dob_sql = "NULL"
        if not pd.isna(dob_val):
            try:
                dob_sql = f"'{pd.to_datetime(dob_val).strftime('%Y-%m-%d')}'"
            except:
                pass

        # Address Mapping
        addr = str(row.get('Address 1', '')).replace("'", "''")
        pin = str(row.get('Pin Code', '')).replace("'", "''")
        full_address = f"{addr}, {pin}".strip(", ")
        city = str(row.get('City', '')).replace("'", "''")
        state = str(row.get('State', '')).replace("'", "''")

        # --- 4. Policy Data ---
        policy_num = str(row.get('Policy Number', f'MISSING-{idx}')).strip().replace("'", "")
        if not policy_num or policy_num.lower() == 'nan':
            policy_num = f"GEN-POL-{idx}"
            
        ins_name = str(row.get('Insurer Name', '')).strip().replace("'", "''")
        prod_name = str(row.get('Product Name', '')).strip().replace("'", "''")
        
        # Amount / Premium
        try:
            amt_val = float(row.get('Due Premium', 0))
            if pd.isna(amt_val): amt_val = 0
        except:
            amt_val = 0
        
        try:
            due_prem_val = float(row.get('Due Net Premium', 0))
            if pd.isna(due_prem_val): due_prem_val = 0
        except:
            due_prem_val = 0

        # Others
        rm_name = str(row.get('RM Name', '')).replace("'", "''")
        assoc_name = str(row.get('Associate name', '')).replace("'", "''")
        assoc_code = str(row.get('Associate Code', '')).replace("'", "''")
        veh_reg = str(row.get('Car/RegNo', '')).replace("'", "''")
        veh_model = str(row.get('Model Name', '')).replace("'", "''")
        
        # Determine Status 
        # Simple logic: Expired if expiry < today? Or just import as is?
        # User said "modify according to date" previously??
        # Usually logic: if expiry_date < today -> EXPIRED, else ACTIVE
        # I'll implement this simple logic.
        is_expired = pd.to_datetime(expiry_val).date() < datetime.date.today()
        status = "EXPIRED" if is_expired else "ACTIVE"

        # --- 5. Generate SQL ---
        
        # Customer INSERT
        customers_vals.append(
            f"({customer_id}, '{first_name}', '{last_name}', '{email}', '{phone}', '{billing_freq}', {dob_sql}, '{full_address}', '{city}', '{state}', NOW())"
        )

        # Policy INSERT
        ins_type = str(row.get('Insurance Type', 'Comprehensive')).replace("'", "''")

        policies_vals.append(
            f"({policy_id}, '{policy_num}', {customer_id}, '{ins_type}', {amt_val}, '{expiry_date_str}', '{status}', {policy_start_date_sql}, "
            f"'{ins_name}', '{prod_name}', {due_prem_val}, '{rm_name}', '{assoc_name}', '{assoc_code}', '{veh_reg}', '{veh_model}', NOW())"
        )

        # Reminder INSERT
        reminders_vals.append(
            f"({policy_id}, 'PENDING', 0, NOW())"
        )

        customer_id += 1
        policy_id += 1

    def chunker(seq, size):
        return (seq[pos:pos + size] for pos in range(0, len(seq), size))

    for chunk in chunker(customers_vals, 1000):
        sql_statements.append(
            "INSERT INTO customers (id, first_name, last_name, email, phone, billing_frequency, dob, address, city, state, created_at) VALUES\n" + 
            ",\n".join(chunk) + 
            "\nON DUPLICATE KEY UPDATE dob=VALUES(dob), first_name=VALUES(first_name), last_name=VALUES(last_name), email=VALUES(email), phone=VALUES(phone), address=VALUES(address), city=VALUES(city), state=VALUES(state);"
        )

    for chunk in chunker(policies_vals, 1000):
        sql_statements.append(
            "INSERT INTO policies (id, policy_number, customer_id, type, amount, expiry_date, status, policy_start_date, insurance_name, product_name, due_premium, rm_name, associate_name, associate_code, vehicle_reg_no, vehicle_model, created_at) VALUES\n" + 
            ",\n".join(chunk) + 
            "\nON DUPLICATE KEY UPDATE id=id;"
        )

    for chunk in chunker(reminders_vals, 1000):
        sql_statements.append(
            "INSERT INTO reminders (policy_id, reminder_status, follow_up_required, created_at) VALUES\n" + 
            ",\n".join(chunk) + 
            "\nON DUPLICATE KEY UPDATE id=id;"
        )

    sql_statements.append("")
    sql_statements.append("SET FOREIGN_KEY_CHECKS = 1;")
    sql_statements.append("SET UNIQUE_CHECKS = 1;")
    
    print(f"Generated {len(sql_statements)} lines of SQL.")
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("\n".join(sql_statements))
    print(f"Written to {output_file}")

if __name__ == "__main__":
    convert_excel_to_sql()
