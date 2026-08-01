import re
import sys
import os

file_path = sys.argv[1]

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Skip if already refactored or no alerts/confirms
if 'NotificationService' in content or (not re.search(r'\balert\(', content) and not re.search(r'\bconfirm\(', content)):
    print(f"Skipping {file_path}")
    sys.exit(0)

# Add import NotificationService
if "import { NotificationService }" not in content:
    # Try to find a good place to inject
    if "import { Component" in content:
        content = content.replace("import { Component", "import { NotificationService } from '../../services/notification.service';\nimport { Component")
    elif "import { Component" in content:
        content = content.replace("import {Component", "import { NotificationService } from '../../services/notification.service';\nimport {Component")

# Inject into constructor
# We need to find the constructor line and add private notificationService: NotificationService
if "constructor(" in content:
    if "constructor() {" in content:
        content = content.replace("constructor() {", "constructor(private notificationService: NotificationService) {")
    elif "constructor() {" in content:
        content = content.replace("constructor() {", "constructor(private notificationService: NotificationService) {")
    else:
        # It has arguments
        content = re.sub(r'constructor\((.*?)\)\s*{', r'constructor(\1, private notificationService: NotificationService) {', content)

# Make methods that use confirm() async
methods_with_confirm = [
    'deletePolicy(policyId: number)',
    'onDeletePolicy(policy: any)',
    'deleteDocument(',
    'deleteTeamDocument(',
    'sendBackToRenewer(',
    'updateUserStatus(',
    'deleteUser('
]

for method in methods_with_confirm:
    # Match the method declaration exactly or with spaces
    pattern = r'(\w+)\s*\((.*?)\)\s*{'
    def make_async(match):
        method_name = match.group(1)
        args = match.group(2)
        if method_name in ['onDeletePolicy', 'deletePolicy', 'deleteDocument', 'deleteTeamDocument', 'sendBackToRenewer', 'updateUserStatus', 'deleteUser', 'toggleUserStatus']:
            return f'async {method_name}({args}) {{'
        return match.group(0)
    
    content = re.sub(pattern, make_async, content)
    
    # some might not match exactly, so hardcode the ones we know
    content = content.replace('deletePolicy(policyId: number) {', 'async deletePolicy(policyId: number) {')
    content = content.replace('toggleUserStatus(user: any, action: string) {', 'async toggleUserStatus(user: any, action: string) {')
    content = content.replace('deleteUser(user: any) {', 'async deleteUser(user: any) {')

# Replace confirm -> await this.notificationService.confirmAction
# Using a regex that handles backticks, single quotes, double quotes
content = re.sub(r'confirm\((.*?)\)', r'await this.notificationService.confirmAction(\1)', content)

# Replace alert for successes and errors
def replace_alert(match):
    args = match.group(1)
    
    # Heuristic: If it contains 'Error', 'Failed', 'Please', 'No ', it's an error/warning
    if re.search(r'(error|failed|please|no\s|could not|not match)', args, re.IGNORECASE):
        return f'this.notificationService.showErrorModal({args})'
    elif 'Policy Renewal Submitted for Issuance' in args:
        return f'this.notificationService.showSuccessModal({args})'
    else:
        return f'this.notificationService.showSuccessToast({args})'

content = re.sub(r'alert\((.*?)\)', replace_alert, content)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print(f"Refactored {file_path}")
