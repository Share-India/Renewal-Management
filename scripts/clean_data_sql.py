
path = r"c:\Users\Sagar Dagle\.gemini\antigravity\scratch\insurance-renewal-app\backend\src\main\resources\data.sql"
backup_path = path + ".bak"

import shutil
import os

if not os.path.exists(backup_path):
    shutil.copy(path, backup_path)
    print(f"Backed up to {backup_path}")

with open(path, 'r', encoding='utf-8') as f:
    lines = f.readlines()

new_lines = []
removed_count = 0
for line in lines:
    # Check for null bytes or encoding artifacts
    if '\x00' in line or "<NA>" in line:
        removed_count += 1
        continue
    # Double check by stripping nulls if they exist covertly (utf-16le artifact)
    if line.count('\x00') > 0:
        removed_count += 1
        continue
        
    new_lines.append(line)

with open(path, 'w', encoding='utf-8') as f:
    f.writelines(new_lines)

print(f"Removed {removed_count} corrupted lines from {path}")
