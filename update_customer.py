lines = open('frontend/src/app/components/customer-list/customer-list.component.ts', encoding='utf-8').readlines()
for i, line in enumerate(lines):
    if 'get isRm(): boolean {' in line:
        lines.insert(i, '    get isPosp(): boolean {\n        return this.authService.hasRole(\'POSP\');\n    }\n\n')
        break
open('frontend/src/app/components/customer-list/customer-list.component.ts', 'w', encoding='utf-8').writelines(lines)
