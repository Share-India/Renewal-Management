import re
import csv

file_path = r'c:\Users\Admin\.gemini\antigravity\scratch\insurance-renewal-app\backend\src\main\resources\data.sql'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace the INSERT INTO statement to include location
content = content.replace(
    'INSERT INTO customers (id, first_name, last_name, email, phone, dob, address, city, state, pincode, pan_number, billing_frequency) VALUES',
    'INSERT INTO customers (id, first_name, last_name, email, phone, dob, address, city, state, location, pincode, pan_number, billing_frequency) VALUES'
)

lines = content.split('\n')
new_lines = []

for line in lines:
    if line.startswith('(') and (line.endswith(',') or line.endswith(');')):
        # It's a value row. Let's parse it properly
        is_last = line.endswith(');')
        clean_line = line.strip()[:-1].strip('()') if not is_last else line.strip()[:-2].strip('()')
        
        parsed = list(csv.reader([clean_line], skipinitialspace=True))[0]
        
        if len(parsed) >= 9:
            # We want to insert location after state, which is index 8 
            # (id, first, last, email, phone, dob, address, city, state)
            
            # For SQL strings, csv reader removes quotes. We need to add them back if they were there.
            # But wait, python's csv reader will strip quotes if quotechar="'".
            # Let's just use a simple regex split that respects quotes.
            pass
            
def custom_split(s):
    in_quotes = False
    current = []
    result = []
    
    for char in s:
        if char == "'":
            in_quotes = not in_quotes
            current.append(char)
        elif char == ',' and not in_quotes:
            result.append(''.join(current).strip())
            current = []
        else:
            current.append(char)
            
    result.append(''.join(current).strip())
    return result

new_lines2 = []
for line in lines:
    if line.startswith('(') and (line.endswith(',') or line.endswith(');')):
        is_last = line.endswith(');')
        clean_line = line.strip()[:-1].strip('()') if not is_last else line.strip()[:-2].strip('()')
        
        parsed = custom_split(clean_line)
        if len(parsed) >= 9:
            parsed.insert(9, "'Mumbai'")
            new_line = '(' + ', '.join(parsed) + (')' if not is_last else ');')
            if not is_last: new_line += ','
            new_lines2.append(new_line)
        else:
            new_lines2.append(line)
    else:
        new_lines2.append(line)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write('\n'.join(new_lines2))
print('Updated data.sql')
