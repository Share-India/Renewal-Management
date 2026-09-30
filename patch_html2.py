import re
lines = open('frontend/src/app/components/customer-list/customer-list.component.html', encoding='utf-8').read()
lines = lines.replace('*ngIf="!isTeamRole"', '*ngIf="!isTeamRole && !isPosp"')
lines = re.sub(r'<button class="btn[^>]*\(click\)="openHistoryModal\(policy\)"[^>]*>', r'<button *ngIf="!isPosp" class="btn btn-sm border-0 shadow-sm d-flex align-items-center justify-content-center" style="width: 36px; height: 36px; border-radius: 10px; background-color: #f1f3f5; color: #495057;" (click)="openHistoryModal(policy)" title="Call History">', lines)
lines = lines.replace('<button class="btn btn-sm" [ngClass]="isEditing', '<button *ngIf="!isPosp" class="btn btn-sm" [ngClass]="isEditing')
open('frontend/src/app/components/customer-list/customer-list.component.html', 'w', encoding='utf-8').write(lines)
