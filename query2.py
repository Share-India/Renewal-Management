import mysql.connector
import pandas as pd

conn = mysql.connector.connect(host="localhost", user="root", password="root@123", database="insurance_renewal")
cursor = conn.cursor(dictionary=True)

cursor.execute("SELECT c.id, c.first_name, c.last_name, c.email FROM customers c WHERE c.email LIKE '%thakarwad%' OR c.email LIKE '%dummy_9422413903%'")
print("Customers matching:")
for row in cursor.fetchall():
    print(row)

df = pd.read_excel('backend/src/main/resources/Renewal data 30.7.2026.xlsx', header=0)
for idx, row in df.iterrows():
    name = str(row.get('Customer Name', ''))
    if 'Thakarwad' in name or 'Thakkarwad' in name:
        print("Excel Match:", name, "| Email:", row.get('Email ID', ''), "| Policy:", row.get('Policy No 1', row.get('Policy No', '')))
