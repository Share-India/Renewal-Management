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
    s = s.replace('\u202c', '').replace('\u202d', '')
    return s[:50]

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

def norm_pol(val):
    if not val:
        return ''
    return str(val).strip().replace('\xad', '').replace('\xa0', ' ')

def sql_escape(val):
    if val is None:
        return 'NULL'
    s = str(val).replace("'", "''").replace('\\', '\\\\')
    return f"'{s}'"

def generate_dedup_script():
    excel_path = 'Renewal Apr 26 to Mar 27.xlsx'
    sql_path = 'aws_dedup_and_fix_policies.sql'

    print("Reading Excel...")
    wb = openpyxl.load_workbook(excel_path, read_only=True)
    sheet = wb['Main Sheet']
    rows = sheet.iter_rows(values_only=True)
    headers = next(rows)
    header_map = {str(h).strip(): idx for idx, h in enumerate(headers) if h is not None}

    excel_policies = {}
    for r in rows:
        p_raw = r[header_map['Policy No']]
        if not p_raw or str(p_raw).strip() == '':
            continue
        pol_no = norm_pol(p_raw)
        excel_policies[pol_no] = r

    print(f"Total unique policies: {len(excel_policies)}")

    # Distinct customers: key = (first_name, last_name, email, phone)
    distinct_customers = {}
    policy_customer_keys = {}

    for pol_no, r in excel_policies.items():
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

        if not c_email:
            if c_phone and c_phone != '0':
                c_email = f"dummy_{c_phone}@example.com"
            else:
                c_email = f"dummy_{uuid.uuid4().hex[:8]}@example.com"

        cust_key = (c_first, c_last, c_email, c_phone)
        policy_customer_keys[pol_no] = cust_key

        distinct_customers[cust_key] = {
            'first': c_first,
            'last': c_last,
            'email': c_email,
            'phone': c_phone,
            'dob': c_dob,
            'addr': c_addr,
            'city': c_city,
            'state': c_state,
            'pin': c_pin,
            'freq': c_freq
        }

    print(f"Distinct customer profiles: {len(distinct_customers)}")

    print(f"Writing SQL to {sql_path}...")
    with open(sql_path, 'w', encoding='utf-8') as f:
        f.write("-- =========================================================================\n")
        f.write("-- SHARE INDIA INSURANCE BROKERS - AWS POLICY DEDUPLICATION & MERGE SCRIPT\n")
        f.write("-- Merges duplicate policy rows, preserves historical call logs/reminders,\n")
        f.write("-- updates latest customer info & RM details, and enforces UNIQUE constraint\n")
        f.write(f"-- Generated At: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write("-- =========================================================================\n\n")

        f.write("SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;\n")
        f.write("SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';\n")
        f.write("SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;\n")
        f.write("SET NAMES utf8mb4;\n\n")

        # Step 1: Safely drop unique index on customers(email) if exists and add normal index
        f.write("-- Step 1: Remove UNIQUE constraint on customers(email) to allow family/broker shared emails\n")
        f.write("SET @drop_sql = IF(\n")
        f.write("    (SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema = DATABASE() AND table_name = 'customers' AND index_name = 'UK_rfbvkrffamfql7cjmen8v976v') > 0,\n")
        f.write("    'ALTER TABLE customers DROP INDEX `UK_rfbvkrffamfql7cjmen8v976v`',\n")
        f.write("    'SELECT 1'\n")
        f.write(");\n")
        f.write("PREPARE stmt1 FROM @drop_sql;\n")
        f.write("EXECUTE stmt1;\n")
        f.write("DEALLOCATE PREPARE stmt1;\n\n")

        f.write("SET @add_sql = IF(\n")
        f.write("    (SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema = DATABASE() AND table_name = 'customers' AND index_name = 'idx_customer_email') = 0,\n")
        f.write("    'ALTER TABLE customers ADD INDEX `idx_customer_email` (`email`)',\n")
        f.write("    'SELECT 1'\n")
        f.write(");\n")
        f.write("PREPARE stmt2 FROM @add_sql;\n")
        f.write("EXECUTE stmt2;\n")
        f.write("DEALLOCATE PREPARE stmt2;\n\n")

        f.write("START TRANSACTION;\n\n")

        # Step 2: Ensure all distinct customers exist with exact Name, Email, and Phone
        f.write("-- Step 2: Insert any missing customer profiles from Excel\n")
        for cust_key, c in distinct_customers.items():
            f_sql = sql_escape(c['first'])
            l_sql = sql_escape(c['last'])
            em_sql = sql_escape(c['email'])
            ph_sql = sql_escape(c['phone'])
            dob_sql = f"'{c['dob']}'" if c['dob'] else "NULL"
            addr_sql = sql_escape(c['addr'])
            city_sql = sql_escape(c['city'])
            state_sql = sql_escape(c['state'])
            pin_sql = sql_escape(c['pin'])
            freq_sql = sql_escape(c['freq'])

            phone_cond = f"phone = {ph_sql}" if c['phone'] else "(phone IS NULL OR phone = '')"

            stmt = (
                f"INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, pincode, billing_frequency, created_at) "
                f"SELECT {f_sql}, {l_sql}, {em_sql}, {ph_sql}, {dob_sql}, {addr_sql}, {city_sql}, {state_sql}, {pin_sql}, {freq_sql}, NOW() "
                f"FROM DUAL WHERE NOT EXISTS ("
                f"SELECT 1 FROM customers WHERE first_name={f_sql} AND last_name={l_sql} AND email={em_sql} AND {phone_cond} LIMIT 1);\n"
            )
            f.write(stmt)

        # Step 3: Update customer details (address, city, state, etc.)
        f.write("\n-- Step 3: Update customer addresses & details to match Excel\n")
        for cust_key, c in distinct_customers.items():
            f_sql = sql_escape(c['first'])
            l_sql = sql_escape(c['last'])
            em_sql = sql_escape(c['email'])
            ph_sql = sql_escape(c['phone'])
            dob_sql = f"'{c['dob']}'" if c['dob'] else "NULL"
            addr_sql = sql_escape(c['addr'])
            city_sql = sql_escape(c['city'])
            state_sql = sql_escape(c['state'])
            pin_sql = sql_escape(c['pin'])
            freq_sql = sql_escape(c['freq'])

            phone_cond = f"phone = {ph_sql}" if c['phone'] else "(phone IS NULL OR phone = '')"

            stmt = (
                f"UPDATE customers SET "
                f"dob=COALESCE({dob_sql}, dob), "
                f"address=COALESCE({addr_sql}, address), city=COALESCE({city_sql}, city), "
                f"state=COALESCE({state_sql}, state), pincode=COALESCE({pin_sql}, pincode), "
                f"billing_frequency=COALESCE({freq_sql}, billing_frequency) "
                f"WHERE first_name={f_sql} AND last_name={l_sql} AND email={em_sql} AND {phone_cond};\n"
            )
            f.write(stmt)

        # Step 4: For every policy in Excel, update the OLDEST (original) policy in DB with latest Excel values and customer_id
        f.write("\n-- Step 4: Update the original policies with fresh data from Excel and accurate customer_id\n")
        for pol_no, r in excel_policies.items():
            cust_key = policy_customer_keys[pol_no]
            f_sql = sql_escape(cust_key[0])
            l_sql = sql_escape(cust_key[1])
            em_sql = sql_escape(cust_key[2])
            ph_sql = sql_escape(cust_key[3])
            phone_cond = f"phone = {ph_sql}" if cust_key[3] else "(phone IS NULL OR phone = '')"

            p_type = sql_escape(clean_str(r[header_map['Insurance Type']]) or 'General')
            p_ins = sql_escape(clean_str(r[header_map['Insurer Name']]))
            p_prod = sql_escape(clean_str(r[header_map['Product Name']]))
            p_start = parse_date(r[header_map['Policy Start Date']])
            p_end = parse_date(r[header_map['Policy End Date']])
            p_exp = parse_date(r[header_map['Renewal Due date']]) or p_end
            if p_end is None and p_exp is not None: p_end = p_exp
            p_start_sql = f"'{p_start}'" if p_start else "NULL"
            p_end_sql = f"'{p_end}'" if p_end else "NULL"
            p_exp_sql = f"'{p_exp}'" if p_exp else "NULL"

            p_amt = parse_decimal(r[header_map['Amount']])
            p_prem = parse_decimal(r[header_map['Premium']])
            p_rm = sql_escape(clean_str(r[header_map['RM Name']]))
            p_rm_em = sql_escape(clean_str(r[header_map['RM Email']]))
            p_assoc = sql_escape(clean_str(r[header_map['Associate name']]))
            p_assoc_c = sql_escape(clean_str(r[header_map['Associate Code']]))
            p_v_reg = sql_escape(clean_str(r[header_map['Car/RegNo']]))
            p_model = clean_str(r[header_map['Model Name']])
            p_mgf = clean_str(r[header_map['Mgf Year']])
            if p_mgf and p_model and p_mgf not in p_model:
                p_model = f"{p_model} ({p_mgf})"[:250]
            p_model_sql = sql_escape(p_model)
            pol_sql = sql_escape(pol_no)

            stmt = (
                f"UPDATE policies SET "
                f"customer_id = (SELECT id FROM customers WHERE first_name={f_sql} AND last_name={l_sql} AND email={em_sql} AND {phone_cond} ORDER BY id DESC LIMIT 1), "
                f"type={p_type}, insurance_name={p_ins}, product_name={p_prod}, "
                f"policy_start_date={p_start_sql}, policy_end_date={p_end_sql}, expiry_date={p_exp_sql}, "
                f"amount={p_amt}, due_premium={p_prem}, rm_name={p_rm}, rm_email={p_rm_em}, "
                f"associate_name={p_assoc}, associate_code={p_assoc_c}, vehicle_reg_no={p_v_reg}, vehicle_model={p_model_sql} "
                f"WHERE policy_number = {pol_sql};\n"
            )
            f.write(stmt)

        # Step 5: Merge duplicate policies:
        # Re-link any audit_log, call_history, policy_documents from duplicate (higher ID) to original (lower ID)
        f.write("\n-- Step 5: Re-link historical logs from duplicate records to original records\n")
        f.write("""
UPDATE audit_log a
JOIN (
    SELECT old_p.id AS keep_id, new_p.id AS del_id
    FROM policies old_p
    JOIN policies new_p ON old_p.policy_number = new_p.policy_number AND old_p.id < new_p.id
) d ON a.policy_id = d.del_id
SET a.policy_id = d.keep_id;

UPDATE call_history ch
JOIN (
    SELECT old_p.id AS keep_id, new_p.id AS del_id
    FROM policies old_p
    JOIN policies new_p ON old_p.policy_number = new_p.policy_number AND old_p.id < new_p.id
) d ON ch.policy_id = d.del_id
SET ch.policy_id = d.keep_id;

UPDATE policy_documents pd
JOIN (
    SELECT old_p.id AS keep_id, new_p.id AS del_id
    FROM policies old_p
    JOIN policies new_p ON old_p.policy_number = new_p.policy_number AND old_p.id < new_p.id
) d ON pd.policy_id = d.del_id
SET pd.policy_id = d.keep_id;
\n""")

        # Step 6: Delete redundant reminders created for duplicate policies
        f.write("-- Step 6: Delete redundant 'Pending' reminders of duplicate policies\n")
        f.write("""
DELETE r FROM reminders r
JOIN (
    SELECT new_p.id AS del_id
    FROM policies old_p
    JOIN policies new_p ON old_p.policy_number = new_p.policy_number AND old_p.id < new_p.id
    WHERE EXISTS (SELECT 1 FROM reminders r_old WHERE r_old.policy_id = old_p.id)
) d ON r.policy_id = d.del_id;

UPDATE reminders r
JOIN (
    SELECT old_p.id AS keep_id, new_p.id AS del_id
    FROM policies old_p
    JOIN policies new_p ON old_p.policy_number = new_p.policy_number AND old_p.id < new_p.id
) d ON r.policy_id = d.del_id
SET r.policy_id = d.keep_id;
\n""")

        # Step 7: Delete duplicate policies (higher ID rows)
        f.write("-- Step 7: Delete duplicate policy rows (keeping the original with call history)\n")
        f.write("""
DELETE p FROM policies p
JOIN (
    SELECT new_p.id AS del_id
    FROM policies old_p
    JOIN policies new_p ON old_p.policy_number = new_p.policy_number AND old_p.id < new_p.id
) d ON p.id = d.del_id;
\n""")

        # Step 8: Ensure every remaining policy has a reminder if missing
        f.write("-- Step 8: Ensure all policies have an active reminder\n")
        f.write("""
INSERT INTO reminders (policy_id, reminder_status, follow_up_required, last_call_outcome, created_at)
SELECT p.id, 'PENDING', 0, 'Pending', NOW()
FROM policies p
LEFT JOIN reminders r ON r.policy_id = p.id
WHERE r.id IS NULL;
\n""")

        f.write("COMMIT;\n\n")

        # Step 9: Enforce UNIQUE constraint on policies(policy_number)
        f.write("-- Step 9: Enforce UNIQUE KEY on policies(policy_number) to prevent any future duplicates\n")
        f.write("SET @exist := (SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema = DATABASE() AND table_name = 'policies' AND index_name = 'UK_oa74bk3bbln2o1hgik4b93rp9');\n")
        f.write("SET @sqlstmt := IF(@exist = 0, 'ALTER TABLE policies ADD UNIQUE KEY `UK_oa74bk3bbln2o1hgik4b93rp9` (`policy_number`)', 'SELECT 1');\n")
        f.write("PREPARE stmt3 FROM @sqlstmt;\n")
        f.write("EXECUTE stmt3;\n")
        f.write("DEALLOCATE PREPARE stmt3;\n\n")

        f.write("SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;\n")
        f.write("SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;\n")
        f.write("SET SQL_MODE=@OLD_SQL_MODE;\n")
        f.write("-- ======================== END OF SCRIPT ========================\n")

    print(f"Generated {sql_path} successfully!")

generate_dedup_script()
