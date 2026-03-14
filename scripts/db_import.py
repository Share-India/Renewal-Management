import pymysql

def run_sql():
    print("Connecting to database...")
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='root@123',
        database='insurance_renewal',
        cursorclass=pymysql.cursors.DictCursor
    )

    print("Reading data.sql...")
    with open('backend/src/main/resources/data.sql', 'r', encoding='utf-8') as f:
        sql = f.read()

    # Split on ; but avoid splitting within strings. A simple hacky split might fail on data containing ;, 
    # but the bulk.py already combined them nicely with newlines separating statements.
    
    statements = []
    current_statement = []
    
    for line in sql.split('\n'):
        line = line.strip()
        if not line:
            continue
        current_statement.append(line)
        if line.endswith(';'):
            statements.append('\n'.join(current_statement))
            current_statement = []
    
    print(f"Executing {len(statements)} statements...")
    
    try:
        with connection.cursor() as cursor:
            for i, stmt in enumerate(statements):
                if i % 10 == 0:
                    print(f"Progress: {i}/{len(statements)}")
                cursor.execute(stmt)
        connection.commit()
        print("Success!")
    finally:
        connection.close()

if __name__ == '__main__':
    run_sql()
