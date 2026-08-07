import pymysql
conn = pymysql.connect(host='localhost', user='root', password='root@123', database='insurance_renewal')
cursor = conn.cursor()
cursor.execute("SELECT type, COUNT(*) FROM policies WHERE branch='Noida' GROUP BY type")
print(cursor.fetchall())
conn.close()
