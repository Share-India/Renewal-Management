import mysql.connector
conn = mysql.connector.connect(host="localhost", user="root", password="root@123", database="insurance_renewal")
cursor = conn.cursor()
cursor.execute("SELECT DISTINCT target_team FROM policies")
for row in cursor.fetchall():
    print(row)
