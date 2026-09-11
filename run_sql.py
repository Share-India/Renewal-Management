import mysql.connector

def run_sql():
    print("Connecting to database...")
    db = mysql.connector.connect(
        host="localhost",
        user="root",
        password="root@123",
        database="insurance_renewal"
    )
    cursor = db.cursor()
    
    print("Reading SQL file...")
    with open('mumbai_data.sql', 'r', encoding='utf-8') as f:
        sql_commands = f.read().split(';\n')
        
    print("Executing queries...")
    for cmd in sql_commands:
        cmd = cmd.strip()
        if cmd:
            cursor.execute(cmd)
            
    db.commit()
    cursor.close()
    db.close()
    print("Success! All data from mumbai_data.sql has been inserted into the database.")

if __name__ == '__main__':
    run_sql()
