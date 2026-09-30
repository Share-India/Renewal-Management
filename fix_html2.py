lines = open('frontend/src/app/components/user-management/user-management.component.ts', encoding='utf-8').read()

lines = lines.replace('<option value="RM">Relationship Manager (RM)</option>', '<option value="RM">Relationship Manager (RM)</option>\n                <option value="POSP">Point of Sales Person (POSP)</option>')

posp_block = '''              <!-- Specific Mapping for POSP Role -->
              <div class="mb-4" *ngIf="newUser.role === 'POSP'">
                <label class="form-label fw-bold text-dark"><i class="bi bi-person-badge text-warning me-2"></i>Map to POSP Name</label>
                <div class="card border border-warning shadow-sm p-3 bg-light">
                  <div class="input-group mb-3">
                    <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                    <input type="text" class="form-control border-start-0 ps-0 shadow-none" placeholder="Search POSP Name..." [(ngModel)]="pospSearchTerm" name="pospSearchTerm">
                  </div>
                  <select class="form-select border-warning-focus shadow-none" [(ngModel)]="selectedPosp" name="selectedPosp" required>
                    <option value="" disabled>Select a POSP...</option>
                    <option *ngFor="let posp of filteredPosps" [value]="posp">{{ posp }}</option>
                  </select>
                </div>
              </div>\n'''

lines = lines.replace('<!-- Specific Mapping for RM Role -->', posp_block + '              <!-- Specific Mapping for RM Role -->')

open('frontend/src/app/components/user-management/user-management.component.ts', 'w', encoding='utf-8').write(lines)
