lines = open('frontend/src/app/components/user-management/user-management.component.ts', encoding='utf-8').read()

lines = lines.replace('<option value="RM">Relationship Manager (RM)</option>', '<option value="RM">Relationship Manager (RM)</option>\n                <option value="POSP">Point of Sales Person (POSP)</option>')

rm_block = '''              <!-- Specific Mapping for RM Role -->
              <div class="mb-4" *ngIf="newUser.role === 'RM'">
                <label class="form-label fw-bold text-dark"><i class="bi bi-person-badge text-primary me-2"></i>Map to Specific RM Names</label>
                <div class="card border border-primary-focus shadow-sm p-3 bg-light">
                  <div class="input-group mb-3">
                    <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                    <input type="text" class="form-control border-start-0 ps-0 shadow-none" placeholder="Search RM Name..." [(ngModel)]="rmSearchTerm" name="rmSearchTerm">
                  </div>
                  <div class="form-check mb-2">
                    <input class="form-check-input" type="checkbox" id="selectAllRms" [checked]="allRmsSelected" (change)="toggleAllRms()">
                    <label class="form-check-label fw-bold text-dark" for="selectAllRms">Select All {{availableRmNames.length}} RMs</label>
                  </div>
                  <hr class="my-2">
                  <div class="row g-2" style="max-height: 200px; overflow-y: auto;">
                    <div class="col-md-6" *ngFor="let rm of filteredRms">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" [id]="'rm_'+rm" [checked]="selectedRms.includes(rm)" (change)="toggleRm(rm, )">
                        <label class="form-check-label text-dark" [for]="'rm_'+rm">{{rm}}</label>
                      </div>
                    </div>
                  </div>
                  <div *ngIf="filteredRms.length === 0" class="text-muted small">No RM found matching search.</div>
                </div>
              </div>'''

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
              </div>'''

lines = lines.replace(rm_block, rm_block + '\n\n' + posp_block)

open('frontend/src/app/components/user-management/user-management.component.ts', 'w', encoding='utf-8').write(lines)
