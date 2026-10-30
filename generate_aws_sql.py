import openpyxl
import datetime
import uuid
import sys
import os

def parse_date(val):
    if val is None or val == '' or str(val).strip().lower() in ['none', '-', 'null', '00:00:00']:
        return None
    if isinstance(val, (datetime.datetime, datetime.date)):
        if 1900 <= val.year <= 2099:
            return val.strftime('%Y-%m-%d')
        return None
    val_str = str(val).strip()
    for fmt in ('%Y-%m-%d', '%d-%m-%Y', '%d/%m/%Y', '%m/%d/%Y', '%Y/%m/%d'):
        try:
            d = datetime.datetime.strptime(val_str, fmt)
            if 1900 <= d.year <= 2099:
                return d.strftime('%Y-%m-%d')
            return None
        except ValueError:
            pass
    return None

def parse_decimal(val):
    if val is None or str(val).strip() in ['', '-', 'none', 'null']:
        return 0.00
    try:
        if isinstance(val, (int, float)):
            return round(float(val), 2)
        val_str = str(val).replace(',', '').strip()
        return round(float(val_str), 2)
    except Exception:
        return 0.00

def clean_str(val, max_len=250):
    if val is None:
        return None
    s = str(val).strip()
    if s.lower() in ['', 'none', 'null', '-']:
        return None
    return s[:max_len]

def parse_name(name_str):
    if not name_str or str(name_str).strip() == '':
        return 'Unknown', ''
    s = str(name_str).strip()
    if ' ' in s:
        parts = s.split(' ', 1)
        return clean_str(parts[0], 100), clean_str(parts[1], 150)
    return clean_str(s, 100), ''

def clean_phone(val):
    if val is None or str(val).strip() in ['', '-', 'none', 'null']:
        return None
    if isinstance(val, (int, float)):
        return str(int(val))
    s = str(val).strip()
    if s.endswith('.0'):
        s = s[:-2]
    return s[:50]

def determine_branch(city, state):
    c_lower = (city or '').lower()
    s_lower = (state or '').lower()
    if 'delhi' in c_lower or 'delhi' in s_lower:
        return 'Delhi'
    if 'noida' in c_lower or 'noida' in s_lower:
        return 'Noida'
    return 'Mumbai'

def norm_pol(val):
    if not val:
        return ''
    return str(val).strip().replace('\xad', '').replace('\xa0', ' ')

def sql_escape(val):
    if val is None:
        return 'NULL'
    s = str(val).replace("'", "''").replace('\\', '\\\\')
    return f"'{s}'"

