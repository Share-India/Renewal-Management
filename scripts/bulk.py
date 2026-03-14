import sys

def combine_inserts(input_file, output_file, chunk_size=1000):
    with open(input_file, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        
    out_lines = []
    
    current_table = None
    current_columns = None
    current_values = []
    
    def flush():
        if current_values:
            stmt = f"INSERT INTO {current_table} ({current_columns}) VALUES " + ", ".join(current_values)
            # Remove ON DUPLICATE KEY UPDATE from bulk loads since we handle uniqueness in python mostly, 
            # except for the email constraint. Wait, bulk inserts with ON DUPLICATE KEY UPDATE works beautifully!
            if current_table == 'customers':
                stmt += " ON DUPLICATE KEY UPDATE email=VALUES(email)"
            elif current_table == 'policies':
                stmt += " ON DUPLICATE KEY UPDATE policy_number=VALUES(policy_number)"
            elif current_table == 'reminders':
                stmt += " ON DUPLICATE KEY UPDATE policy_id=VALUES(policy_id)"
            stmt += ";"
            out_lines.append(stmt)
            current_values.clear()

    for line in lines:
        line = line.strip()
        if not line:
            continue
        if line.startswith('SET ') or line.startswith('--'):
            out_lines.append(line)
            continue
        
        if line.startswith('INSERT INTO '):
            # Parse `INSERT INTO table (cols) VALUES (vals) ON DUPLICATE KEY UPDATE ...;`
            start = line.find('VALUES (') + 7  # include '('
            end = line.rfind(') ON DUPLICATE KEY UPDATE')
            if end == -1:
                end = line.rfind(');')
            
            table_info = line[12:line.find('VALUES')].strip()
            table_name = table_info.split(' ')[0]
            columns = table_info[table_info.find('(')+1 : table_info.find(')')]
            
            val_str = line[start:end+1] # '(val1, val2)'
            
            if table_name != current_table:
                flush()
                current_table = table_name
                current_columns = columns
                
            current_values.append(val_str)
            
            if len(current_values) >= chunk_size:
                flush()
                
    flush()
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("\n".join(out_lines))
        
    print(f"Compressed {len(lines)} lines into {len(out_lines)} bulk inserts.")

if __name__ == '__main__':
    combine_inserts('backend/src/main/resources/data.sql', 'backend/src/main/resources/data.sql')
