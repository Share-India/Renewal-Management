import pymysql

conn = pymysql.connect(host='localhost', user='root', password='root@123', database='insurance_renewal')
cursor = conn.cursor()

cursor.execute("SELECT COUNT(DISTINCT customer_id) FROM policies WHERE branch='Noida'")
print(f"Distinct customer IDs in Noida: {cursor.fetchone()[0]}")

conn.close()
