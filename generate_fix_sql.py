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
    # Remove unicode formatting
    s = s.replace('\u202c', '').replace('\u202d', '')
    return s[:50]

def norm_pol(val):
    if not val:
        return ''
    return str(val).strip().replace('\xad', '').replace('\xa0', ' ')

def sql_escape(val):
    if val is None:
        return 'NULL'
    s = str(val).replace("'", "''").replace('\\', '\\\\')
    return f"'{s}'"

def build_fix_script():
    excel_path = 'Renewal Apr 26 to Mar 27.xlsx'
    sql_path = 'aws_fix_customer_mismatches.sql'

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

    print(f"Distinct customer profiles to reconcile: {len(distinct_customers)}")

    print(f"Writing SQL to {sql_path}...")
    with open(sql_path, 'w', encoding='utf-8') as f:
        f.write("-- =========================================================================\n")
        f.write("-- SHARE INDIA INSURANCE BROKERS - AWS CUSTOMER RECONCILIATION & FIX\n")
        f.write("-- Resolves shared email overwrites and matches 100% of Excel customer info\n")
        f.write(f"-- Generated At: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write(f"-- Total Policies: {len(excel_policies)} | Customers: {len(distinct_customers)}\n")
        f.write("-- =========================================================================\n\n")

        f.write("SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;\n")
        f.write("SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';\n")
        f.write("SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;\n")
        f.write("SET NAMES utf8mb4;\n\n")

        # 1. Safely drop unique index on email if exists and add normal index
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

        # Step 2: Insert customers that don't exist yet with exact name, email, and phone
        f.write("-- Step 2: Ensure all distinct customers exist with exact Name, Email, and Phone\n")
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

        f.write("\n-- Step 3: Update customer details (address, dob, etc.) to match Excel exactly\n")
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

        f.write("\n-- Step 4: Relink each policy to its exact customer record\n")
        for pol_no, cust_key in policy_customer_keys.items():
            f_sql = sql_escape(cust_key[0])
            l_sql = sql_escape(cust_key[1])
            em_sql = sql_escape(cust_key[2])
            ph_sql = sql_escape(cust_key[3])
            pol_sql = sql_escape(pol_no)

            phone_cond = f"phone = {ph_sql}" if cust_key[3] else "(phone IS NULL OR phone = '')"

            stmt = (
                f"UPDATE policies SET customer_id = ("
                f"SELECT id FROM customers WHERE first_name={f_sql} AND last_name={l_sql} AND email={em_sql} AND {phone_cond} ORDER BY id DESC LIMIT 1) "
                f"WHERE policy_number = {pol_sql};\n"
            )
            f.write(stmt)

        f.write("\nCOMMIT;\n\n")
        f.write("SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;\n")
        f.write("SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;\n")
        f.write("SET SQL_MODE=@OLD_SQL_MODE;\n")
        f.write("-- ======================== END OF SCRIPT ========================\n")

    print("SQL generation complete!")

build_fix_script()
