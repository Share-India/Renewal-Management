import datetime
import random
import uuid

def generate_sql():
    # Configuration
    START_OFFSET = -100
    END_OFFSET = 100
    RECORDS_PER_DAY = 10  # ~2000 records total (200 days * 10)
    
    # Reference Date (Today)
    current_date = datetime.date.today()
    
    sql_statements = []
    
    # Header
    sql_statements.append("-- Generated Data for Insurance Renewal App")
    sql_statements.append(f"-- Generated on: {current_date}")
    sql_statements.append("SET FOREIGN_KEY_CHECKS = 0;")
    sql_statements.append("")

    customer_id_counter = 1
    policy_id_counter = 1
    
    # Iterate through the date range
    for offset in range(START_OFFSET, END_OFFSET + 1):
        target_date = current_date + datetime.timedelta(days=offset)
        
        for _ in range(RECORDS_PER_DAY):
            # 1. Customer Data
            first_name = f"Customer_{customer_id_counter}"
            last_name = f"Test_{offset}"
            email = f"customer_{customer_id_counter}_{offset}@example.com"
            phone = f"98{str(uuid.uuid4().int)[:8]}" # Random 10 digit-ish
            billing_freq = random.choice(['Yearly', 'Half-Yearly', 'Quarterly'])
            
            # 2. Policy Data
            policy_number = f"POL-{uuid.uuid4().hex[:8].upper()}-{offset}"
            amount = random.randint(5000, 50000)
            
            # Validation Rule: Expiry Date is MANDATORY (always set)
            expiry_date = target_date.isoformat()
            
            # Validation Rule: Start Date is OPTIONAL
            # 20% chance of being NULL
            if random.random() < 0.2:
                policy_start_date = "NULL"
            else:
                # Start date usually 1 year before expiry
                start_date_obj = target_date - datetime.timedelta(days=365)
                policy_start_date = f"'{start_date_obj.isoformat()}'"

            # Determine Status based on date
            if offset < 0:
                status = "EXPIRED"
            else:
                status = "ACTIVE"

            # SQL: Insert Customer
            sql_statements.append(
                f"INSERT INTO customers (id, first_name, last_name, email, phone, billing_frequency, created_at) "
                f"VALUES ({customer_id_counter}, '{first_name}', '{last_name}', '{email}', '{phone}', '{billing_freq}', NOW()) "
                f"ON DUPLICATE KEY UPDATE id=id;"
            )
            
            # SQL: Insert Policy
            # Note: Assuming customer_id matches the one we just generated/used
            sql_statements.append(
                f"INSERT INTO policies (id, policy_number, customer_id, type, amount, expiry_date, status, policy_start_date, insurance_name, product_name, due_premium, created_at) "
                f"VALUES ({policy_id_counter}, '{policy_number}', {customer_id_counter}, 'Comprehensive', {amount}, '{expiry_date}', '{status}', {policy_start_date}, 'General Insurer', 'Health Guard', {amount}, NOW()) "
                f"ON DUPLICATE KEY UPDATE id=id;"
            )
            
            # SQL: Insert Reminder (Default Pending)
            sql_statements.append(
                f"INSERT INTO reminders (policy_id, reminder_status, follow_up_required, created_at) "
                f"VALUES ({policy_id_counter}, 'PENDING', 0, NOW());"
            )
            
            customer_id_counter += 1
            policy_id_counter += 1
    
    sql_statements.append("")
    sql_statements.append("SET FOREIGN_KEY_CHECKS = 1;")
    
    return "\n".join(sql_statements)

if __name__ == "__main__":
    print(generate_sql())
