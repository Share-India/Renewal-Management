import pandas as pd
import math
import numpy as np

# Load Excel file
excel_path = "C:/Users/Admin/.gemini/antigravity/scratch/insurance-renewal-app/backend/src/main/resources/Renewal Data.xlsx"
sql_path = "C:/Users/Admin/.gemini/antigravity/scratch/insurance-renewal-app/backend/src/main/resources/data.sql"

# I am going to modify the existing update_data.py to explicitly append the 'Mumbai' branch to policies
# The previous version of the project already had a python script `update_data.py` to generate the SQL from excel
# I am rewriting it to encompass the new branch parameter.

try:
    df = pd.read_excel(excel_path)
    print("Excel opened successfully.")
    
    # Let's inspect columns
    print(df.columns)
    
except Exception as e:
    print(f"Error opening Excel: {e}")
