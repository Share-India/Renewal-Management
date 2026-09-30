lines = open('frontend/src/app/services/auth.service.ts', encoding='utf-8').readlines()
for i, line in enumerate(lines):
    if 'isAdmin(): boolean {' in line:
        lines.insert(i, '    isPosp(): boolean {\n        const user = this.getCurrentUser();\n        return !!(user && user.role && user.role.toUpperCase() === \'POSP\');\n    }\n\n')
        break
open('frontend/src/app/services/auth.service.ts', 'w', encoding='utf-8').writelines(lines)
