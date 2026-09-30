lines = open('frontend/src/app/components/customer-list/customer-list.component.html', encoding='utf-8').read()

lines = lines.replace('*ngIf="!isTeamRole"', '*ngIf="!isTeamRole && !isPosp"')
lines = lines.replace('<button class="btn btn-sm border-0 shadow-sm d-flex align-items-center justify-content-center" \n                                style="width: 36px; height: 36px; border-radius: 10px; background-color: #f1f3f5; color: #495057;" \n                                (click)="openHistoryModal(policy)" title="Call History">', '<button *ngIf="!isPosp" class="btn btn-sm border-0 shadow-sm d-flex align-items-center justify-content-center" \n                                style="width: 36px; height: 36px; border-radius: 10px; background-color: #f1f3f5; color: #495057;" \n                                (click)="openHistoryModal(policy)" title="Call History">')

# Wait, the history button has multiple occurrences?
# Let's just do a regex replace for the history button if it doesn't have ngIf.
import re
lines = re.sub(r'<button class="btn[^>]*\(click\)="openHistoryModal\(policy\)"[^>]*>', r'<button *ngIf="!isPosp" class="btn btn-sm border-0 shadow-sm d-flex align-items-center justify-content-center" \n                                style="width: 36px; height: 36px; border-radius: 10px; background-color: #f1f3f5; color: #495057;" \n                                (click)="openHistoryModal(policy)" title="Call History">', lines)

# For View Modal Edit Mode toggle
lines = lines.replace('<button class="btn btn-sm" [ngClass]="isEditing ? \\'btn-outline-danger\\' : \\'btn-outline-primary\\'"', '<button *ngIf="!isPosp" class="btn btn-sm" [ngClass]="isEditing ? \\'btn-outline-danger\\' : \\'btn-outline-primary\\'"')

open('frontend/src/app/components/customer-list/customer-list.component.html', 'w', encoding='utf-8').write(lines)
