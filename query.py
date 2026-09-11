import mysql.connector

conn = mysql.connector.connect(host="localhost", user="root", password="root@123", database="insurance_renewal")
cursor = conn.cursor(dictionary=True)

cursor.execute("SELECT c.first_name, c.last_name, c.email, p.policy_number FROM policies p JOIN customers c ON p.customer_id = c.id WHERE p.policy_number = '4193i/APRN/406827824/00/000'")
for row in cursor.fetchall():
    print("DB Data:", row)
