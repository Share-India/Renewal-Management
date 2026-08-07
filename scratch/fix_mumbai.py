import pymysql

conn = pymysql.connect(host='localhost', user='root', password='root@123', database='insurance_renewal')
try:
    with conn.cursor() as cursor:
        cursor.execute("UPDATE policies SET branch = 'Mumbai' WHERE branch = 'Mumbai (Lost Cases)' AND created_at IS NULL")
        conn.commit()
        print(f"Updated {cursor.rowcount} overlapping policies back to Mumbai.")
finally:
    conn.close()

with open('backend/src/main/resources/data.sql', 'a', encoding='utf-8') as f:
    f.write("\n\n-- Fix for overlapping Mumbai policies\n")
    f.write("UPDATE policies SET branch = 'Mumbai' WHERE branch = 'Mumbai (Lost Cases)' AND created_at IS NULL;\n")

