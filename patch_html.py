import os

filepath = 'frontend/src/app/components/customer-list/customer-list.component.html'
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

content = content.replace('*ngIf="(isSalesManager || isSalesUser)"', '*ngIf="canDeleteDocument(doc, \'SALES\')"')
content = content.replace('*ngIf="(isUnderwritingManager || isUnderwritingUser)"', '*ngIf="canDeleteDocument(doc, \'UNDERWRITING\')"')

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)

