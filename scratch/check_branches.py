import pymysql

conn = pymysql.connect(host='localhost', user='root', password='root@123', database='insurance_renewal')
try:
    with conn.cursor() as cursor:
        cursor.execute("SELECT branch, count(*) from policies group by branch")
        print(cursor.fetchall())
finally:
    conn.close()
