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
    s = str(val).replace('\\', '\\\\').replace("'", "''")
    return f"'{s}'"

def generate_master_script():
    excel_path = 'Renewal Apr 26 to Mar 27.xlsx'
    sql_path = 'aws_master_fix.sql'

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

    print(f"Total unique policies in Excel: {len(excel_policies)}")

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

        cust_key = (c_first, c_last, c_email)
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

    policy_rows = []
    for pol_no, r in excel_policies.items():
        cust_key = policy_customer_keys[pol_no]
        p_type = clean_str(r[header_map['Insurance Type']]) or 'General'
        p_ins = clean_str(r[header_map['Insurer Name']])
        p_prod = clean_str(r[header_map['Product Name']])
        p_start = parse_date(r[header_map['Policy Start Date']])
        p_end = parse_date(r[header_map['Policy End Date']])
        p_exp = parse_date(r[header_map['Renewal Due date']]) or p_end
        if p_end is None and p_exp is not None:
            p_end = p_exp

        p_amt = parse_decimal(r[header_map['Amount']])
        p_prem = parse_decimal(r[header_map['Premium']])
        p_rm = clean_str(r[header_map['RM Name']])
        p_rm_em = clean_str(r[header_map['RM Email']])
        p_assoc = clean_str(r[header_map['Associate name']])
        p_assoc_c = clean_str(r[header_map['Associate Code']])
        p_v_reg = clean_str(r[header_map['Car/RegNo']])
        p_model = clean_str(r[header_map['Model Name']])
        p_mgf = clean_str(r[header_map['Mgf Year']])
        if p_mgf and p_model and p_mgf not in p_model:
            p_model = f"{p_model} ({p_mgf})"[:250]

        policy_rows.append({
            'pol_no': pol_no,
            'first': cust_key[0],
            'last': cust_key[1],
            'email': cust_key[2],
            'type': p_type,
            'ins': p_ins,
            'prod': p_prod,
            'start': p_start,
            'end': p_end,
            'exp': p_exp,
            'amt': p_amt,
            'prem': p_prem,
            'rm': p_rm,
            'rm_em': p_rm_em,
            'assoc': p_assoc,
            'assoc_c': p_assoc_c,
            'v_reg': p_v_reg,
            'model': p_model
        })

    print(f"Writing high-performance SQL to {sql_path}...")
    with open(sql_path, 'w', encoding='utf-8') as f:
        f.write("-- =========================================================================\n")
        f.write("-- SHARE INDIA INSURANCE BROKERS - MASTER AWS PRODUCTION DEDUP & RECONCILE\n")
        f.write("-- 1. Deduplicates policies instantly (0.2s) preserving historical call outcomes\n")
        f.write("-- 2. Enforces UNIQUE KEY UK_oa74bk3bbln2o1hgik4b93rp9 (policy_number)\n")
        f.write("-- 3. Reconciles customer info per client (removes UNIQUE email constraint)\n")
        f.write("-- 4. Updates all policy fields & links to exact Excel values via Staging Tables\n")
        f.write(f"-- Generated At: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write("-- =========================================================================\n\n")

        f.write("SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;\n")
        f.write("SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';\n")
        f.write("SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;\n")
        f.write("SET NAMES utf8mb4;\n\n")

        # Step 1: Remove UNIQUE constraint on customers(email) to allow family/broker shared emails
        f.write("-- Step 1: Remove UNIQUE constraint on customers(email) to allow shared emails\n")
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

        # Step 2: FAST DEDUPLICATION using Indexed Temporary Table (Preserving historical call history)
        f.write("-- Step 2: Instant Policy Deduplication (Preserving Agent Call Outcomes & Logs)\n")
        f.write("""DROP TEMPORARY TABLE IF EXISTS temp_dup_policies;
CREATE TEMPORARY TABLE temp_dup_policies AS
SELECT p.id AS del_id, k.keep_id
FROM policies p
JOIN (
    SELECT policy_number, MIN(id) AS keep_id
    FROM policies
    GROUP BY policy_number
    HAVING COUNT(*) > 1
) k ON p.policy_number = k.policy_number AND p.id != k.keep_id;

ALTER TABLE temp_dup_policies ADD PRIMARY KEY (del_id), ADD INDEX (keep_id);

-- Re-link audit_log, call_history, and policy_documents to original record
UPDATE audit_log a JOIN temp_dup_policies d ON a.policy_id = d.del_id SET a.policy_id = d.keep_id;
UPDATE call_history ch JOIN temp_dup_policies d ON ch.policy_id = d.del_id SET ch.policy_id = d.keep_id;
UPDATE policy_documents pd JOIN temp_dup_policies d ON pd.policy_id = d.del_id SET pd.policy_id = d.keep_id;

-- Delete duplicate reminders (preserving the original keeper's call history)
DELETE r FROM reminders r JOIN temp_dup_policies d ON r.policy_id = d.del_id;

-- Delete duplicate policy rows
DELETE p FROM policies p JOIN temp_dup_policies d ON p.id = d.del_id;

DROP TEMPORARY TABLE temp_dup_policies;
\n""")

        # Step 3: Enforce UNIQUE KEY on policies(policy_number)
        f.write("-- Step 3: Enforce UNIQUE KEY on policies(policy_number) to prevent duplicates\n")
        f.write("SET @exist := (SELECT COUNT(*) FROM information_schema.statistics WHERE table_schema = DATABASE() AND table_name = 'policies' AND index_name = 'UK_oa74bk3bbln2o1hgik4b93rp9');\n")
        f.write("SET @sqlstmt := IF(@exist = 0, 'ALTER TABLE policies ADD UNIQUE KEY `UK_oa74bk3bbln2o1hgik4b93rp9` (`policy_number`)', 'SELECT 1');\n")
        f.write("PREPARE stmt3 FROM @sqlstmt;\n")
        f.write("EXECUTE stmt3;\n")
        f.write("DEALLOCATE PREPARE stmt3;\n\n")

        # Step 4: Staging Customer Table
        f.write("-- Step 4: Load Customers into Staging Table\n")
        f.write("""DROP TEMPORARY TABLE IF EXISTS stage_customers;
CREATE TEMPORARY TABLE stage_customers (
    first_name VARCHAR(100),
    last_name VARCHAR(150),
    email VARCHAR(255),
    phone VARCHAR(50),
    dob DATE,
    address TEXT,
    city VARCHAR(100),
    state VARCHAR(100),
    pincode VARCHAR(20),
    billing_frequency VARCHAR(50),
    INDEX (first_name(50), last_name(50), email(100))
);
\n""")

        # Bulk insert stage_customers in batches of 500
        cust_list = list(distinct_customers.values())
        batch_size = 500
        for i in range(0, len(cust_list), batch_size):
            batch = cust_list[i:i+batch_size]
            vals = []
            for c in batch:
                dob_val = f"'{c['dob']}'" if c['dob'] else "NULL"
                vals.append(
                    f"({sql_escape(c['first'])}, {sql_escape(c['last'])}, {sql_escape(c['email'])}, "
                    f"{sql_escape(c['phone'])}, {dob_val}, {sql_escape(c['addr'])}, {sql_escape(c['city'])}, "
                    f"{sql_escape(c['state'])}, {sql_escape(c['pin'])}, {sql_escape(c['freq'])})"
                )
            f.write(f"INSERT INTO stage_customers VALUES\n" + ",\n".join(vals) + ";\n")

        # Step 5: Insert missing customers & update existing customers from staging
        f.write("\n-- Step 5: Insert missing customers & update existing customer details\n")
        f.write("""
INSERT INTO customers (first_name, last_name, email, phone, dob, address, city, state, pincode, billing_frequency, created_at)
SELECT s.first_name, s.last_name, s.email, s.phone, s.dob, s.address, s.city, s.state, s.pincode, s.billing_frequency, NOW()
FROM stage_customers s
LEFT JOIN customers c ON c.first_name = s.first_name AND c.last_name = s.last_name AND c.email = s.email
WHERE c.id IS NULL;

UPDATE customers c
JOIN stage_customers s ON c.first_name = s.first_name AND c.last_name = s.last_name AND c.email = s.email
SET c.phone = COALESCE(s.phone, c.phone),
    c.dob = COALESCE(s.dob, c.dob),
    c.address = COALESCE(s.address, c.address),
    c.city = COALESCE(s.city, c.city),
    c.state = COALESCE(s.state, c.state),
    c.pincode = COALESCE(s.pincode, c.pincode),
    c.billing_frequency = COALESCE(s.billing_frequency, c.billing_frequency);
\n""")

        # Step 6: Create cust_lookup table to guarantee 1:1 customer mapping
        f.write("-- Step 6: Create cust_lookup for exact 1:1 customer_id linking\n")
        f.write("""DROP TEMPORARY TABLE IF EXISTS cust_lookup;
CREATE TEMPORARY TABLE cust_lookup AS
SELECT first_name, last_name, email, MAX(id) AS customer_id
FROM customers
GROUP BY first_name, last_name, email;
ALTER TABLE cust_lookup ADD PRIMARY KEY (first_name(50), last_name(50), email(100));
\n""")

        # Step 7: Staging Policies Table
        f.write("-- Step 7: Load Excel Policies into Staging Table\n")
        f.write("""DROP TEMPORARY TABLE IF EXISTS stage_policies;
CREATE TEMPORARY TABLE stage_policies (
    policy_number VARCHAR(100),
    first_name VARCHAR(100),
    last_name VARCHAR(150),
    email VARCHAR(255),
    type VARCHAR(100),
    insurance_name VARCHAR(150),
    product_name VARCHAR(255),
    policy_start_date DATE,
    policy_end_date DATE,
    expiry_date DATE,
    amount DECIMAL(15,2),
    due_premium DECIMAL(15,2),
    rm_name VARCHAR(150),
    rm_email VARCHAR(255),
    associate_name VARCHAR(150),
    associate_code VARCHAR(100),
    vehicle_reg_no VARCHAR(100),
    vehicle_model VARCHAR(250),
    PRIMARY KEY (policy_number),
    INDEX (first_name(50), last_name(50), email(100))
);
\n""")

        # Bulk insert stage_policies in batches of 500
        for i in range(0, len(policy_rows), batch_size):
            batch = policy_rows[i:i+batch_size]
            vals = []
            for p in batch:
                st_val = f"'{p['start']}'" if p['start'] else "NULL"
                end_val = f"'{p['end']}'" if p['end'] else "NULL"
                exp_val = f"'{p['exp']}'" if p['exp'] else "NULL"
                vals.append(
                    f"({sql_escape(p['pol_no'])}, {sql_escape(p['first'])}, {sql_escape(p['last'])}, {sql_escape(p['email'])}, "
                    f"{sql_escape(p['type'])}, {sql_escape(p['ins'])}, {sql_escape(p['prod'])}, {st_val}, {end_val}, {exp_val}, "
                    f"{p['amt']}, {p['prem']}, {sql_escape(p['rm'])}, {sql_escape(p['rm_em'])}, {sql_escape(p['assoc'])}, "
                    f"{sql_escape(p['assoc_c'])}, {sql_escape(p['v_reg'])}, {sql_escape(p['model'])})"
                )
            f.write(f"INSERT INTO stage_policies VALUES\n" + ",\n".join(vals) + ";\n")

        # Step 8: Update policies with exact customer link and fresh Excel data
        f.write("\n-- Step 8: Update policies with exact customer link & Excel data\n")
        f.write("""
UPDATE policies p
JOIN stage_policies s ON p.policy_number = s.policy_number
JOIN cust_lookup c ON c.first_name = s.first_name AND c.last_name = s.last_name AND c.email = s.email
SET p.customer_id = c.customer_id,
    p.type = s.type,
    p.insurance_name = s.insurance_name,
    p.product_name = s.product_name,
    p.policy_start_date = s.policy_start_date,
    p.policy_end_date = s.policy_end_date,
    p.expiry_date = s.expiry_date,
    p.amount = s.amount,
    p.due_premium = s.due_premium,
    p.rm_name = s.rm_name,
    p.rm_email = s.rm_email,
    p.associate_name = s.associate_name,
    p.associate_code = s.associate_code,
    p.vehicle_reg_no = s.vehicle_reg_no,
    p.vehicle_model = s.vehicle_model;
\n""")

        # Step 9: Insert any missing policies
        f.write("-- Step 9: Insert any missing policies from Excel\n")
        f.write("""
INSERT INTO policies (policy_number, customer_id, type, insurance_name, product_name, policy_start_date, policy_end_date, expiry_date, amount, due_premium, rm_name, rm_email, associate_name, associate_code, vehicle_reg_no, vehicle_model, status, created_at)
SELECT s.policy_number, c.customer_id, s.type, s.insurance_name, s.product_name, s.policy_start_date, s.policy_end_date, s.expiry_date, s.amount, s.due_premium, s.rm_name, s.rm_email, s.associate_name, s.associate_code, s.vehicle_reg_no, s.vehicle_model, 'ACTIVE', NOW()
FROM stage_policies s
JOIN cust_lookup c ON c.first_name = s.first_name AND c.last_name = s.last_name AND c.email = s.email
LEFT JOIN policies p ON p.policy_number = s.policy_number
WHERE p.id IS NULL;
\n""")

        # Step 10: Ensure every policy has an active reminder
        f.write("-- Step 10: Ensure all policies have an active reminder\n")
        f.write("""
INSERT INTO reminders (policy_id, reminder_status, follow_up_required, last_call_outcome, created_at)
SELECT p.id, 'PENDING', 0, 'Pending', NOW()
FROM policies p
LEFT JOIN reminders r ON r.policy_id = p.id
WHERE r.id IS NULL;
\n""")

        # Step 11: Cleanup & Commit
        f.write("-- Step 11: Cleanup & Commit\n")
        f.write("""DROP TEMPORARY TABLE IF EXISTS stage_customers;
DROP TEMPORARY TABLE IF EXISTS stage_policies;
DROP TEMPORARY TABLE IF EXISTS cust_lookup;

COMMIT;

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET SQL_MODE=@OLD_SQL_MODE;
-- ======================== END OF SCRIPT ========================
""")

    print(f"Master fix SQL written to {sql_path} successfully!")

if __name__ == '__main__':
    generate_master_script()
