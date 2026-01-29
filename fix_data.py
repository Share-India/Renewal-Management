import re
import os

path = r"backend/src/main/resources/data.sql"
output_path = path  # Overwrite

seen_emails = set()
fixed_lines = []
duplicates_count = 0

# Regex to capture ID and Email
# Relaxed regex to handle split lines. matches: INSERT ... VALUES (id, ... 'email',
# We rely on the email being a quoted string containing '@' followed by a comma (or close paren if it were last, but it's not)
pattern = re.compile(r"INSERT INTO customers .* VALUES \((\d+), .*'([^']+@[^']+)',", re.IGNORECASE)

print(f"Processing {path}...")

with open(path, 'r', encoding='utf-8') as f:
    for line in f:
        match = pattern.search(line)
        if match:
            cust_id = match.group(1)
            original_email = match.group(2)
            email_lower = original_email.lower()
            
            if email_lower in seen_emails:
                # Duplicate found
                duplicates_count += 1
                # Construct new email: name_id@domain
                if '@' in original_email:
                    local, domain = original_email.rsplit('@', 1)
                    new_email = f"{local}_{cust_id}@{domain}"
                else:
                    new_email = f"{original_email}_{cust_id}" # Fallback
                
                # Replace in line (careful to replace only the email)
                # We replace 'original_email' with 'new_email'
                # Use string replace for safety if email is unique in line
                new_line = line.replace(f"'{original_email}'", f"'{new_email}'")
                fixed_lines.append(new_line)
                # print(f"Fixed ID {cust_id}: {original_email} -> {new_email}")
            else:
                seen_emails.add(email_lower)
                fixed_lines.append(line)
        else:
            fixed_lines.append(line)

print(f"Found and fixed {duplicates_count} duplicate emails.")

with open(output_path, 'w', encoding='utf-8') as f:
    f.writelines(fixed_lines)

print("Done.")
