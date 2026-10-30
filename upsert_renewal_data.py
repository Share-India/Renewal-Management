import openpyxl
import datetime
import uuid
import sys
import pymysql

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

def determine_branch(city, state, existing_branch=None):
    if existing_branch and existing_branch.strip() != '':
        return existing_branch
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

def run_upsert():
    print("=" * 65)
    print("INSURANCE RENEWAL MANAGEMENT SYSTEM - EXCEL DATA UPSERT")
    print("=" * 65)
    excel_path = 'Renewal Apr 26 to Mar 27.xlsx'
    print(f"Loading Excel file: {excel_path}...")
    
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
    print(f"Unique policy records to process: {len(excel_records)}")
    if duplicate_count > 0:
        print(f"Duplicate policy occurrences resolved (last row prioritized): {duplicate_count}")

    print("\nConnecting to MySQL database `insurance_renewal`...")
    conn = pymysql.connect(
        host='localhost',
        user='root',
        password='root@123',
        database='insurance_renewal',
        autocommit=False
    )

    today_str = datetime.date.today().strftime('%Y-%m-%d')
    print(f"System Reference Date (Today): {today_str}")

    updated_policies_count = 0
    inserted_policies_count = 0
    updated_customers_count = 0
    inserted_customers_count = 0
    inserted_reminders_count = 0
    reset_reminders_count = 0

    try:
        with conn.cursor() as cur:
            # 1. Cache existing policies normalized
            print("Caching existing database state...")
            cur.execute("SELECT id, policy_number, customer_id, branch, status FROM policies")
            db_policies = {}
            for row in cur.fetchall():
                normalized_key = norm_pol(row[1])
                db_policies[normalized_key] = {
                    'id': row[0],
                    'policy_number': row[1],
                    'customer_id': row[2],
                    'branch': row[3],
                    'status': row[4]
                }
            print(f"Found {len(db_policies)} existing policies in DB.")

            # 2. Cache existing customers by email
            cur.execute("SELECT id, email FROM customers WHERE email IS NOT NULL AND email != ''")
            db_customer_emails = {row[1].strip().lower(): row[0] for row in cur.fetchall()}
            print(f"Found {len(db_customer_emails)} existing customer emails in DB.")

            # 3. Cache policies with reminders
            cur.execute("SELECT policy_id FROM reminders")
            db_policy_reminders = set(row[0] for row in cur.fetchall())
            print(f"Found {len(db_policy_reminders)} existing reminders in DB.")

            print("\nStarting Upsert Processing across all records...")
            total_items = len(excel_records)
            processed_count = 0

            for pol_no, r in excel_records.items():
                processed_count += 1
                
                # --- Customer Details ---
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
                c_gst = clean_str(r[header_map['GST']])
                c_pan = clean_str(r[header_map['PAN']])

                # --- Policy Details ---
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

                # Status determination: ACTIVE if expiry is today or in future; EXPIRED if past
                p_status = 'ACTIVE' if (p_expiry and p_expiry >= today_str) else 'EXPIRED'

                # --- CASE 1: POLICY ALREADY IN DB (UPDATE) ---
                if pol_no in db_policies:
                    pol_info = db_policies[pol_no]
                    policy_id = pol_info['id']
                    linked_cust_id = pol_info['customer_id']
                    branch = determine_branch(c_city, c_state, pol_info['branch'])

                    target_cust_id = linked_cust_id

                    # Resolve email & customer link
                    if c_email:
                        if c_email in db_customer_emails:
                            existing_email_cust_id = db_customer_emails[c_email]
                            target_cust_id = existing_email_cust_id
                            # Update existing customer record with latest details
                            cur.execute("""
                                UPDATE customers
                                SET first_name = %s, last_name = %s,
                                    phone = COALESCE(%s, phone),
                                    dob = COALESCE(%s, dob),
                                    address = COALESCE(%s, address),
                                    city = COALESCE(%s, city),
                                    state = COALESCE(%s, state),
                                    pincode = COALESCE(%s, pincode),
                                    billing_frequency = COALESCE(%s, billing_frequency)
                                WHERE id = %s
                            """, (c_first, c_last, c_phone, c_dob, c_addr, c_city, c_state, c_pin, c_freq, target_cust_id))
                            updated_customers_count += 1
                        else:
                            # Update linked customer's email and details
                            cur.execute("""
                                UPDATE customers
                                SET first_name = %s, last_name = %s, email = %s,
                                    phone = COALESCE(%s, phone),
                                    dob = COALESCE(%s, dob),
                                    address = COALESCE(%s, address),
                                    city = COALESCE(%s, city),
                                    state = COALESCE(%s, state),
                                    pincode = COALESCE(%s, pincode),
                                    billing_frequency = COALESCE(%s, billing_frequency)
                                WHERE id = %s
                            """, (c_first, c_last, c_email, c_phone, c_dob, c_addr, c_city, c_state, c_pin, c_freq, target_cust_id))
                            db_customer_emails[c_email] = target_cust_id
                            updated_customers_count += 1
                    else:
                        # Blank email in Excel: preserve existing customer email
                        cur.execute("""
                            UPDATE customers
                            SET first_name = %s, last_name = %s,
                                phone = COALESCE(%s, phone),
                                dob = COALESCE(%s, dob),
                                address = COALESCE(%s, address),
                                city = COALESCE(%s, city),
                                state = COALESCE(%s, state),
                                pincode = COALESCE(%s, pincode),
                                billing_frequency = COALESCE(%s, billing_frequency)
                            WHERE id = %s
                        """, (c_first, c_last, c_phone, c_dob, c_addr, c_city, c_state, c_pin, c_freq, target_cust_id))
                        updated_customers_count += 1

                    # Update Policy Record (using cleaned policy_number)
                    cur.execute("""
                        UPDATE policies
                        SET policy_number = %s,
                            type = %s,
                            insurance_name = %s,
                            product_name = %s,
                            policy_start_date = %s,
                            policy_end_date = %s,
                            expiry_date = %s,
                            amount = %s,
                            due_premium = %s,
                            rm_name = %s,
                            rm_email = %s,
                            associate_name = %s,
                            associate_code = %s,
                            vehicle_reg_no = %s,
                            vehicle_model = %s,
                            customer_id = %s,
                            branch = %s,
                            status = %s
                        WHERE id = %s
                    """, (pol_no, p_type, p_ins_name, p_prod_name,
                          p_start, p_end, p_expiry,
                          p_amount, p_premium,
                          p_rm_name, p_rm_email,
                          p_assoc_name, p_assoc_code,
                          p_v_reg, p_model,
                          target_cust_id, branch, p_status, policy_id))
                    updated_policies_count += 1

                    # Reminder Check
                    if policy_id not in db_policy_reminders:
                        cur.execute("""
                            INSERT INTO reminders (policy_id, reminder_status, follow_up_required, last_call_outcome, created_at)
                            VALUES (%s, 'PENDING', 0, 'Pending', NOW())
                        """, (policy_id,))
                        db_policy_reminders.add(policy_id)
                        inserted_reminders_count += 1
                    else:
                        # Reset outcome if old cycle had 'Renewed' / 'Pending Issuance'
                        cur.execute("""
                            UPDATE reminders
                            SET reminder_status = 'PENDING', last_call_outcome = 'Pending'
                            WHERE policy_id = %s AND LOWER(last_call_outcome) IN ('renewed', 'pending issuance', 'externally renewed')
                        """, (policy_id,))
                        if cur.rowcount > 0:
                            reset_reminders_count += 1

                # --- CASE 2: NEW POLICY (INSERT) ---
                else:
                    branch = determine_branch(c_city, c_state, None)
                    target_cust_id = None

                    if c_email and c_email in db_customer_emails:
                        target_cust_id = db_customer_emails[c_email]
                        cur.execute("""
                            UPDATE customers
                            SET first_name = %s, last_name = %s,
                                phone = COALESCE(%s, phone),
                                dob = COALESCE(%s, dob),
                                address = COALESCE(%s, address),
                                city = COALESCE(%s, city),
                                state = COALESCE(%s, state),
                                pincode = COALESCE(%s, pincode),
                                billing_frequency = COALESCE(%s, billing_frequency)
                            WHERE id = %s
                        """, (c_first, c_last, c_phone, c_dob, c_addr, c_city, c_state, c_pin, c_freq, target_cust_id))
                        updated_customers_count += 1
                    else:
                        # Insert new customer
                        email_to_use = c_email if c_email else f"dummy_{uuid.uuid4().hex[:8]}@example.com"
                        cur.execute("""
                            INSERT INTO customers 
                            (first_name, last_name, email, phone, dob, address, city, state, pincode, billing_frequency, created_at)
                            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, NOW())
                        """, (c_first, c_last, email_to_use, c_phone, c_dob, c_addr, c_city, c_state, c_pin, c_freq))
                        target_cust_id = cur.lastrowid
                        db_customer_emails[email_to_use] = target_cust_id
                        inserted_customers_count += 1

                    # Insert New Policy
                    cur.execute("""
                        INSERT INTO policies 
                        (policy_number, customer_id, type, insurance_name, product_name,
                         policy_start_date, policy_end_date, expiry_date, amount, due_premium,
                         status, rm_name, rm_email, associate_name, associate_code,
                         vehicle_reg_no, vehicle_model, branch, target_team, created_at)
                        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 'RENEWER', NOW())
                    """, (pol_no, target_cust_id, p_type, p_ins_name, p_prod_name,
                          p_start, p_end, p_expiry, p_amount, p_premium,
                          p_status, p_rm_name, p_rm_email, p_assoc_name, p_assoc_code,
                          p_v_reg, p_model, branch))
                    new_policy_id = cur.lastrowid
                    inserted_policies_count += 1

                    # Cache newly inserted policy
                    db_policies[pol_no] = {
                        'id': new_policy_id,
                        'policy_number': pol_no,
                        'customer_id': target_cust_id,
                        'branch': branch,
                        'status': p_status
                    }

                    # Insert Mandatory Reminder
                    cur.execute("""
                        INSERT INTO reminders (policy_id, reminder_status, follow_up_required, last_call_outcome, created_at)
                        VALUES (%s, 'PENDING', 0, 'Pending', NOW())
                    """, (new_policy_id,))
                    db_policy_reminders.add(new_policy_id)
                    inserted_reminders_count += 1

                if processed_count % 1000 == 0 or processed_count == total_items:
                    print(f"Progress: {processed_count}/{total_items} records processed (Updated Policies: {updated_policies_count}, Inserted Policies: {inserted_policies_count})...")

            print("\nCommitting transaction to MySQL database...")
            conn.commit()
            print("Transaction successfully committed!")

    except Exception as e:
        print(f"\nERROR OCCURRED: {e}")
        conn.rollback()
        print("Database transaction rolled back.")
        raise e
    finally:
        conn.close()

    print("\n" + "=" * 65)
    print("UPSERT SUMMARY - EXECUTION REPORT")
    print("=" * 65)
    print(f"Total Unique Excel Policies Processed: {total_items}")
    print(f"Existing Policies Updated:              {updated_policies_count}")
    print(f"New Policies Inserted:                 {inserted_policies_count}")
    print(f"Customer Profiles Updated:              {updated_customers_count}")
    print(f"New Customer Profiles Inserted:        {inserted_customers_count}")
    print(f"New Reminders Created:                 {inserted_reminders_count}")
    print(f"Stale Reminders Reset to Pending:      {reset_reminders_count}")
    print("=" * 65)

if __name__ == '__main__':
    run_upsert()
