import pandas as pd

df = pd.read_excel('backend/src/main/resources/similar Cases Renewal Data .docx.xlsx')
policy_numbers = df['Policy Number'].dropna().astype(str).tolist()

with open('update_mumbai_lost_cases_aws.sql', 'w') as f:
    chunk_size = 1000
    for i in range(0, len(policy_numbers), chunk_size):
        chunk = policy_numbers[i:i+chunk_size]
        safe_chunk = [p.replace("'", "''") for p in chunk]
        format_strings = ','.join([f"'{p}'" for p in safe_chunk])
        query = f"UPDATE policies SET branch = 'Mumbai' WHERE branch = 'Mumbai (Lost Cases)' AND policy_number IN ({format_strings});\n"
        f.write(query)

print(f'Generated SQL script to update {len(policy_numbers)} policies.')
