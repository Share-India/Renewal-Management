import re
text = open('frontend/src/app/components/admin-dashboard/admin-dashboard.component.ts', encoding='utf-8').read()

text = text.replace('{{ isRmRole() ? \'RM Dashboard\' : \'Administrative Dashboard\' }}', '{{ isPospRole() ? \\'POSP Dashboard\\' : (isRmRole() ? \\'RM Dashboard\\' : \\'Administrative Dashboard\\') }}')
text = text.replace('{{ isRmRole() ? \'Manage your relationship data and follow-ups\' : \'Real-time insights into system performance and daily administrative tasks\' }}', '{{ isPospRole() ? \\'View your mapped policies and follow-ups\\' : (isRmRole() ? \\'Manage your relationship data and follow-ups\\' : \\'Real-time insights into system performance and daily administrative tasks\\') }}')
text = text.replace('*ngIf="!isRmRole()"', '*ngIf="!isRmRole() && !isPospRole()"')
text = text.replace('[userRole]="isRmRole() ? \'RM\' : \'ADMIN\'"', '[userRole]="isPospRole() ? \\'POSP\\' : (isRmRole() ? \\'RM\\' : \\'ADMIN\\')"')
text = text.replace('if (!this.isRmRole()) {', 'if (!this.isRmRole() && !this.isPospRole()) {')
text = text.replace('if (this.isRmRole()) {', 'if (this.isRmRole() || this.isPospRole()) {')

# Add isPospRole
text = text.replace('isRmRole(): boolean {\n    return this.authService.hasRole(\'RM\');\n  }', 'isRmRole(): boolean {\n    return this.authService.hasRole(\'RM\');\n  }\n\n  isPospRole(): boolean {\n    return this.authService.hasRole(\'POSP\');\n  }')

open('frontend/src/app/components/admin-dashboard/admin-dashboard.component.ts', 'w', encoding='utf-8').write(text)
