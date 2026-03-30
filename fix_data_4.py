import re

file_path = "C:/Users/Admin/.gemini/antigravity/scratch/insurance-renewal-app/backend/src/main/resources/data.sql"
with open(file_path, 'r', encoding='utf-8') as f:
    text = f.read()

# 1. Update the INSERT INTO policies header
# Find: INSERT INTO policies (id, ..., user_id, last_updated) VALUES
# Add , branch
def insert_header_repl(match):
    header = match.group(0)
    if "branch" not in header:
        return header.replace(")", ", branch)")
    return header

text = re.sub(r'INSERT INTO policies \([^)]+\) VALUES', insert_header_repl, text)

# 2. Add 'Mumbai' to every tuple. 
# We only want to do this for tuples in the 'policies' table inserts.
# Notice there are multiple INSERT INTO policies statements!
# We can find each block that starts with "INSERT INTO policies" and ends with ";"
blocks = text.split("INSERT INTO policies")
new_blocks = [blocks[0]]

for block in blocks[1:]:
    # 'block' contains everything up to the next INSERT INTO policies (or EOF)
    # The actual INSERT statement ends at the first ';'
    statement, sep, rest = block.partition(';')
    
    # In 'statement', replace every '),\n' with ", 'Mumbai'),\n"
    # and wait! we need to replace the final end which would be before ';'
    # BUT wait, the trailing ';' is removed by partition.
    # The statement string will end with ')' right now.
    
    # Fix the trailing commas
    statement = re.sub(r'\),\s*\n', r", 'Mumbai'),\n", statement)
    # Fix the very last tuple (which ends with ')' followed by nothing since we partitioned on ';')
    if statement.strip().endswith(')'):
        # rsplit to only replace the last occurrence
        statement = statement.rstrip()[:-1] + ", 'Mumbai')"
        
    new_blocks.append("INSERT INTO policies" + statement + sep + rest)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write("".join(new_blocks))

print("Fixed policies dynamically!")
