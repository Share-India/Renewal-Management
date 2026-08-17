import pandas as pd
import pymysql

df = pd.read_excel('backend/src/main/resources/similar Cases Renewal Data .docx.xlsx')
policy_numbers = df['Policy Number'].dropna().astype(str).tolist()

conn = pymysql.connect(host='localhost', user='root', password='root@123', database='insurance_renewal')
cursor = conn.cursor()

chunk_size = 1000
total_updated = 0

for i in range(0, len(policy_numbers), chunk_size):
    chunk = policy_numbers[i:i+chunk_size]
    format_strings = ','.join(['%s'] * len(chunk))
    query = f"UPDATE policies SET branch = 'Mumbai' WHERE branch = 'Mumbai (Lost Cases)' AND policy_number IN ({format_strings})"
    cursor.execute(query, chunk)
    total_updated += cursor.rowcount

conn.commit()
conn.close()

print(f'Total policies moved back to Mumbai: {total_updated}')
