import pandas as pd

file_path = r'c:\Users\Sagar Dagle\.gemini\antigravity\scratch\insurance-renewal-app\backend\target\classes\Copy of Renewal Data 2024-25-26.xlsx'

try:
    df = pd.read_excel(file_path)
    print("--- RAW COLUMN NAMES ---")
    print(df.columns.tolist())
    
    print("\n--- SAMPLE DATA for 'Contact Number' ---")
    if 'Contact Number' in df.columns:
        print(df['Contact Number'].head(10).to_string())
        print("\nData Type:", df['Contact Number'].dtype)
    else:
        print("CRITICAL: 'Contact Number' column NOT found exactly.")
        # Fuzzy match check
        for c in df.columns:
            if 'contact' in str(c).lower():
                print(f"Did you mean: '{c}' ?")

except Exception as e:
    print(f"Error: {e}")
