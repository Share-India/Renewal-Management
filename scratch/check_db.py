import pymysql
conn = pymysql.connect(host='localhost', user='root', password='root@123', database='insurance_renewal')
cursor = conn.cursor()
cursor.execute("SELECT COUNT(*) FROM policies WHERE branch='Noida'")
print(f"Total Noida Policies: {cursor.fetchone()[0]}")
cursor.execute("SELECT COUNT(DISTINCT policy_number) FROM policies WHERE branch='Noida'")
print(f"Distinct Noida Policies: {cursor.fetchone()[0]}")
conn.close()
