lines = open('frontend/src/app/components/user-management/user-management.component.ts', encoding='utf-8').read()
lines = lines.replace('\\'POSP\\'', "'POSP'")
lines = lines.replace('\\'posp_\\'', "'posp_'")
open('frontend/src/app/components/user-management/user-management.component.ts', 'w', encoding='utf-8').write(lines)
