import mysql.connector
conn = mysql.connector.connect(host="localhost", user="root", password="root@123", database="insurance_renewal")
cursor = conn.cursor(dictionary=True)
cursor.execute("SELECT target_team FROM policies WHERE policy_number='D209157923/S'")
for row in cursor.fetchall():
    print("target_team:", row)
