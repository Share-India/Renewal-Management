import pymysql
import pandas as pd

conn = pymysql.connect(host='localhost', user='root', password='root@123', database='insurance_renewal')
df = pd.read_excel('c:/Users/Admin/.gemini/antigravity/scratch/insurance-renewal-app/backend/src/main/resources/Noida_Data.xlsx')

policies = df['Policy No'].dropna().astype(str).tolist()
# Filter out DRAFT policies that were generated with timestamp since they won't match anyway
policies = [p for p in policies if p != 'nan']

cursor = conn.cursor()
cursor.execute("SELECT COUNT(*) FROM policies WHERE branch='Noida'")
print(f"Noida branch policies: {cursor.fetchone()[0]}")

cursor.execute("SELECT COUNT(*) FROM policies")
print(f"Total policies: {cursor.fetchone()[0]}")
conn.close()
