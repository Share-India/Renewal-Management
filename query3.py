import pandas as pd
df = pd.read_excel('backend/src/main/resources/Renewal data 30.7.2026.xlsx', header=0)
for idx, row in df.iterrows():
    pol = str(row.get('Policy No', '')).strip()
    pol1 = str(row.get('Policy No 1', '')).strip()
    if '4193i/APRN/406827824/00/000' in pol or '4193i/APRN/406827824/00/000' in pol1:
        print("Found:", row.get('Customer Name', ''), "|", pol, "|", row.get('Email ID', ''))
