import uuid

email_to_name = {}
resolved_emails = {} # Maps (original_email, first_name_lower) to resolved_email

def resolve_email(original_email, first_name):
    first_name_lower = first_name.lower()
    
    # Check if we already resolved this (email, name) combo
    if (original_email, first_name_lower) in resolved_emails:
        return resolved_emails[(original_email, first_name_lower)]
        
    if original_email in email_to_name:
        # Someone else already claimed this original email
        if email_to_name[original_email].split(' ')[0].lower() != first_name_lower:
            new_email = f"{uuid.uuid4().hex[:5]}_{original_email}"
            resolved_emails[(original_email, first_name_lower)] = new_email
            return new_email
        else:
            # It's the same person
            resolved_emails[(original_email, first_name_lower)] = original_email
            return original_email
    else:
        # First one to claim this email
        email_to_name[original_email] = first_name
        resolved_emails[(original_email, first_name_lower)] = original_email
        return original_email

print(resolve_email("thakarwad.a@gmail.com", "Rohit"))
print(resolve_email("thakarwad.a@gmail.com", "Arvind"))
print(resolve_email("thakarwad.a@gmail.com", "Rohit"))
print(resolve_email("thakarwad.a@gmail.com", "Arvind"))
