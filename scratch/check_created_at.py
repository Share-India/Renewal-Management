import pymysql

conn = pymysql.connect(host='localhost', user='root', password='root@123', database='insurance_renewal')
try:
    with conn.cursor() as cursor:
        cursor.execute("SELECT branch, DATE(created_at), COUNT(*) FROM policies WHERE branch IN ('Mumbai', 'Mumbai (Lost Cases)') GROUP BY branch, DATE(created_at)")
        print(cursor.fetchall())
finally:
    conn.close()
