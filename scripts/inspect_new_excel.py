import pandas as pd

file_path = r'c:\Users\Sagar Dagle\.gemini\antigravity\scratch\insurance-renewal-app\backend\target\classes\Copy of Renewal Data 2024-25-26.xlsx'

try:
    df = pd.read_excel(file_path)
    print("ALL COLUMNS FOUND:")
    for col in df.columns:
        print(f"'{col}'")
    
    contacts = [c for c in df.columns if 'Contact' in str(c)]
    print(f"\nColumns with 'Contact' in name: {contacts}")

except Exception as e:
    print(f"Error: {e}")
