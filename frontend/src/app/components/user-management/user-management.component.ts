import { NotificationService } from '../../services/notification.service';
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../services/auth.service';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-user-management',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="user-mgmt-container">
      <div class="mgmt-card">
        <div class="card-header pb-0 border-bottom-0 text-center">
          <h3><i class="bi bi-people-fill"></i> User Management</h3>
          <p class="text-muted mb-2">Create and manage system access</p>
          
          <div class="custom-switch-container mb-3">
            <button class="switch-btn" [class.active]="activeTab === 'add-user'" (click)="activeTab = 'add-user'">
              <i class="bi bi-person-plus"></i> Add New User
            </button>
            <button class="switch-btn" [class.active]="activeTab === 'bulk-assign'" (click)="activeTab = 'bulk-assign'">
              <i class="bi bi-file-earmark-spreadsheet"></i> Bulk Assign Policies
            </button>
          </div>
        </div>
        
        <div class="card-body pt-4" *ngIf="activeTab === 'add-user'">
          <div class="form-grid">
            <div class="form-group">
              <label>Username</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-person"></i></span>
                <input type="text" [(ngModel)]="newUser.username" class="form-control" placeholder="e.g. john.doe">
              </div>
            </div>
            
            <div class="form-group">
              <label>Password</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-key"></i></span>
                <input type="password" [(ngModel)]="newUser.password" class="form-control" placeholder="••••••••">
              </div>
            </div>

            <div class="form-group">
              <label>Confirm Password</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-key-fill"></i></span>
                <input type="password" [(ngModel)]="confirmPassword" class="form-control" placeholder="••••••••">
              </div>
            </div>
            
            <div class="form-group">
              <label>Role</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-shield-lock"></i></span>
                <select [(ngModel)]="newUser.role" class="form-select">
                  <option value="RENEWER">Renewer (Agent)</option>
                  <option value="SERVICING">Policy Servicing</option>
                  <option value="MIS">MIS</option>
                  <option value="ADMIN">Administrator</option>
                  <option value="RM">Relationship Manager</option>
                  <option value="CLAIMS_MANAGER">Claims Manager</option>
                  <option value="SALES_MANAGER">Sales Manager</option>
                  <option value="UNDERWRITING_MANAGER">Underwriting Manager</option>
                </select>
              </div>
            </div>

            <!-- Optional Branch Filter for Agents & RM -->
            <ng-container *ngIf="['RENEWER', 'SERVICING', 'MIS', 'RM'].includes(newUser.role)">
              <div class="form-group">
                <label>Assigned Branches</label>
                <div class="product-types-container border rounded p-2 mt-1" style="max-height: 200px; overflow-y: auto; border-color: #ced4da;">
                  <div class="form-check border-bottom pb-2 mb-2">
                    <input class="form-check-input" type="checkbox" id="selectAllBranches" 
                           [checked]="allBranchesSelected" (change)="toggleAllBranches($event)">
                    <label class="form-check-label fw-bold" for="selectAllBranches">
                      All Branches Globally
                    </label>
                  </div>
                  <div class="form-check" *ngFor="let b of availableBranches; let i = index">
                    <input class="form-check-input" type="checkbox" [id]="'branch_' + i" 
                           [checked]="selectedBranches.includes(b)" (change)="toggleBranch(b, $event)">
                    <label class="form-check-label" [for]="'branch_' + i">
                      {{ b }}
                    </label>
                  </div>
                </div>
              </div>
            </ng-container>

            <!-- RM Assignment Filter -->
            <ng-container *ngIf="newUser.role === 'RM'">
              <div class="form-group">
                <label>Assigned Relationship Manager (Select Branch First)</label>
                <div class="product-types-container border rounded p-2 mt-1" style="max-height: 200px; overflow-y: auto; border-color: #ced4da;">
                  <div *ngIf="selectedBranches.length === 0" class="text-muted text-center p-2">
                    Please select a branch above to see RM names.
                  </div>
                  <div *ngIf="selectedBranches.length > 0 && loadingRmNames" class="text-center p-2">
                    <div class="spinner-border spinner-border-sm text-primary"></div> Loading...
                  </div>
                  <div *ngIf="selectedBranches.length > 0 && !loadingRmNames && availableRmNames.length === 0" class="text-muted text-center p-2">
                    No RM names found for this branch.
                  </div>
                  <ng-container *ngIf="selectedBranches.length > 0 && !loadingRmNames && availableRmNames.length > 0">
                    <div class="mb-2">
                      <input type="text" class="form-control form-control-sm" placeholder="Search RM names..." [(ngModel)]="rmSearchTerm">
                    </div>
                    <div class="form-check border-bottom pb-2 mb-2">
                      <input class="form-check-input" type="checkbox" id="selectAllRms" 
                             [checked]="allRmsSelected" (change)="toggleAllRms($event)">
                      <label class="form-check-label fw-bold" for="selectAllRms">
                        All Relationship Managers
                      </label>
                    </div>
                    <div class="form-check" *ngFor="let rm of filteredRms; let i = index">
                      <input class="form-check-input" type="checkbox" [id]="'rm_' + i" 
                             [checked]="selectedRms.includes(rm)" (change)="toggleRm(rm, $event)">
                      <label class="form-check-label" [for]="'rm_' + i">
                        {{ rm }}
                      </label>
                    </div>
                  </ng-container>
                </div>
              </div>
            </ng-container>

            <!-- Optional RENEWER Assignment Mode & Filters -->
            <ng-container *ngIf="newUser.role === 'RENEWER'">
              
              <div class="form-group">
                <label>Assignment Mode</label>
                <div class="d-flex gap-3 mt-2">
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="assignmentMode" id="modeProduct" value="product" [(ngModel)]="assignmentMode">
                    <label class="form-check-label" for="modeProduct">By Product & Premium</label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="assignmentMode" id="modeCustomer" value="customer" [(ngModel)]="assignmentMode" (change)="onAssignmentModeChange()">
                    <label class="form-check-label" for="modeCustomer">By Customer & Premium</label>
                  </div>
                </div>
              </div>

              <!-- Product Types List -->
              <div class="form-group" *ngIf="assignmentMode === 'product'">
                <label>Assigned Product Types</label>
                <div class="product-types-container border rounded p-2 mt-1" style="max-height: 200px; overflow-y: auto; border-color: #ced4da;">
                  <div class="form-check border-bottom pb-2 mb-2">
                    <input class="form-check-input" type="checkbox" id="selectAllProducts" 
                           [checked]="allProductTypesSelected" (change)="toggleAllProductTypes($event)">
                    <label class="form-check-label fw-bold" for="selectAllProducts">
                      All Products
                    </label>
                  </div>
                  <div class="form-check" *ngFor="let type of availableProductTypes; let i = index">
                    <input class="form-check-input" type="checkbox" [id]="'type_' + i" 
                           [checked]="selectedProductTypes.includes(type)" (change)="toggleProductType(type, $event)">
                    <label class="form-check-label" [for]="'type_' + i">
                      {{ type }}
                    </label>
                  </div>
                </div>
              </div>

              <!-- Customer Selection List -->
              <div class="form-group" *ngIf="assignmentMode === 'customer'">
                <label>Assigned Customers (Select Branch First)</label>
                <div class="product-types-container border rounded p-2 mt-1" style="max-height: 200px; overflow-y: auto; border-color: #ced4da;">
                  <div *ngIf="selectedBranches.length === 0" class="text-muted text-center p-2">
                    Please select a branch above to see customers.
                  </div>
                  <div *ngIf="selectedBranches.length > 0 && loadingCustomers" class="text-center p-2">
                    <div class="spinner-border spinner-border-sm text-primary"></div> Loading...
                  </div>
                  <div *ngIf="selectedBranches.length > 0 && !loadingCustomers && availableCustomers.length === 0" class="text-muted text-center p-2">
                    No customers found for this branch.
                  </div>
                  <ng-container *ngIf="selectedBranches.length > 0 && !loadingCustomers && availableCustomers.length > 0">
                    <div class="mb-2">
                      <input type="text" class="form-control form-control-sm" placeholder="Search customers..." [(ngModel)]="customerSearchTerm">
                    </div>
                    <div class="form-check border-bottom pb-2 mb-2">
                      <input class="form-check-input" type="checkbox" id="selectAllCustomers" 
                             [checked]="allCustomersSelected" (change)="toggleAllCustomers($event)">
                      <label class="form-check-label fw-bold" for="selectAllCustomers">
                        All Customers
                      </label>
                    </div>
                    <div class="form-check" *ngFor="let cust of filteredCustomers; let i = index">
                      <input class="form-check-input" type="checkbox" [id]="'cust_' + i" 
                             [checked]="selectedCustomers.includes(cust)" (change)="toggleCustomer(cust, $event)">
                      <label class="form-check-label" [for]="'cust_' + i">
                        {{ cust }}
                      </label>
                    </div>
                  </ng-container>
                </div>
              </div>
              
              <div class="form-group">
                <label>Assigned Premium Range</label>
                  <div style="max-height: 200px; overflow-y: auto; padding: 10px; border: 1px solid #ced4da; border-radius: 4px; background: #fff;">
                    <div class="form-check border-bottom pb-2 mb-2">
                      <input class="form-check-input" type="checkbox" id="premium_all" 
                             [checked]="allPremiumRangesSelected" (change)="toggleAllPremiumRanges($event)">
                      <label class="form-check-label fw-bold" for="premium_all">
                        All Premium Ranges
                      </label>
                    </div>
                    <div class="form-check" *ngFor="let range of availablePremiumRanges; let i = index">
                      <input class="form-check-input" type="checkbox" [id]="'premium_' + i" 
                             [checked]="selectedPremiumRanges.includes(range)" (change)="togglePremiumRange(range, $event)">
                      <label class="form-check-label" [for]="'premium_' + i">
                        {{ range }}
                      </label>
                    </div>
                  </div>
              </div>
            </ng-container>
          </div>

          <button class="btn btn-primary w-100 mt-4" (click)="createUser()" [disabled]="loading">
            <span *ngIf="!loading"><i class="bi bi-plus-circle"></i> Create User</span>
            <span *ngIf="loading" class="spinner-border spinner-border-sm"></span>
          </button>
          
          <div *ngIf="message" class="alert mt-3" [class.alert-success]="success" [class.alert-danger]="!success">
            <i class="bi" [class.bi-check-circle-fill]="success" [class.bi-exclamation-triangle-fill]="!success"></i>
            {{ message }}
          </div>

          <button class="btn btn-outline-secondary w-100 mt-3" (click)="openUserList()">
            <i class="bi bi-list-ul"></i> View All Users
          </button>
        </div>

        <!-- Bulk Assign via Excel -->
        <div class="card-body pt-4" *ngIf="activeTab === 'bulk-assign'">
          
          <div class="modern-form-group mb-4">
            <label class="modern-label">Assign To Renewer</label>
            <div class="modern-input-wrapper">
              <i class="bi bi-person-badge modern-input-icon"></i>
              <select class="form-select modern-select" [(ngModel)]="uploadSelectedRenewer">
                <option value="" disabled selected>Choose a renewer from the list...</option>
                <option *ngFor="let user of getRenewerUsers()" [value]="user.username">{{ user.username }}</option>
              </select>
            </div>
          </div>

          <div class="modern-form-group mb-4">
            <label class="modern-label">Target Branch</label>
            <div class="modern-input-wrapper">
              <i class="bi bi-building modern-input-icon"></i>
              <select class="form-select modern-select" [(ngModel)]="uploadSelectedBranch">
                <option value="" disabled selected>Choose the associated branch...</option>
                <option *ngFor="let branch of availableBranches" [value]="branch">{{ branch }}</option>
              </select>
            </div>
          </div>

          <div class="modern-form-group mb-5">
            <div class="d-flex justify-content-between align-items-center mb-2">
              <label class="modern-label mb-0">Upload Excel Data</label>
              <button class="btn btn-sm modern-format-btn" (click)="downloadFormatExcel()" title="Download the required Excel template">
                <i class="bi bi-file-earmark-arrow-down me-1"></i> Get Template
              </button>
            </div>
            
            <div class="modern-file-dropzone" [class.has-file]="selectedExcelFile">
              <input type="file" class="modern-file-input" accept=".xlsx, .xls" (change)="onExcelFileSelected($event)" id="excelUpload">
              <label for="excelUpload" class="modern-file-label text-center w-100 py-4 cursor-pointer">
                <i class="bi bi-cloud-arrow-up text-primary mb-2" style="font-size: 2rem;"></i>
                <span class="d-block fw-semibold text-dark">{{ selectedExcelFile ? selectedExcelFile.name : 'Click to browse or drag file here' }}</span>
                <span class="d-block text-muted small mt-1">Must exactly match the provided template columns</span>
              </label>
            </div>
          </div>

          <button class="btn modern-submit-btn w-100" (click)="uploadExcelAndAssign()" [disabled]="uploadingExcel || !uploadSelectedRenewer || !uploadSelectedBranch || !selectedExcelFile">
            <span *ngIf="!uploadingExcel"><i class="bi bi-rocket-takeoff me-2"></i> Upload and Assign Policies</span>
            <span *ngIf="uploadingExcel" class="spinner-border spinner-border-sm"></span>
          </button>

          <div *ngIf="uploadMessage" class="alert mt-3" [class.alert-success]="uploadSuccess" [class.alert-danger]="!uploadSuccess">
            <i class="bi" [class.bi-check-circle-fill]="uploadSuccess" [class.bi-exclamation-triangle-fill]="!uploadSuccess"></i>
            {{ uploadMessage }}
          </div>
        </div>

      </div>
    </div>

    <!-- Users List Modal -->
    <div class="modal-overlay" *ngIf="showUserList" (click)="closeUserList()">
      <div class="custom-modal-content" (click)="$event.stopPropagation()">
        <div class="modal-header">
          <h3>System Users</h3>
          <button class="btn-close" (click)="closeUserList()"></button>
        </div>
        <div class="modal-body">
          <div *ngIf="loadingUsers" class="text-center py-3">
            <div class="spinner-border text-primary" role="status"></div>
          </div>
          <table *ngIf="!loadingUsers" class="table table-hover">
            <thead>
              <tr>
                <th>Username</th>
                <th>Role</th>
                <th>Status</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr *ngFor="let user of users">
                <td>{{ user.username }}</td>
                <td>
                  <span class="badge" [ngClass]="getRoleBadgeClass(user.role)">
                    {{ getRoleDisplay(user.role) }}
                  </span>
                </td>
                <td>
                  <span class="badge" [class.bg-success]="user.active" [class.bg-danger]="!user.active">
                    {{ user.active ? 'Active' : 'Inactive' }}
                  </span>
                </td>
                <td>
                  <button class="btn btn-sm me-2" [class.btn-outline-danger]="user.active" [class.btn-outline-success]="!user.active" 
                          (click)="toggleUserStatus(user)" [title]="user.active ? 'Deactivate' : 'Activate'">
                    <i class="bi" [class.bi-person-dash-fill]="user.active" [class.bi-person-check-fill]="!user.active"></i>
                  </button>
                  <button class="btn btn-sm btn-outline-danger" (click)="hardDeleteUser(user)" title="Delete User">
                    <i class="bi bi-trash-fill"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" (click)="closeUserList()">Close</button>
        </div>
      </div>
    </div>

    <!-- Custom Delete Confirmation Modal -->
    <div class="modal-overlay" *ngIf="userToDelete" style="z-index: 1050;" (click)="cancelDeleteUser()">
      <div class="custom-modal-content" style="max-width: 450px; border-top: 5px solid #dc3545;" (click)="$event.stopPropagation()">
        <div class="modal-header border-bottom-0 pb-0">
          <h4 class="text-danger mb-0"><i class="bi bi-exclamation-triangle-fill me-2"></i> Delete User</h4>
          <button class="btn-close" (click)="cancelDeleteUser()"></button>
        </div>
        <div class="modal-body py-4">
          <p class="fs-5 mb-2">Are you sure you want to delete <strong>{{ userToDelete.username }}</strong>?</p>
          <p class="text-muted mb-0">They will lose all access to the system immediately. This action <strong>cannot</strong> be undone.</p>
        </div>
        <div class="modal-footer border-top-0 pt-0 gap-2">
          <button class="btn btn-light" (click)="cancelDeleteUser()">Cancel</button>
          <button class="btn btn-danger" (click)="confirmDeleteUser()">Yes, Delete User</button>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-mgmt-container {
      padding: 40px 20px;
      background-color: #f8f9fa;
      min-height: calc(100vh - 56px); /* Adjust for navbar */
      display: flex;
      justify-content: center;
      align-items: flex-start;
    }
    
    .mgmt-card {
      background: white;
      border-radius: 16px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.05);
      width: 100%;
      max-width: 600px;
      overflow: hidden;
      border: 1px solid rgba(0,0,0,0.05);
    }
    
    .card-header {
      background: #fff;
      padding: 30px 30px 10px;
      border-bottom: none;
    }
    .card-header h3 { margin: 0; color: #2c3e50; font-weight: 700; display: flex; justify-content: center; align-items: center; gap: 10px; }
    .text-muted { color: #6c757d; margin-top: 5px; }

    .custom-switch-container {
      display: inline-flex;
      background-color: #f1f5f9;
      border-radius: 30px;
      padding: 4px;
      margin-top: 10px;
    }
    .switch-btn {
      background: transparent;
      border: none;
      padding: 8px 20px;
      border-radius: 26px;
      color: #64748b;
      font-weight: 500;
      transition: all 0.3s ease;
    }
    .switch-btn:hover {
      color: #3b82f6;
    }
    .switch-btn.active {
      background-color: white;
      color: #0d6efd;
      box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    }
    
    .card-body { padding: 30px; }
    .form-title { font-size: 1.1rem; color: #495057; margin-bottom: 25px; font-weight: 600; border-left: 4px solid #0d6efd; padding-left: 10px; }
    
    .form-grid { display: grid; gap: 20px; }
    .form-group label { display: block; margin-bottom: 8px; font-weight: 500; color: #495057; font-size: 0.95rem; }
    
    .input-group-text { background-color: #f8f9fa; border-color: #ced4da; color: #6c757d; }
    .form-control, .form-select {
      padding: 12px;
      border: 1px solid #ced4da;
      font-size: 1rem;
    }
    .form-control:focus, .form-select:focus {
      border-color: #86b7fe;
      box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
    }
    
    .btn-primary {
      padding: 14px;
      font-weight: 600;
      border-radius: 8px;
      background: linear-gradient(45deg, #0d6efd, #0a58ca);
      border: none;
      transition: all 0.2s;
    }
    .btn-primary:hover { transform: translateY(-1px); box-shadow: 0 4px 12px rgba(13, 110, 253, 0.25); }
    .btn-primary:disabled { opacity: 0.7; transform: none; }
    
    .alert { padding: 15px; border-radius: 8px; display: flex; align-items: center; gap: 10px; font-size: 0.95rem; }
    
    .modal-overlay {
      position: fixed; top: 0; left: 0; width: 100%; height: 100%;
      background: rgba(0,0,0,0.5); z-index: 1000;
      display: flex; justify-content: center; align-items: center;
    }
    .custom-modal-content {
      background: white; width: 90%; max-width: 600px;
      border-radius: 12px; box-shadow: 0 5px 15px rgba(0,0,0,0.3);
      padding: 0; display: flex; flex-direction: column; max-height: 80vh;
    }
    .modal-header { padding: 15px 20px; border-bottom: 1px solid #dee2e6; display: flex; justify-content: space-between; align-items: center; }
    .modal-body { padding: 20px; overflow-y: auto; }
    .modal-footer { padding: 15px 20px; border-top: 1px solid #dee2e6; text-align: right; }
    .btn-close { background: none; border: none; font-size: 1.5rem; cursor: pointer; color: #aaa; }
    
    /* Modern Form UI */
    .modern-form-group { position: relative; }
    .modern-label { font-size: 0.9rem; font-weight: 600; color: #4b5563; margin-bottom: 0.5rem; }
    .modern-input-wrapper { position: relative; display: flex; align-items: center; }
    .modern-input-icon { position: absolute; left: 1rem; color: #6b7280; font-size: 1.1rem; z-index: 10; pointer-events: none; }
    .modern-select { padding-left: 2.75rem; border-radius: 10px; border: 1px solid #d1d5db; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05); transition: border-color 0.2s, box-shadow 0.2s; min-height: 2.75rem; appearance: none; }
    .modern-select:focus { border-color: #6366f1; box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2); outline: none; }
    .modern-format-btn { color: #4f46e5; background-color: #e0e7ff; border: none; font-weight: 500; border-radius: 8px; transition: background-color 0.2s; }
    .modern-format-btn:hover { background-color: #c7d2fe; }
    .modern-file-dropzone { border: 2px dashed #d1d5db; border-radius: 12px; background-color: #f9fafb; transition: all 0.2s; position: relative; }
    .modern-file-dropzone:hover { border-color: #6366f1; background-color: #eff6ff; }
    .modern-file-dropzone.has-file { border-color: #10b981; border-style: solid; background-color: #ecfdf5; }
    .modern-file-dropzone.has-file i { color: #10b981 !important; }
    .modern-file-input { opacity: 0; position: absolute; width: 100%; height: 100%; top: 0; left: 0; cursor: pointer; z-index: 5; }
    .modern-submit-btn { background-color: #4f46e5; border: none; color: white; border-radius: 10px; padding: 0.75rem; font-weight: 600; box-shadow: 0 4px 6px -1px rgba(79, 70, 229, 0.2); transition: all 0.2s; }
    .modern-submit-btn:hover:not(:disabled) { background-color: #4338ca; box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.3); transform: translateY(-1px); }
    .cursor-pointer { cursor: pointer; }
  `]
})
export class UserManagementComponent implements OnInit {
  newUser: any = { 
    username: '', 
    password: '', 
    role: 'RENEWER',
    assignedBranch: '',
    assignedProductType: '',
    assignedPremiumRange: '',
    assignedCustomers: '',
    assignedRm: ''
  };
  confirmPassword = '';
  
  availableBranches: string[] = [];
  selectedBranches: string[] = [];
  
  get allBranchesSelected(): boolean {
    return this.availableBranches.length > 0 && this.selectedBranches.length === this.availableBranches.length;
  }
  
  message = '';
  success = false;
  loading = false;

  assignmentMode: 'product' | 'customer' = 'product';
  availableCustomers: string[] = [];
  selectedCustomers: string[] = [];
  loadingCustomers = false;
  customerSearchTerm = '';

  availableProductTypes = [
    'Engineering Policy', 'GMC', 'GPA', 'GTL', 'Health Insurance',
    'Home/Property Insurance', 'Life Insurance', 'Marine Insurance',
    'Miscellaneous Insurance', 'Motor Insurance', 'PA',
    'Professional Indemnity', 'Stock Broker Indemnity', 'Travel Insurance',
    'Workmen Compensation'
  ];
  selectedProductTypes: string[] = [];

  get allProductTypesSelected(): boolean {
    return this.selectedProductTypes.length === this.availableProductTypes.length;
  }

  toggleProductType(type: string, event: any) {
    if (event.target.checked) {
      if (!this.selectedProductTypes.includes(type)) {
        this.selectedProductTypes.push(type);
      }
    } else {
      this.selectedProductTypes = this.selectedProductTypes.filter(t => t !== type);
    }
  }

  toggleAllProductTypes(event: any) {
    if (event.target.checked) {
      this.selectedProductTypes = [...this.availableProductTypes];
    } else {
      this.selectedProductTypes = [];
    }
  }

  get allCustomersSelected(): boolean {
    return this.selectedCustomers.length > 0 && this.selectedCustomers.length === this.availableCustomers.length;
  }

  get filteredCustomers(): string[] {
    if (!this.customerSearchTerm) return this.availableCustomers;
    const term = this.customerSearchTerm.toLowerCase();
    return this.availableCustomers.filter(c => c.toLowerCase().includes(term));
  }

  toggleCustomer(cust: string, event: any) {
    if (event.target.checked) {
      if (!this.selectedCustomers.includes(cust)) {
        this.selectedCustomers.push(cust);
      }
    } else {
      this.selectedCustomers = this.selectedCustomers.filter(c => c !== cust);
    }
  }

  toggleAllCustomers(event: any) {
    if (event.target.checked) {
      this.selectedCustomers = [...this.availableCustomers];
    } else {
      this.selectedCustomers = [];
    }
  }

  toggleAllBranches(event: any) {
    if (event.target.checked) {
      this.selectedBranches = [...this.availableBranches];
    } else {
      this.selectedBranches = [];
    }
    this.onBranchChange();
  }

  toggleBranch(branch: string, event: any) {
    if (event.target.checked) {
      this.selectedBranches.push(branch);
    } else {
      this.selectedBranches = this.selectedBranches.filter(b => b !== branch);
    }
    this.onBranchChange();
  }

  onAssignmentModeChange() {
    this.loadRmNamesForBranch();
    this.loadCustomersForBranch();
  }

  onBranchChange() {
    this.loadRmNamesForBranch();
    this.loadCustomersForBranch();
  }

  loadRmNamesForBranch() {
    if (this.newUser.role === 'RM') {
      this.selectedRms = [];
      this.rmSearchTerm = '';
      
      if (this.selectedBranches.length === 0) {
        this.availableRmNames = [];
        this.newUser.assignedRm = '';
        return;
      }
      
      this.loadingRmNames = true;
      const joinedBranches = this.selectedBranches.join(',');
      this.apiService.getRmNames(joinedBranches).subscribe({
        next: (names) => {
          this.availableRmNames = names || [];
          this.selectedRms = [];
          this.loadingRmNames = false;
        },
        error: (err) => {
          console.error('Error fetching RM names:', err);
          this.availableRmNames = [];
          this.loadingRmNames = false;
        }
      });
    }
  }

  loadCustomersForBranch() {
    this.selectedCustomers = [];
    this.customerSearchTerm = '';

    if (this.selectedBranches.length === 0) {
      this.availableCustomers = [];
      this.newUser.assignedCustomers = '';
      return;
    }

    this.loadingCustomers = true;
    const joinedBranches = this.selectedBranches.join(',');
    this.apiService.getCustomersByBranch(joinedBranches).subscribe({
      next: (customers) => {
        this.availableCustomers = customers || [];
        this.selectedCustomers = [];
        this.loadingCustomers = false;
      },
      error: (err) => {
        console.error('Error fetching customers:', err);
        this.availableCustomers = [];
        this.loadingCustomers = false;
      }
    });
  }

  availablePremiumRanges = ['<50,000', '50,000-1,00,000', '>1,00,000'];
  selectedPremiumRanges: string[] = [];

  get allPremiumRangesSelected(): boolean {
    return this.selectedPremiumRanges.length === this.availablePremiumRanges.length;
  }

  togglePremiumRange(range: string, event: any) {
    if (event.target.checked) {
      if (!this.selectedPremiumRanges.includes(range)) {
        this.selectedPremiumRanges.push(range);
      }
    } else {
      this.selectedPremiumRanges = this.selectedPremiumRanges.filter(r => r !== range);
    }
  }

  toggleAllPremiumRanges(event: any) {
    if (event.target.checked) {
      this.selectedPremiumRanges = [...this.availablePremiumRanges];
    } else {
      this.selectedPremiumRanges = [];
    }
  }

  // User List
  availableRmNames: string[] = [];
  selectedRms: string[] = [];
  loadingRmNames = false;
  rmSearchTerm = '';

  get allRmsSelected(): boolean {
    return this.selectedRms.length > 0 && this.selectedRms.length === this.availableRmNames.length;
  }

  get filteredRms(): string[] {
    if (!this.rmSearchTerm) return this.availableRmNames;
    const term = this.rmSearchTerm.toLowerCase();
    return this.availableRmNames.filter(r => r.toLowerCase().includes(term));
  }

  toggleRm(rm: string, event: any) {
    if (event.target.checked) {
      if (!this.selectedRms.includes(rm)) {
        this.selectedRms.push(rm);
      }
    } else {
      this.selectedRms = this.selectedRms.filter(r => r !== rm);
    }
  }

  toggleAllRms(event: any) {
    if (event.target.checked) {
      this.selectedRms = [...this.availableRmNames];
    } else {
      this.selectedRms = [];
    }
  }

  // User List State
  showUserList = false;
  users: any[] = [];
  loadingUsers = false;
  selectedRoleFilter: string = '';

  // Tabs
  activeTab: 'add-user' | 'bulk-assign' = 'add-user';

  // Excel Bulk Assign State
  uploadSelectedRenewer: string = '';
  uploadSelectedBranch: string = '';
  selectedExcelFile: File | null = null;
  uploadingExcel = false;
  uploadMessage = '';
  uploadSuccess = false;

  constructor(
    private authService: AuthService,
    private apiService: ApiService,
    private notificationService: NotificationService
  ) {}

  ngOnInit(): void {
    this.extractBranches();
    this.loadUsers();
  }

  getRenewerUsers() {
    return this.users.filter(u => u.role && u.role.includes('RENEWER'));
  }

  onExcelFileSelected(event: any) {
    const file = event.target.files[0];
    if (file) {
      this.selectedExcelFile = file;
    }
  }

  downloadFormatExcel() {
    this.apiService.downloadFormat().subscribe({
      next: (blob) => {
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = 'Format.xlsx';
        a.click();
        window.URL.revokeObjectURL(url);
      },
      error: () => {
        this.notificationService.showErrorModal('Failed to download Format.xlsx');
      }
    });
  }

  uploadExcelAndAssign() {
    if (!this.selectedExcelFile || !this.uploadSelectedRenewer || !this.uploadSelectedBranch) return;
    
    this.uploadingExcel = true;
    this.uploadMessage = '';
    
    this.apiService.uploadAssignPolicies(this.selectedExcelFile, this.uploadSelectedRenewer, this.uploadSelectedBranch).subscribe({
      next: (res) => {
        this.uploadingExcel = false;
        this.uploadSuccess = true;
        this.uploadMessage = 'Policies successfully uploaded and assigned!';
        this.selectedExcelFile = null;
        this.uploadSelectedRenewer = '';
        this.uploadSelectedBranch = '';
      },
      error: (err) => {
        this.uploadingExcel = false;
        this.uploadSuccess = false;
        this.uploadMessage = err.error?.error || 'Failed to upload and assign policies.';
      }
    });
  }

  extractBranches() {
    this.apiService.getBranches().subscribe(branches => {
      this.availableBranches = branches;
    });
  }

  openUserList() {
    this.showUserList = true;
    this.loadUsers();
  }

  loadUsers() {
    this.loadingUsers = true;
    this.authService.getUsers().subscribe({
      next: (data) => {
        this.users = data;
        this.loadingUsers = false;
      },
      error: (err) => {
        console.error('Error fetching users:', err);
        this.loadingUsers = false;
      }
    });
  }

  closeUserList() {
    this.showUserList = false;
  }

  createUser() {
    this.loading = true;
    this.message = '';

    if (this.newUser.password !== this.confirmPassword) {
      this.message = 'Passwords do not match!';
      this.success = false;
      this.loading = false;
      return;
    }

    if (this.newUser.password.length < 4) {
      this.message = 'Password must be at least 4 characters long.';
      this.success = false;
      this.loading = false;
      return;
    }

    this.newUser.assignedBranch = this.selectedBranches.join(',');

    if (this.newUser.role === 'RENEWER') {
      this.newUser.assignedPremiumRange = this.selectedPremiumRanges.join(',');
      if (this.assignmentMode === 'product') {
        this.newUser.assignedProductType = this.selectedProductTypes.join(',');
        this.newUser.assignedCustomers = '';
      } else {
        this.newUser.assignedCustomers = this.selectedCustomers.join(',');
        this.newUser.assignedProductType = '';
      }
    } else if (this.newUser.role === 'RM') {
      this.newUser.assignedRm = this.selectedRms.join(',');
      this.newUser.assignedProductType = '';
      this.newUser.assignedPremiumRange = '';
      this.newUser.assignedCustomers = '';
    } else {
      this.newUser.assignedProductType = '';
      this.newUser.assignedPremiumRange = '';
      this.newUser.assignedCustomers = '';
    }

    this.authService.createUser(this.newUser).subscribe({
      next: () => {
        this.message = 'User created successfully!';
        this.success = true;
        this.newUser = { 
          username: '', password: '', role: 'RENEWER',
          assignedBranch: '', assignedProductType: '', assignedPremiumRange: '', assignedCustomers: '', assignedRm: ''
        };
        this.confirmPassword = '';
        this.selectedBranches = [];
        this.selectedProductTypes = [];
        this.selectedPremiumRanges = [];
        this.selectedCustomers = [];
        this.selectedRms = [];
        this.rmSearchTerm = '';
        this.assignmentMode = 'product';
        this.loading = false;
        this.loadUsers();
      },
      error: (err) => {
        console.error(err);
        this.message = 'Failed to create user. Username might be taken.';
        this.success = false;
        this.loading = false;
      }
    });
  }

  getRoleBadgeClass(role: string): string {
    if (!role) return 'bg-secondary';
    if (role.includes('ADMIN')) return 'bg-primary';
    if (role.includes('MIS')) return 'bg-info text-dark';
    if (role.includes('SERVICING')) return 'bg-warning text-dark';
    if (role.includes('RENEWER')) return 'bg-info';
    if (role.includes('CLAIMS')) return 'bg-danger';
    if (role.includes('SALES')) return 'bg-success';
    if (role.includes('UNDERWRITING')) return 'bg-dark';
    return 'bg-secondary';
  }

  getRoleDisplay(role: string): string {
    if (!role) return '-';
    return role.replace('ROLE_', '');
  }

  async toggleUserStatus(user: any) {
    const action = user.active ? 'deactivate' : 'activate';
    if (await this.notificationService.confirmAction(`Are you sure you want to ${action} user ${user.username}?`)) {
      this.authService.deleteUser(user.id).subscribe({
        next: () => {
          this.openUserList(); // Refresh list
        },
        error: (err) => {
          console.error('Error toggling user status:', err);
          this.notificationService.showErrorModal('Failed to update user status.');
        }
      });
    }
  }

  userToDelete: any = null;

  hardDeleteUser(user: any) {
    this.userToDelete = user;
  }

  cancelDeleteUser() {
    this.userToDelete = null;
  }

  confirmDeleteUser() {
    if (!this.userToDelete) return;
    
    this.authService.hardDeleteUser(this.userToDelete.id).subscribe({
      next: () => {
        this.openUserList(); // Refresh list
        this.userToDelete = null;
      },
      error: (err) => {
        console.error('Error deleting user:', err);
        this.notificationService.showErrorModal('Failed to delete user.');
        this.userToDelete = null;
      }
    });
  }
}

