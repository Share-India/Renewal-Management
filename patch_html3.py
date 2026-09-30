lines = open('frontend/src/app/components/user-management/user-management.component.ts', encoding='utf-8').read()

lines = lines.replace('<option value="RM">Relationship Manager (RM)</option>', '<option value="RM">Relationship Manager (RM)</option>\\n                <option value="POSP">Point of Sales Person (POSP)</option>')

posp_html = '''

            <!-- POSP Assignment Filter -->
            <ng-container *ngIf="newUser.role === \\'POSP\\'">
              <div class="form-group">
                <label>Assigned POSP Name</label>
                <div class="product-types-container border rounded p-2 mt-1" style="max-height: 200px; overflow-y: auto; border-color: #ced4da;">
                  <div *ngIf="availablePospNames.length === 0" class="text-muted text-center p-2">
                    Loading POSP names or none available...
                  </div>
                  <ng-container *ngIf="availablePospNames.length > 0">
                    <div class="mb-2">
                      <input type="text" class="form-control form-control-sm" placeholder="Search POSP names..." [(ngModel)]="pospSearchTerm" name="pospSearchTerm">
                    </div>
                    <div class="form-check" *ngFor="let posp of filteredPosps; let i = index">
                      <input class="form-check-input" type="radio" name="pospSelection" [id]="\\'posp_\\' + i" 
                             [value]="posp" [(ngModel)]="selectedPosp">
                      <label class="form-check-label" [for]="\\'posp_\\' + i">
                        {{ posp }}
                      </label>
                    </div>
                  </ng-container>
                </div>
              </div>
            </ng-container>

'''

lines = lines.replace('<!-- Optional RENEWER Assignment Mode & Filters -->', posp_html + '            <!-- Optional RENEWER Assignment Mode & Filters -->')

open('frontend/src/app/components/user-management/user-management.component.ts', 'w', encoding='utf-8').write(lines)