def generate_sql():
    print("=" * 65)
    print("GENERATING AWS PRODUCTION SQL SCRIPT")
    print("=" * 65)

    excel_path = 'Renewal Apr 26 to Mar 27.xlsx'
    sql_output_path = 'aws_renewal_upsert_2026_2027.sql'

    print(f"Reading Excel: {excel_path}...")
    wb = openpyxl.load_workbook(excel_path, read_only=True)
    sheet = wb['Main Sheet']
    rows = sheet.iter_rows(values_only=True)
    headers = next(rows)
    header_map = {str(h).strip(): idx for idx, h in enumerate(headers) if h is not None}

    excel_records = {}
    skipped_blank = 0
    duplicate_count = 0

    for r in rows:
        p_raw = r[header_map['Policy No']]
        if not p_raw or str(p_raw).strip() == '':
            skipped_blank += 1
            continue
        pol_no = norm_pol(p_raw)
        if pol_no in excel_records:
            duplicate_count += 1
        excel_records[pol_no] = r

    print(f"Skipped blank trailing rows: {skipped_blank}")
    print(f"Unique policy records:        {len(excel_records)}")
    if duplicate_count > 0:
        print(f"Duplicates resolved:          {duplicate_count}")

    today_str = datetime.date.today().strftime('%Y-%m-%d')
    print(f"Reference Date:               {today_str}")

    # Build SQL file
    print(f"\nWriting statements to: {sql_output_path}...")
    
    with open(sql_output_path, 'w', encoding='utf-8') as f:
        f.write("-- =========================================================================\n")
        f.write("-- SHARE INDIA INSURANCE BROKERS - RENEWAL SYSTEM (AWS SERVER IMPORT)\n")
        f.write(f"-- Source File: Renewal Apr 26 to Mar 27.xlsx\n")
        f.write(f"-- Generated At: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write(f"-- Total Policies: {len(excel_records)}\n")
        f.write("-- =========================================================================\n\n")

        f.write("SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;\n")
        f.write("SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';\n")
        f.write("SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;\n")
        f.write("SET NAMES utf8mb4;\n\n")
        f.write("START TRANSACTION;\n\n")

        # Track unique emails used for customers to avoid writing duplicate customer inserts
        seen_emails = {}
        customer_sql_buffer = []
        policy_sql_buffer = []

        for pol_no, r in excel_records.items():
            # Customer fields
            c_first, c_last = parse_name(r[header_map['Customer Name']])
            raw_email = clean_str(r[header_map['Email ID']])
            c_email = raw_email.lower() if raw_email else None
            c_phone = clean_phone(r[header_map['Contact No']])
            c_dob = parse_date(r[header_map['DOB']])
            c_addr = clean_str(r[header_map['Address 1']], 500)
            c_city = clean_str(r[header_map['City']])
            c_state = clean_str(r[header_map['State']])
            c_pin = clean_str(r[header_map['Pin Code']], 20)
            c_freq = clean_str(r[header_map['Billing Frequency']])

            # Determine email to use
            if not c_email:
                if c_phone and c_phone != '0':
                    c_email = f"dummy_{c_phone}@example.com"
                else:
                    c_email = f"dummy_{uuid.uuid4().hex[:8]}@example.com"

            # Customer insert / update SQL
            c_first_sql = sql_escape(c_first)
            c_last_sql = sql_escape(c_last)
            c_email_sql = sql_escape(c_email)
            c_phone_sql = sql_escape(c_phone)
            c_dob_sql = f"'{c_dob}'" if c_dob else "NULL"
            c_addr_sql = sql_escape(c_addr)
            c_city_sql = sql_escape(c_city)
            c_state_sql = sql_escape(c_state)
            c_pin_sql = sql_escape(c_pin)
            c_freq_sql = sql_escape(c_freq)

            # Write customer upsert
            cust_stmt = (
                f"INSERT INTO customers (email, first_name, last_name, phone, dob, address, city, state, pincode, billing_frequency, created_at) "
                f"VALUES ({c_email_sql}, {c_first_sql}, {c_last_sql}, {c_phone_sql}, {c_dob_sql}, {c_addr_sql}, {c_city_sql}, {c_state_sql}, {c_pin_sql}, {c_freq_sql}, NOW()) "
                f"ON DUPLICATE KEY UPDATE "
                f"first_name=VALUES(first_name), last_name=VALUES(last_name), "
                f"phone=COALESCE(VALUES(phone), phone), dob=COALESCE(VALUES(dob), dob), "
                f"address=COALESCE(VALUES(address), address), city=COALESCE(VALUES(city), city), "
                f"state=COALESCE(VALUES(state), state), pincode=COALESCE(VALUES(pincode), pincode), "
                f"billing_frequency=COALESCE(VALUES(billing_frequency), billing_frequency);\n"
            )
            customer_sql_buffer.append(cust_stmt)

            # Policy fields
            p_type = clean_str(r[header_map['Insurance Type']]) or 'General'
            p_ins_name = clean_str(r[header_map['Insurer Name']])
            p_prod_name = clean_str(r[header_map['Product Name']])
            p_start = parse_date(r[header_map['Policy Start Date']])
            p_end = parse_date(r[header_map['Policy End Date']])
            p_expiry = parse_date(r[header_map['Renewal Due date']]) or p_end
            if p_end is None and p_expiry is not None:
                p_end = p_expiry
            if p_start is None and p_end is not None:
                try:
                    end_dt = datetime.datetime.strptime(p_end, '%Y-%m-%d')
                    p_start = (end_dt.replace(year=end_dt.year - 1) + datetime.timedelta(days=1)).strftime('%Y-%m-%d')
                except Exception:
                    pass

            p_amount = parse_decimal(r[header_map['Amount']])
            p_premium = parse_decimal(r[header_map['Premium']])
            p_rm_name = clean_str(r[header_map['RM Name']])
            p_rm_email = clean_str(r[header_map['RM Email']])
            p_assoc_name = clean_str(r[header_map['Associate name']])
            p_assoc_code = clean_str(r[header_map['Associate Code']])
            p_v_reg = clean_str(r[header_map['Car/RegNo']])
            p_model = clean_str(r[header_map['Model Name']])
            p_mgf = clean_str(r[header_map['Mgf Year']])
            if p_mgf and p_model and p_mgf not in p_model:
                p_model = f"{p_model} ({p_mgf})"[:250]

            p_status = 'ACTIVE' if (p_expiry and p_expiry >= today_str) else 'EXPIRED'
            branch = determine_branch(c_city, c_state)

            pol_no_sql = sql_escape(pol_no)
            p_type_sql = sql_escape(p_type)
            p_ins_name_sql = sql_escape(p_ins_name)
            p_prod_name_sql = sql_escape(p_prod_name)
            p_start_sql = f"'{p_start}'" if p_start else "NULL"
            p_end_sql = f"'{p_end}'" if p_end else "NULL"
            p_expiry_sql = f"'{p_expiry}'" if p_expiry else f"'{today_str}'"
            p_rm_name_sql = sql_escape(p_rm_name)
            p_rm_email_sql = sql_escape(p_rm_email)
            p_assoc_name_sql = sql_escape(p_assoc_name)
            p_assoc_code_sql = sql_escape(p_assoc_code)
            p_v_reg_sql = sql_escape(p_v_reg)
            p_model_sql = sql_escape(p_model)
            branch_sql = sql_escape(branch)

            pol_stmt = (
                f"INSERT INTO policies ("
                f"policy_number, customer_id, type, insurance_name, product_name, "
                f"policy_start_date, policy_end_date, expiry_date, amount, due_premium, "
                f"status, rm_name, rm_email, associate_name, associate_code, "
                f"vehicle_reg_no, vehicle_model, branch, target_team, created_at) "
                f"VALUES ("
                f"{pol_no_sql}, (SELECT id FROM customers WHERE email={c_email_sql} LIMIT 1), "
                f"{p_type_sql}, {p_ins_name_sql}, {p_prod_name_sql}, "
                f"{p_start_sql}, {p_end_sql}, {p_expiry_sql}, {p_amount}, {p_premium}, "
                f"'{p_status}', {p_rm_name_sql}, {p_rm_email_sql}, {p_assoc_name_sql}, {p_assoc_code_sql}, "
                f"{p_v_reg_sql}, {p_model_sql}, {branch_sql}, 'RENEWER', NOW()) "
                f"ON DUPLICATE KEY UPDATE "
                f"type=VALUES(type), insurance_name=VALUES(insurance_name), product_name=VALUES(product_name), "
                f"policy_start_date=VALUES(policy_start_date), policy_end_date=VALUES(policy_end_date), "
                f"expiry_date=VALUES(expiry_date), amount=VALUES(amount), due_premium=VALUES(due_premium), "
                f"status=VALUES(status), rm_name=VALUES(rm_name), rm_email=VALUES(rm_email), "
                f"associate_name=VALUES(associate_name), associate_code=VALUES(associate_code), "
                f"vehicle_reg_no=VALUES(vehicle_reg_no), vehicle_model=VALUES(vehicle_model), "
                f"branch=COALESCE(NULLIF(branch, ''), VALUES(branch)), "
                f"customer_id=COALESCE((SELECT id FROM customers WHERE email={c_email_sql} LIMIT 1), customer_id);\n"
            )
            policy_sql_buffer.append(pol_stmt)

        # Write customer statements
        f.write("-- 1. CUSTOMERS UPSERT\n")
        f.writelines(customer_sql_buffer)

        # Write policy statements
        f.write("\n-- 2. POLICIES UPSERT\n")
        f.writelines(policy_sql_buffer)

        # Write reminder synchronization statements
        f.write("\n-- 3. REMINDERS SYNCHRONIZATION (CREATE FOR ALL NEW POLICIES)\n")
        f.write("INSERT INTO reminders (policy_id, reminder_status, follow_up_required, last_call_outcome, created_at)\n")
        f.write("SELECT p.id, 'PENDING', 0, 'Pending', NOW()\n")
        f.write("FROM policies p\n")
        f.write("LEFT JOIN reminders r ON r.policy_id = p.id\n")
        f.write("WHERE r.id IS NULL;\n\n")

        f.write("-- 4. RESET STALE REMINDERS FOR ACTIVE RENEWAL POLICIES\n")
        f.write("UPDATE reminders r\n")
        f.write("JOIN policies p ON r.policy_id = p.id\n")
        f.write("SET r.reminder_status = 'PENDING', r.last_call_outcome = 'Pending'\n")
        f.write("WHERE p.expiry_date >= '2026-11-01'\n")
        f.write("  AND LOWER(r.last_call_outcome) IN ('renewed', 'pending issuance', 'externally renewed');\n\n")

        # Commit and cleanup
        f.write("COMMIT;\n\n")
        f.write("SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;\n")
        f.write("SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;\n")
        f.write("SET SQL_MODE=@OLD_SQL_MODE;\n")
        f.write("-- ======================== END OF SCRIPT ========================\n")

    file_size_mb = os.path.getsize(sql_output_path) / (1024 * 1024)
    print(f"SUCCESS: Generated {sql_output_path} ({file_size_mb:.2f} MB)")

if __name__ == '__main__':
    generate_sql()
