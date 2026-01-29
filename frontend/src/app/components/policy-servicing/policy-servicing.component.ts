import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-policy-servicing',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="container mt-4">
      <div class="header-section d-flex justify-content-between align-items-center mb-4">
        <div>
          <h2>Policy Servicing Dashboard</h2>
          <p class="text-muted">Verify payment details and issue policies</p>
        </div>
        <button class="btn btn-outline-primary" (click)="loadPendingPolicies()">
          <i class="bi bi-arrow-clockwise"></i> Refresh
        </button>
      </div>

      <!-- Top Action Buttons -->
      <div class="mb-4">
          <div class="btn-group">
            <button class="btn" [class.btn-primary]="viewMode === 'pending'" [class.btn-outline-primary]="viewMode !== 'pending'" (click)="toggleView('pending')">
                Pending Issuance
            </button>
            <button class="btn" [class.btn-primary]="viewMode === 'history'" [class.btn-outline-primary]="viewMode !== 'history'" (click)="toggleView('history')">
                Serviced History
            </button>
          </div>
      </div>

      <!-- Tabs (Only for Pending View) -->
      <ul class="nav nav-tabs mb-4" *ngIf="viewMode === 'pending'">
        <li class="nav-item" *ngFor="let tab of tabs">
          <a class="nav-link" [class.active]="activeTab === tab" (click)="setActiveTab(tab)" href="javascript:void(0)">
            {{ tab }}
            <span class="badge bg-secondary ms-1" *ngIf="getPoliciesForTab(tab).length > 0">
              {{ getPoliciesForTab(tab).length }}
            </span>
          </a>
        </li>
      </ul>

      <div *ngIf="loading" class="text-center py-5">
        <div class="spinner-border text-primary" role="status">
          <span class="visually-hidden">Loading...</span>
        </div>
      </div>

      <!-- Pending View -->
      <ng-container *ngIf="viewMode === 'pending' && !loading">
        <div *ngIf="getPoliciesForTab(activeTab).length === 0" class="text-center py-5 bg-white rounded shadow-sm">
            <i class="bi bi-folder2-open text-muted" style="font-size: 3rem;"></i>
            <h4 class="mt-3">No Policies Found</h4>
            <p class="text-muted">No pending policies for {{ activeTab }}.</p>
        </div>

        <div *ngIf="getPoliciesForTab(activeTab).length > 0" class="table-responsive bg-white rounded shadow-sm p-3">
            <table class="table table-hover align-middle">
            <thead>
                <tr>
                <th>Policy #</th>
                <th>Customer</th>
                <th>Insurer / Product</th>
                <th>Expiry</th>
                <th>Payment Info</th>
                <th>Amount</th>
                <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr *ngFor="let policy of getPoliciesForTab(activeTab)">
                <td class="fw-bold">{{ policy.policyNumber }}</td>
                <td>
                    <div class="fw-bold">{{ policy.customer.firstName }} {{ policy.customer.lastName }}</div>
                    <div class="small text-muted">{{ policy.customer.email }}</div>
                </td>
                <td>
                    <div class="fw-bold">{{ policy.insuranceName }}</div>
                    <small class="text-muted">{{ policy.productName }}</small>
                </td>
                <td>{{ policy.expiryDate | date:'mediumDate' }}</td>
                <td>
                    <div class="small">
                    <span class="badge bg-light text-dark border">{{ policy.paymentMode }}</span>
                    <div class="mt-1">
                        <span *ngIf="policy.paymentMode === 'Cheque'">Bank: {{ policy.paymentBank }}<br></span>
                        Ref: <span class="fw-bold">{{ policy.paymentReference }}</span>
                    </div>
                    <div class="text-muted">{{ policy.paymentDate | date:'shortDate' }}</div>
                    </div>
                </td>
                <td class="fw-bold text-success">{{ policy.paymentAmount | currency:'INR' }}</td>
                <td>
                    <div class="btn-group">
                    <button class="btn btn-outline-info btn-sm" (click)="viewDetails(policy)" title="View Details">
                        <i class="bi bi-eye"></i>
                    </button>
                    <button class="btn btn-primary btn-sm" (click)="openIssueModal(policy)" title="Issue Policy">
                        <i class="bi bi-file-earmark-check"></i> Issue
                    </button>
                    <button class="btn btn-outline-secondary btn-sm" (click)="viewCallHistory(policy)" title="History">
                        <i class="bi bi-clock-history"></i>
                    </button>
                    </div>
                </td>
                </tr>
            </tbody>
            </table>
        </div>
      </ng-container>

      <!-- History View -->
      <ng-container *ngIf="viewMode === 'history' && !loading">
        <!-- Search Bar -->
        <div class="mb-3" *ngIf="servicedPolicies.length > 0">
            <div class="input-group">
                <span class="input-group-text"><i class="bi bi-search"></i></span>
                <input type="text" class="form-control" placeholder="Search by Policy #, Customer, Insurer..." [(ngModel)]="historySearchQuery">
                <button class="btn btn-outline-secondary" *ngIf="historySearchQuery" (click)="historySearchQuery = ''">
                    <i class="bi bi-x-lg"></i>
                </button>
            </div>
        </div>

         <div *ngIf="servicedPolicies.length === 0" class="text-center py-5 bg-white rounded shadow-sm">
            <i class="bi bi-check-circle text-muted" style="font-size: 3rem;"></i>
            <h4 class="mt-3">No Serviced Policies</h4>
            <p class="text-muted">Completed policies will appear here.</p>
        </div>
        
        <div *ngIf="servicedPolicies.length > 0 && filteredServicedPolicies.length === 0" class="text-center py-5">
            <h5 class="text-muted">No matching records found.</h5>
        </div>

        <div *ngIf="filteredServicedPolicies.length > 0" class="table-responsive bg-white rounded shadow-sm p-3">
            <table class="table table-hover align-middle">
            <thead>
                <tr>
                <th>Policy #</th>
                <th>Customer</th>
                <th>Insurer / Product</th>
                <th>Issued Date</th>
                <th>Premium</th>
                <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr *ngFor="let policy of filteredServicedPolicies">
                <td class="fw-bold">{{ policy.policyNumber }}</td>
                <td>
                    <div class="fw-bold">{{ policy.customer.firstName }} {{ policy.customer.lastName }}</div>
                    <div class="small text-muted" *ngIf="policy.customer.phone && policy.customer.phone != 0 && policy.customer.phone !== 'null'">{{ policy.customer.phone }}</div>
                </td>
                <td>
                     <div class="fw-bold">{{ policy.insuranceName }}</div>
                     <span class="badge bg-secondary">{{ policy.type }}</span>
                </td>
                <td>
                    <div *ngIf="policy.policyIssueDate">{{ policy.policyIssueDate | date:'mediumDate' }}</div>
                    <div *ngIf="!policy.policyIssueDate" class="text-muted">-</div>
                </td>
                <td class="fw-bold text-success">{{ policy.netPremium | currency:'INR' }}</td>
                <td>
                     <button class="btn btn-outline-info btn-sm" (click)="viewDetails(policy)" title="View Details">
                        <i class="bi bi-eye"></i> View
                    </button>
                </td>
                </tr>
            </tbody>
            </table>
        </div>
      </ng-container>

    </div>

    <!-- Details Modal -->
    <div class="modal-overlay" *ngIf="showDetailsModal" (click)="closeDetailsModal()">
        <div class="custom-modal-content details-modal" (click)="$event.stopPropagation()">
            <div class="modal-header premium-modal-header">
                <div class="d-flex justify-content-between align-items-center w-100">
                    <!-- Left: Policy Identity -->
                    <div class="d-flex align-items-center gap-3">
                        <div class="bg-white bg-opacity-25 rounded-3 p-2 d-flex align-items-center justify-content-center"
                            style="width: 48px; height: 48px;">
                            <i class="bi bi-shield-check fs-4 text-white"></i>
                        </div>
                        <div class="d-flex flex-column">
                            <span class="text-white-50 text-uppercase fw-bold"
                                style="font-size: 0.7rem; letter-spacing: 1px; line-height: 1;">Policy No</span>
                            <span class="fs-4 fw-bold text-white tracking-wide" style="line-height: 1.2;">{{
                                selectedPolicy?.policyNumber }}</span>
                        </div>
                    </div>

                    <!-- Right: Context & Close -->
                    <div class="d-flex align-items-center gap-3">
                        <div class="text-end d-none d-md-block">
                            <div class="fw-bold text-white tracking-wide" style="font-size: 1rem;">{{
                                selectedPolicy?.insuranceName || 'Insurance' }}</div>
                            <div class="text-white opacity-75 small" style="font-size: 0.85rem;">{{
                                selectedPolicy?.productName || 'Product' }}</div>
                        </div>
                        <button class="btn-close btn-close-white ms-2" (click)="closeDetailsModal()"></button>
                    </div>
                </div>
            </div>
            
            <div class="modal-body" *ngIf="selectedPolicy">
                <div class="row g-4">
                    <!-- Customer Info Card -->
                    <div class="col-md-6">
                        <div class="info-card h-100">
                            <div class="card-header-clean">
                                <i class="bi bi-person me-2"></i> Customer Info
                            </div>
                            <div class="card-body-clean">
                                <div class="info-row">
                                    <span class="label">Name:</span>
                                    <span class="value fw-bold">{{ selectedPolicy.customer.firstName }} {{ selectedPolicy.customer.lastName }}</span>
                                </div>
                                <div class="info-row">
                                    <span class="label">Email:</span>
                                    <span class="value">{{ selectedPolicy.customer.email }}</span>
                                </div>
                                <div class="info-row">
                                    <span class="label">Phone:</span>
                                    <span class="value">{{ selectedPolicy.customer.phone }}</span>
                                </div>
                                <div class="info-row">
                                    <span class="label">Billing:</span>
                                    <span class="badge bg-secondary">Yearly</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Policy Info Card -->
                    <div class="col-md-6">
                        <div class="info-card h-100">
                            <div class="card-header-clean">
                                <i class="bi bi-file-text me-2"></i> Policy Info
                            </div>
                            <div class="card-body-clean">
                                <div class="info-row">
                                    <span class="label">Insurance:</span>
                                    <span class="value fw-bold">{{ selectedPolicy.insuranceName }}</span>
                                </div>
                                <div class="info-row">
                                    <span class="label">Product:</span>
                                    <span class="value">{{ selectedPolicy.productName }}</span>
                                </div>
                                <div class="info-row">
                                    <span class="label">Start Date:</span>
                                    <span class="value">{{ selectedPolicy.policyStartDate | date:'mediumDate' }}</span>
                                </div>
                                <div class="info-row">
                                    <span class="label">End Date:</span>
                                    <span class="value">{{ selectedPolicy.policyEndDate | date:'mediumDate' }}</span>
                                </div>
                                <div class="info-row">
                                    <span class="label">Premium:</span>
                                    <span class="value text-success fw-bold">{{ selectedPolicy.amount | currency:'INR' }}</span>
                                </div>
                                <div class="mt-3 d-grid" *ngIf="selectedPolicy.policyDocumentPath">
                                    <button class="btn btn-outline-primary btn-sm" (click)="viewPolicyDocument()">
                                        <i class="bi bi-file-earmark-pdf me-1"></i> View Policy Document
                                    </button>
                                </div>
                                <hr class="my-3 text-muted">
                                <div class="info-row">
                                    <span class="label">RM Name:</span>
                                    <span class="value text-end">{{ selectedPolicy.rmName || '-' }}</span>
                                </div>
                                <div class="info-row">
                                    <span class="label">POSP:</span>
                                    <span class="value text-end">{{ selectedPolicy.associateName || '-' }}</span>
                                </div>
                                <div class="info-row">
                                    <span class="label">Code:</span>
                                    <span class="value text-end">{{ selectedPolicy.associateCode || '-' }}</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Asset Details Card -->
                    <div class="col-12" *ngIf="selectedPolicy.type === 'Motor Insurance'">
                        <div class="info-card">
                            <div class="card-header-clean">
                                <i class="bi bi-car-front me-2"></i> Asset Details
                            </div>
                            <div class="card-body-clean">
                                 <div class="info-row">
                                    <span class="label">Reg No:</span>
                                    <span class="value fw-bold">{{ selectedPolicy.vehicleRegNo || '-' }}</span>
                                </div>
                                <div class="info-row">
                                    <span class="label">Model:</span>
                                    <span class="value">{{ selectedPolicy.vehicleModel || '-' }}</span>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Payment Details Card -->
                    <div class="col-12">
                        <div class="info-card">
                            <div class="card-header-clean">
                                <i class="bi bi-wallet2 me-2"></i> Payment Details
                            </div>
                            <div class="card-body-clean">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <div class="info-row">
                                            <span class="label">Mode:</span>
                                            <span class="value">{{ selectedPolicy.paymentMode || '-' }}</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="info-row">
                                            <span class="label">Amount:</span>
                                            <span class="value text-success fw-bold">{{ selectedPolicy.paymentAmount | currency:'INR' }}</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="info-row">
                                            <span class="label">Date:</span>
                                            <span class="value">{{ selectedPolicy.paymentDate | date:'mediumDate' }}</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6" *ngIf="selectedPolicy.paymentReference">
                                        <div class="info-row">
                                            <span class="label">Ref/Cheque No:</span>
                                            <span class="value">{{ selectedPolicy.paymentReference }}</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6" *ngIf="selectedPolicy.paymentBank">
                                        <div class="info-row">
                                            <span class="label">Bank:</span>
                                            <span class="value">{{ selectedPolicy.paymentBank }}</span>
                                        </div>
                                    </div>
                                    <div class="col-12 pt-2 border-top" *ngIf="selectedPolicy.paymentDocumentPath">
                                        <button class="btn btn-sm btn-outline-primary" (click)="viewPaymentDocument()">
                                            <i class="bi bi-file-earmark-text me-1"></i> View Payment Proof
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                 <button class="btn btn-secondary px-4" (click)="closeDetailsModal()">Close</button>
            </div>
        </div>
    </div>

    <!-- Issue Policy Modal -->
    <div class="modal-overlay" *ngIf="showIssueModal" (click)="closeIssueModal()">
      <div class="custom-modal-content issue-modal" (click)="$event.stopPropagation()">
        <div class="modal-header p-3">
           <h3 class="mb-0">Issue Policy</h3>
           <button class="btn-close" (click)="closeIssueModal()"></button>
        </div>
        <div class="modal-body">
            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">Customer Name</label>
                    <input type="text" class="form-control" [value]="selectedPolicy?.customer?.firstName + ' ' + selectedPolicy?.customer?.lastName" disabled>
                </div>
                <!-- Editable Application No / Policy No -->
                 <div class="col-md-6">
                    <label class="form-label">Policy No / Application No *</label>
                    <input type="text" class="form-control" [(ngModel)]="issueForm.policyNumber">
                </div>
                
                 <div class="col-md-6">
                    <label class="form-label">Insurer Name *</label>
                    <input type="text" class="form-control" [(ngModel)]="issueForm.insuranceName">
                </div>
                 <div class="col-md-6">
                    <label class="form-label">Previous Policy No</label>
                    <input type="text" class="form-control" [(ngModel)]="issueForm.previousPolicyNumber">
                </div>

                <div class="col-md-4">
                    <label class="form-label">Policy Issue Date *</label>
                    <input type="date" class="form-control" [(ngModel)]="issueForm.policyIssueDate">
                </div>
                <div class="col-md-4">
                    <label class="form-label">Start Date *</label>
                    <input type="date" class="form-control" [(ngModel)]="issueForm.policyStartDate">
                </div>
                <div class="col-md-4">
                    <label class="form-label">Expiry Date *</label>
                    <input type="date" class="form-control" [(ngModel)]="issueForm.expiryDate">
                </div>

                <div class="col-md-6">
                     <label class="form-label">Premium *</label>
                     <input type="number" class="form-control" [(ngModel)]="issueForm.netPremium">
                </div>
                 <div class="col-md-6">
                     <label class="form-label">Sum Assured / Insured *</label>
                     <input type="number" class="form-control" [(ngModel)]="issueForm.sumInsured">
                </div>
                
                <div class="col-md-6">
                     <label class="form-label">Cheque/Payment Amount</label>
                      <input type="text" class="form-control" [value]="selectedPolicy?.paymentAmount" disabled>
                </div>

                 <div class="col-12">
                     <label class="form-label">Upload Policy Document *</label>
                     <input type="file" class="form-control" (change)="onFileSelected($event)">
                     <div class="form-text">Upload the issued policy PDF/Image.</div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" (click)="closeIssueModal()">Cancel</button>
            <button class="btn btn-success" (click)="submitIssue()" [disabled]="isSubmitting">
                <span *ngIf="isSubmitting" class="spinner-border spinner-border-sm me-1"></span>
                Issue Policy
            </button>
        </div>
      </div>
    </div>
    
      <!-- Call History Modal -->
    <div class="modal-overlay" *ngIf="showHistoryModal" (click)="closeHistoryModal()">
        <div class="custom-modal-content history-modal" (click)="$event.stopPropagation()">
            <div class="modal-header p-3">
                <h3 class="mb-0">Call History</h3>
                <button class="btn-close" (click)="closeHistoryModal()"></button>
            </div>
            <div class="modal-body">
                <div *ngIf="history.length === 0" class="text-center text-muted">No history found.</div>
                <div *ngIf="history.length > 0" class="timeline">
                    <div class="timeline-item" *ngFor="let record of history">
                        <div class="timeline-marker"></div>
                        <div class="timeline-content">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <span class="badge" [ngClass]="getOutcomeClass(record.callOutcome)">{{
                                    record.callOutcome
                                    }}</span>
                                <small class="text-muted">{{ record.callDate | date:'medium' }}</small>
                            </div>
                            <p class="mb-2">{{ record.notes }}</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <small class="text-muted">
                                    <i class="bi bi-person-circle me-1"></i>{{ record.agentName }}
                                </small>
                                <small *ngIf="record.followUpDate" class="text-info">
                                    <i class="bi bi-calendar-event me-1"></i>Follow-up: {{ record.followUpDate |
                                    date:'short' }}
                                </small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <div class="modal-footer">
                <button class="btn btn-secondary" (click)="closeHistoryModal()">Close</button>
            </div>
        </div>
    </div>
  `,
  styles: [`
    .header-section { 
      margin-bottom: 25px; 
      padding-bottom: 15px; 
      border-bottom: 1px solid #e2e8f0;
    }
    .header-section h2 { 
      margin-bottom: 8px; 
      color: #1e293b; 
      font-weight: 800;
      font-size: 2.2rem;
      letter-spacing: -0.03em;
    }
    .modal-overlay {
        position: fixed; top: 0; left: 0; width: 100%; height: 100%;
        background: rgba(0,0,0,0.5); z-index: 1050; display: flex;
        justify-content: center; align-items: center;
    }
    .custom-modal-content {
        background: white; padding: 0; border-radius: 16px; /* Removed padding, increased radius */
        width: 90%; max-width: 800px; box-shadow: 0 25px 50px -12px rgba(0,0,0,0.25);
        max-height: 90vh; overflow-y: auto; display: flex; flex-direction: column;
    }
    .modal-body { padding: 1.5rem; overflow-y: auto; }
    .modal-footer { padding: 1rem 1.5rem; border-top: 1px solid #e9ecef; display: flex; justify-content: flex-end; gap: 10px; }
    .modal-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
    /* Premium Header Gradient */
    .premium-modal-header {
      background: linear-gradient(135deg, #0d6efd 0%, #0a58ca 100%);
      color: white;
      padding: 1rem 1.5rem;
      border-bottom: 1px solid rgba(255,255,255,0.1);
      box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
      position: relative;
      z-index: 1;
      display: block; /* Ensure it behaves like a block for flex children */
    }
    .modal-header-custom {
        display: none; /* Deprecated/Replaced */
    }
    .header-icon-wrapper {
        background: #ebf5ff; border-radius: 50%; width: 50px; height: 50px;
        display: flex; align-items: center; justify-content: center;
    }
    .info-card {
        border: 1px solid #eee; border-radius: 8px; overflow: hidden;
    }
    .card-header-clean {
        background: #f8f9fa; padding: 12px 15px; font-weight: 600; color: #495057;
        border-bottom: 1px solid #eee;
    }
    .card-body-clean {
        padding: 15px;
    }
    .info-row {
        display: flex; justify-content: space-between; margin-bottom: 12px;
        font-size: 0.95rem;
    }
    .info-row:last-child { margin-bottom: 0; }
    .label { color: #6c757d; }
    .value { color: #212529; text-align: right; }
    .details-modal { max-width: 900px; }
    
    /* Timeline Styles */
    .timeline { position: relative; padding-left: 30px; }
    .timeline-item { position: relative; padding-bottom: 30px; }
    .timeline-item:last-child { padding-bottom: 0; }
    .timeline-marker {
        position: absolute; left: -30px; top: 5px; width: 12px; height: 12px;
        border-radius: 50%; background: #0d6efd; border: 3px solid white;
        box-shadow: 0 0 0 2px #0d6efd;
    }
    .timeline-item:before {
        content: ''; position: absolute; left: -24px; top: 17px; bottom: -30px;
        width: 2px; background: #dee2e6;
    }
    .timeline-item:last-child:before { display: none; }
    .timeline-content {
        background: #f8f9fa; padding: 15px; border-radius: 8px;
        border-left: 3px solid #0d6efd;
    }
    /* Badge colors */
    .bg-success { background-color: #198754; color: white; padding: 4px 8px; border-radius: 4px; font-size: 0.8rem; }
    .bg-danger { background-color: #dc3545; color: white; padding: 4px 8px; border-radius: 4px; font-size: 0.8rem; }
    .bg-warning { background-color: #ffc107; color: #000; padding: 4px 8px; border-radius: 4px; font-size: 0.8rem; }
    .bg-info { background-color: #0dcaf0; color: #000; padding: 4px 8px; border-radius: 4px; font-size: 0.8rem; }
    .bg-secondary { background-color: #6c757d; color: white; padding: 4px 8px; border-radius: 4px; font-size: 0.8rem; }
  `]
})
export class PolicyServicingComponent implements OnInit {
  pendingPolicies: any[] = [];
  loading: boolean = false;

  // Tabs
  tabs = ['Health Insurance', 'Life Insurance', 'Motor Insurance', 'GMC Insurance', 'GPA Insurance', 'GTL Insurance', 'Marine Insurance', 'Commercial Insurance'];
  activeTab = 'Health Insurance';

  // Issue Modal
  showIssueModal = false;
  selectedPolicy: any = null;
  issueForm: any = {};
  selectedFile: File | null = null;
  isSubmitting = false;

  // History Modal
  showHistoryModal = false;
  history: any[] = [];

  constructor(private apiService: ApiService) { }

  ngOnInit() {
    this.loadPendingPolicies();
  }

  loadPendingPolicies() {
    this.loading = true;
    this.apiService.getPendingIssuancePolicies().subscribe({
      next: (data) => {
        this.pendingPolicies = data;
        this.loading = false;
        // Auto-select tab logic if needed, or stick to default
      },
      error: (err) => {
        console.error('Error fetching pending policies', err);
        this.loading = false;
      }
    });
  }

  setActiveTab(tab: string) {
    this.activeTab = tab;
  }

  getPoliciesForTab(tab: string) {
    if (tab === 'Commercial Insurance') {
      // Catch all other types
      const otherTypes = this.tabs.filter(t => t !== 'Commercial Insurance');
      return this.pendingPolicies.filter(p => !otherTypes.includes(p.type));
    }
    return this.pendingPolicies.filter(p => p.type === tab);
  }

  // History View
  viewMode: 'pending' | 'history' = 'pending';
  servicedPolicies: any[] = [];
  historySearchQuery: string = '';

  get filteredServicedPolicies() {
    if (!this.historySearchQuery) return this.servicedPolicies;
    const query = this.historySearchQuery.toLowerCase().trim();
    return this.servicedPolicies.filter(policy =>
      (policy.policyNumber && policy.policyNumber.toLowerCase().includes(query)) ||
      (policy.customer && policy.customer.firstName && policy.customer.firstName.toLowerCase().includes(query)) ||
      (policy.customer && policy.customer.lastName && policy.customer.lastName.toLowerCase().includes(query)) ||
      (policy.insuranceName && policy.insuranceName.toLowerCase().includes(query)) ||
      (policy.productName && policy.productName.toLowerCase().includes(query))
    );
  }

  toggleView(mode: 'pending' | 'history') {
    this.viewMode = mode;
    if (mode === 'history') {
      this.loadHistory();
    } else {
      this.loadPendingPolicies();
    }
  }

  loadHistory() {
    this.loading = true;
    this.apiService.getServicedHistory().subscribe({
      next: (data) => {
        this.servicedPolicies = data;
        this.loading = false;
      },
      error: (err) => {
        console.error('Error fetching history', err);
        this.loading = false;
      }
    });
  }

  // Details Modal
  showDetailsModal = false;

  viewDetails(policy: any) {
    this.selectedPolicy = policy;
    this.showDetailsModal = true;
  }

  closeDetailsModal() {
    this.showDetailsModal = false;
  }

  viewPaymentDocument() {
    if (this.selectedPolicy && this.selectedPolicy.id) {
      this.apiService.downloadPaymentProof(this.selectedPolicy.id).subscribe({
        next: (blob: Blob) => {
          const url = window.URL.createObjectURL(blob);
          window.open(url, '_blank');
        },
        error: (err) => alert('Could not load document or no document exists.')
      });
    }
  }

  viewPolicyDocument() {
    if (this.selectedPolicy && this.selectedPolicy.id) {
      this.apiService.downloadPolicyDocument(this.selectedPolicy.id).subscribe({
        next: (blob: Blob) => {
          const url = window.URL.createObjectURL(blob);
          window.open(url, '_blank');
        },
        error: (err) => alert('Could not load policy document or no document exists.')
      });
    }
  }

  viewCallHistory(policy: any) {
    this.apiService.getCallHistory(policy.id).subscribe(data => {
      this.history = data;
      this.showHistoryModal = true;
    });
  }
  closeHistoryModal() { this.showHistoryModal = false; }

  openIssueModal(policy: any) {
    this.selectedPolicy = policy;

    // Auto-calculate new term (Next Year)
    const oldEndDate = new Date(policy.policyEndDate);
    const newStartDate = new Date(oldEndDate);
    newStartDate.setDate(oldEndDate.getDate() + 1); // Start = End + 1 Day

    const newExpiryDate = new Date(newStartDate);
    newExpiryDate.setFullYear(newStartDate.getFullYear() + 1);
    newExpiryDate.setDate(newExpiryDate.getDate() - 1); // End = Start + 1 Year - 1 Day

    // Pre-fill form with NEW dates
    this.issueForm = {
      policyNumber: '', // Blank for user to enter new policy number
      insuranceName: policy.insuranceName,
      previousPolicyNumber: policy.policyNumber || '', // Current policy becomes previous
      policyIssueDate: new Date().toISOString().split('T')[0], // Today
      policyStartDate: newStartDate.toISOString().split('T')[0],
      expiryDate: newExpiryDate.toISOString().split('T')[0],
      netPremium: policy.amount,
      sumInsured: ''
    };
    this.selectedFile = null;
    this.showIssueModal = true;
  }

  closeIssueModal() { this.showIssueModal = false; }

  onFileSelected(event: any) {
    this.selectedFile = event.target.files[0];
  }

  submitIssue() {
    if (!this.issueForm.policyNumber || !this.issueForm.netPremium || !this.issueForm.sumInsured || !this.issueForm.policyIssueDate) {
      alert('Please fill all required fields (*)');
      return;
    }

    if (!this.selectedFile) {
      alert('Please upload the policy document (*)');
      return;
    }

    this.isSubmitting = true;
    const formData = new FormData();

    const policyDetails = {
      policyNumber: this.issueForm.policyNumber,
      insuranceName: this.issueForm.insuranceName,
      previousPolicyNumber: this.issueForm.previousPolicyNumber,
      policyIssueDate: this.issueForm.policyIssueDate,
      policyStartDate: this.issueForm.policyStartDate,
      expiryDate: this.issueForm.expiryDate,
      netPremium: this.issueForm.netPremium,
      sumInsured: this.issueForm.sumInsured
    };

    formData.append('policy', JSON.stringify(policyDetails));
    if (this.selectedFile) {
      formData.append('file', this.selectedFile);
    }

    this.apiService.issuePolicy(this.selectedPolicy.id, formData).subscribe({
      next: () => {
        alert('Policy Issued Successfully!');
        this.isSubmitting = false;
        this.closeIssueModal();
        this.loadPendingPolicies();
      },
      error: (err) => {
        alert('Failed to issue policy: ' + (err.error?.message || err.message));
        this.isSubmitting = false;
      }
    });
  }
  getOutcomeClass(outcome: string): string {
    switch (outcome) {
      case 'Interested':
      case 'Renewed':
        return 'bg-success';
      case 'Not Interested':
      case 'Late Renewed':
        return 'bg-danger';
      case 'Call Back Later':
        return 'bg-warning text-dark';
      case 'Voicemail':
        return 'bg-info text-dark';
      default:
        return 'bg-secondary';
    }
  }
}
