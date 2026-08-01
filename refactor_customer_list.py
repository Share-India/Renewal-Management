import re

file_path = r'c:\Users\Admin\.gemini\antigravity\scratch\insurance-renewal-app\frontend\src\app\components\customer-list\customer-list.component.ts'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Add import
if 'NotificationService' not in content:
    content = content.replace("import { AuthService } from '../../services/auth.service';", "import { AuthService } from '../../services/auth.service';\nimport { NotificationService } from '../../services/notification.service';")
    content = content.replace("constructor(private apiService: ApiService, private authService: AuthService) { }", "constructor(private apiService: ApiService, private authService: AuthService, private notificationService: NotificationService) { }")

# Replace async methods
content = content.replace('onDeletePolicy(policy: any) {', 'async onDeletePolicy(policy: any) {')
content = content.replace('deleteDocument(policy: any, type: string) {', 'async deleteDocument(policy: any, type: string) {')
content = content.replace('deleteTeamDocument(docId: number) {', 'async deleteTeamDocument(docId: number) {')
content = content.replace('sendBackToRenewer() {', 'async sendBackToRenewer() {')

# Replace confirm -> await this.notificationService.confirmAction
content = re.sub(r'confirm\((`|\'|")(.*?)(`|\'|")\)', r'await this.notificationService.confirmAction(\1\2\3)', content)

# Replace alert for successes and errors
def replace_alert(match):
    args = match.group(1)
    
    # Heuristic: If it contains 'Error', 'Failed', 'Please', 'No ', it's an error/warning
    if re.search(r'(error|failed|please|no\s)', args, re.IGNORECASE):
        return f'this.notificationService.showErrorModal({args})'
    elif 'Policy Renewal Submitted for Issuance' in args:
        return f'this.notificationService.showSuccessModal({args})'
    else:
        return f'this.notificationService.showSuccessToast({args})'

content = re.sub(r'alert\((.*?)\)', replace_alert, content)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Refactored customer-list.component.ts")
