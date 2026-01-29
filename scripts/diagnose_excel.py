import pandas as pd
import os

# File configuration
excel_file = r"c:\Users\Sagar Dagle\.gemini\antigravity\scratch\insurance-renewal-app\backend\src\main\resources\Insertion data 1.xlsx"

try:
    print(f"Reading {excel_file}...")
    # Read first without header assumption to see what's there
    df = pd.read_excel(excel_file, header=None, nrows=10)
    print("\n--- Raw Data (First 10 rows) ---")
    print(df.to_string())
    
    print("\n\n--- With Header=0 ---")
    df_h = pd.read_excel(excel_file, header=0, nrows=5)
    print(df_h.columns.tolist())
    print(df_h.to_string())

except Exception as e:
    print(f"Error: {e}")
