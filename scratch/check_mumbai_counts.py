import pymysql

def check_counts():
    conn = pymysql.connect(
        host='localhost',
        user='root',
        password='root@123',
        database='insurance_renewal'
    )
    try:
        with conn.cursor() as cursor:
            cursor.execute("SELECT COUNT(*) FROM policies WHERE branch='Mumbai'")
            print(f"Mumbai count: {cursor.fetchone()[0]}")
            
            cursor.execute("SELECT COUNT(*) FROM policies WHERE branch='Mumbai (Lost Cases)'")
            print(f"Mumbai (Lost Cases) count: {cursor.fetchone()[0]}")
    finally:
        conn.close()

if __name__ == '__main__':
    check_counts()
