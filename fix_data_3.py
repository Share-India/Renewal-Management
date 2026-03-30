import re

# Read the file
file_path = "C:/Users/Admin/.gemini/antigravity/scratch/insurance-renewal-app/backend/src/main/resources/data.sql"
with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# The insert statement for policies looks like:
# INSERT INTO policies (id, policy_number, customer_id, type, sub_type, status, issue_date, start_date, end_date, registration_number, year_of_make, make, model, variant, engine_number, chassis_number, amount, previous_insurance_company, current_insurance_company, reference, sub_reference, specific_details, bqp, agent, user_id, last_updated, branch) VALUES 
# Note that we added "branch" to the entity recently, but we need to check if the statement already has it.

if "INSERT INTO policies" in content:
    # Find the insert header
    header_pattern = re.compile(r"INSERT INTO policies \((.*?)\) VALUES")
    match = header_pattern.search(content)
    
    if match:
        columns_str = match.group(1)
        columns = [c.strip() for c in columns_str.split(',')]
        
        has_branch = "branch" in columns
        
        if not has_branch:
             # Add branch to the columns
             new_header = match.group(0).replace(")", ", branch)")
             content = content.replace(match.group(0), new_header)
        
        # Now find all the value tuples and append the branch value.
        # This is tricky because the values string might contain commas inside quotes.
        # A simpler way is to find the block of policy lines.
        
        lines = content.split('\n')
        in_policy_block = False
        new_lines = []
        
        for line in lines:
            if "INSERT INTO policies" in line:
                in_policy_block = True
                new_lines.append(line)
                continue
                
            if in_policy_block:
                if line.strip().startswith('('):
                    # It's a row of values.
                    # check if the row is followed by a comma, semi-colon, or EOF.
                    
                    if line.strip().endswith(';'):
                        # last line
                        row_content = line.strip()[:-2] # get rid of );
                        if not has_branch:
                            new_row = row_content + ", 'Mumbai');"
                        else:
                            # if it HAS branch but it's NULL or something, replace it
                            # Let's just assume for simplicity it didn't have branch
                            new_row = row_content + ", 'Mumbai');" 
                        new_lines.append(new_row)
                        in_policy_block = False # End of block
                        continue
                    
                    if line.strip().endswith(','):
                        row_content = line.strip()[:-2] # get rid of ),
                        if not has_branch:
                            new_row = row_content + ", 'Mumbai'),"
                        else:
                            new_row = row_content + ", 'Mumbai'),"
                        new_lines.append(new_row)
                        continue
                        
                else:
                    # just empty line or we stepped out of the block unexpectedly
                    if line.strip() == "":
                         new_lines.append(line)
                         continue
                    else:
                         in_policy_block = False
                         new_lines.append(line)
            else:
                new_lines.append(line)
                
        # Write back
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write('\n'.join(new_lines))
        print("Successfully updated policies with 'Mumbai' branch.")
    else:
        print("Could not parse the INSERT header.")
else:
    print("No policies insert statement found.")
