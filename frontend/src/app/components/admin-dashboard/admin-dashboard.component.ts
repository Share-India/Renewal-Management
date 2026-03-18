import { Component, OnInit, ViewChild } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ApiService } from '../../services/api.service';
import { finalize } from 'rxjs/operators';
import { CustomerListComponent } from '../customer-list/customer-list.component';
import { WorkProgressComponent } from '../work-progress/work-progress.component';
import { TimelineComponent } from '../timeline/timeline.component';

@Component({
  selector: 'app-admin-dashboard',
  standalone: true,
  imports: [CommonModule, FormsModule, CustomerListComponent, WorkProgressComponent, TimelineComponent],
  template: `
    <div class="admin-container">
      <div class="header-section d-flex justify-content-between align-items-center">
        <div>
          <h2>Administrative Dashboard</h2>
          <p class="text-muted">Real-time insights into system performance and daily administrative tasks</p>
        </div>
        
        <div class="d-flex gap-3 align-items-center">
          <div class="branch-selector shadow-sm">
            <div class="input-group">
              <span class="input-group-text bg-transparent border-0 pe-1">
                <div class="icon-circle bg-primary bg-opacity-10 text-primary">
                  <i class="bi bi-geo-alt-fill"></i>
                </div>
              </span>
              <select class="form-select border-0 bg-transparent fw-bold shadow-none" [(ngModel)]="selectedAdminBranch" (change)="onBranchChange()">
                <option value="">All Branches Globally</option>
                <option *ngFor="let b of availableBranches" [value]="b">{{b}}</option>
              </select>
            </div>
          </div>
          <button class="btn btn-outline-secondary btn-branch shadow-sm px-3" (click)="openBranchModal()">
            <i class="bi bi-diagram-3-fill me-2 text-primary"></i> Manage
          </button>
          <button class="btn btn-primary shadow-sm px-4" (click)="openRenewalModal()">
            <i class="bi bi-plus-circle me-2"></i> Add / Edit Policy
          </button>
        </div>
      </div>
      
      <!-- Stats Cards -->
      <div class="stats-grid">
        <div class="stat-card primary">
          <div class="stat-icon">📋</div>
          <div class="stat-info">
            <h3>Total Policies</h3>
            <p class="stat-value">{{ stats?.totalPolicies || 0 }}</p>
          </div>
        </div>
        <div class="stat-card warning">
          <div class="stat-icon">🔔</div>
          <div class="stat-info">
            <h3>Pending Reminders</h3>
            <p class="stat-value">{{ stats?.totalReminders || 0 }}</p>
          </div>
        </div>
        <div class="stat-card success" (click)="openTodaysWork()" style="cursor: pointer;">
          <div class="stat-icon">📅</div>
          <div class="stat-info">
            <h3>Today's Work Count</h3>
            <p class="stat-value">{{ stats?.todaysWorkCount || 0 }}</p>
          </div>
        </div>
      </div>

      <app-work-progress *ngIf="selectedDay === 'todays-work'"></app-work-progress>

      <div class="mt-4 mb-3">
        <app-timeline [counts]="timelineCounts" [adminMode]="true" (daySelected)="onDaySelected($event)"></app-timeline>
      </div>

      <!-- Date Picker Section -->
      <div class="date-view-card mt-5">
        <div class="card-header">
          <h3>📅 Daily Records View</h3>
          <div class="date-picker-wrapper d-flex gap-3 align-items-center">
            <div class="search-group">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search Policy # or Name" 
                           [(ngModel)]="adminSearchTerm" (keyup.enter)="searchAdminDailyRecords()">
                    <button class="btn btn-outline-primary" type="button" (click)="searchAdminDailyRecords()" title="Search">
                        <i class="bi bi-search"></i>
                    </button>
                    <button class="btn btn-outline-secondary" type="button" *ngIf="adminSearchTerm" (click)="clearSearch()" title="Clear">
                        <i class="bi bi-x-lg"></i>
                    </button>
                </div>
            </div>
            <input type="date" [(ngModel)]="selectedDate" (change)="onDateChange()" class="form-control date-input">
          </div>
        </div>

        <div class="card-body">
          <div *ngIf="!selectedDate && !isSearchMode && selectedDay !== 'todays-work'" class="text-center py-5">
            <i class="bi bi-calendar-date display-4 text-muted mb-3"></i>
            <p class="text-muted lead">Please select a date to view scheduled tasks and expiring policies.</p>
          </div>

          <div *ngIf="(selectedDate || isSearchMode || selectedDay === 'todays-work') && loading" class="text-center py-5">
            <div class="spinner-border text-primary" role="status">
              <span class="visually-hidden">Loading...</span>
            </div>
          </div>

          <div *ngIf="(selectedDate || isSearchMode || selectedDay === 'todays-work') && !loading" class="records-content">
            <!-- Expiring Policies -->
            <div class="record-section">
              <h4 class="section-header text-primary">
                <span *ngIf="!isSearchMode && selectedDay !== 'todays-work'">Policies Expiring on {{ selectedDate | date:'mediumDate' }}</span>
                <span *ngIf="isSearchMode">Search Results for "{{ adminSearchTerm }}"</span>
                <span *ngIf="selectedDay === 'todays-work'">Today's Work </span>
                <span *ngIf="selectedDay === 'todays-work'" class="badge bg-primary ms-2 fs-6 fw-normal">Calls To be made Today: {{ selectedDateRecords.expiringPolicies.length }}</span>
                <span *ngIf="selectedDay !== 'todays-work'" class="badge bg-primary">{{ selectedDateRecords.expiringPolicies.length }}</span>
              </h4>
              <app-customer-list [policies]="selectedDateRecords.expiringPolicies" [loading]="false" [isAdmin]="true" (dataUpdated)="onDataUpdated()"></app-customer-list>
            </div>
            
            <hr class="divider">

            <!-- Scheduled Follow-ups (Hide in Search Mode or Todays Work mode) -->
            <div class="record-section" *ngIf="(!isSearchMode && selectedDay !== 'todays-work') && selectedDateRecords.scheduledFollowUps.length > 0">
              <h4 class="section-header text-warning">
                Follow-ups Scheduled for {{ selectedDate | date:'mediumDate' }}
                <span class="badge bg-warning">{{ selectedDateRecords.scheduledFollowUps.length }}</span>
              </h4>
              <app-customer-list [policies]="selectedDateRecords.scheduledFollowUps" [loading]="false" [isAdmin]="true" (dataUpdated)="onDataUpdated()"></app-customer-list>
            </div>
          </div>
        </div>
      </div>
      <!-- Renewer Records Section -->
      <div class="date-view-card mt-5">
        <div class="card-header">
          <h3>📞 Renewer Call Records</h3>
          <div class="d-flex gap-2">
            <button class="btn btn-outline-primary btn-sm" (click)="loadRenewerRecords()">
              <i class="bi bi-arrow-clockwise"></i> Refresh
            </button>
          </div>
        </div>

        <div class="card-body">
          <!-- Search and Filter Controls -->
          <div class="row mb-4 g-3">
            <div class="col-md-6">
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-search"></i></span>
                <input type="text" class="form-control" placeholder="Search Policy # or Customer Name..." [(ngModel)]="searchTerm">
              </div>
            </div>
            <div class="col-md-4">
              <select class="form-select" [(ngModel)]="selectedCategory">
                <option value="All">All Statuses</option>
                <option value="Pending">Pending</option>
                <option value="Pending Issuance">Pending Issuance</option>
                <option value="Externally Renewed">Externally Renewed</option>
                <option value="Renewed">Renewed</option>
                <option value="Late Renewed">Late Renewed</option>
                <option value="Interested">Interested</option>
                <option value="Not Interested">Not Interested</option>
                <option value="Voicemail">Voicemail</option>
                <option value="Call Back Later">Call Back Later</option>
              </select>
            </div>
          </div>

          <div *ngIf="loadingRecords" class="text-center py-5">
            <div class="spinner-border text-primary" role="status">
              <span class="visually-hidden">Loading...</span>
            </div>
          </div>

          <div *ngIf="!loadingRecords && filteredRecords.length === 0" class="text-center py-5">
            <p class="text-muted">No records found matching your criteria.</p>
          </div>

          <div *ngIf="!loadingRecords && filteredRecords.length > 0" class="table-responsive">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th style="width: 10%">Policy #</th>
                  <th style="width: 15%">Customer</th>
                  <th style="width: 10%">Expiry Date</th>
                  <th style="width: 10%">Renewer</th>
                  <th style="width: 12%">Call Outcome</th>
                  <th style="width: 32%">Notes</th>
                  <th style="width: 11%">Last Updated</th>
                  <th style="width: 8%">Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr *ngFor="let record of filteredRecords">
                  <td class="fw-bold">{{ record.policyNumber }}</td>
                  <td>
                    <div class="fw-bold">{{ record.customer.firstName }} {{ record.customer.lastName }}</div>
                    <small class="text-muted">{{ record.customer.phone }}</small>
                  </td>
                  <td>{{ record.reminder?.policy?.expiryDate | date:'mediumDate' }}</td>
                  <td>{{ (record.reminder?.lastUpdatedBy && record.reminder?.lastUpdatedBy !== 'System') ? record.reminder?.lastUpdatedBy : '--------' }}</td>
                  <td>
                    <span class="badge" [ngClass]="getBadgeClass(record.reminder?.lastCallOutcome)">
                      {{ record.reminder?.lastCallOutcome || 'Pending' }}
                    </span>
                  </td>
                  <td>
                    {{ record.reminder?.notes || '-' }}
                    <div *ngIf="['Call Back Later', 'Call Later'].includes(record.reminder?.lastCallOutcome)" class="text-muted small mt-1">
                      <i class="bi bi-clock"></i> Call Back: {{ record.reminder?.followUpDate | date:'medium' }}
                    </div>
                  </td>
                  <td>{{ record.reminder?.lastReminderSentAt | date:'medium' }}</td>
                  <td>
                      <button class="btn btn-sm btn-outline-primary me-2" (click)="openRenewalModal(record)" title="Edit">
                          <i class="bi bi-pencil"></i>
                      </button>
                      <button class="btn btn-sm btn-outline-danger" (click)="deletePolicy(record.id)" title="Delete">
                          <i class="bi bi-trash"></i>
                      </button>
                  </td>
                </tr> 

              </tbody>
            </table>
          </div>
        </div>
      </div>

    <!-- View Details Modal -->
    <div class="modal-overlay" *ngIf="showViewModal" (click)="closeViewModal()">
      <div class="custom-modal-content renewal-modal" (click)="$event.stopPropagation()">
        <div class="modal-header">
          <h3>Policy Details: <span class="text-primary">{{ selectedViewPolicy.policyNumber }}</span></h3>
          <div class="d-flex gap-2">
            <button class="btn btn-sm" [class.btn-outline-secondary]="viewHistoryMode" [class.btn-secondary]="!viewHistoryMode" (click)="viewHistoryMode = false">Details</button>
            <button class="btn btn-sm" [class.btn-outline-secondary]="!viewHistoryMode" [class.btn-secondary]="viewHistoryMode" (click)="loadAuditLogs(selectedViewPolicy.id)">History</button>
            <button class="btn-close ms-2" (click)="closeViewModal()"></button>
          </div>
        </div>
        <div class="modal-body" *ngIf="selectedViewPolicy">
            <!-- HISTORY VIEW -->
            <div *ngIf="viewHistoryMode">
                <h5 class="mb-3">Audit History</h5>
                <div *ngIf="auditLogs.length === 0" class="text-muted text-center py-4">No changes recorded.</div>
                <div class="table-responsive" *ngIf="auditLogs.length > 0">
                    <table class="table table-sm table-striped">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Field</th>
                                <th>Old Value</th>
                                <th>New Value</th>
                                <th>Updated By</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr *ngFor="let log of auditLogs">
                                <td>{{ log.updatedAt | date:'medium' }}</td>
                                <td>{{ log.fieldName }}</td>
                                <td class="text-muted"><small>{{ log.oldValue || '-' }}</small></td>
                                <td class="text-success"><small>{{ log.newValue || '-' }}</small></td>
                                <td>{{ log.updatedBy }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- DETAILS VIEW -->
            <div class="row g-3" *ngIf="!viewHistoryMode">
                <!-- Policy & Customer Details Section -->
                <div class="col-12">
                    <h5 class="border-bottom pb-2">Policy & Customer Details</h5>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Customer Name</label>
                    <div>{{ selectedViewPolicy.customer.firstName }} {{ selectedViewPolicy.customer.lastName }}</div>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Contact</label>
                    <div>{{ selectedViewPolicy.customer.phone }}</div>
                    <small class="text-muted">{{ selectedViewPolicy.customer.email }}</small>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Policy Type</label>
                    <div>{{ selectedViewPolicy.type }}</div>
                    <small class="text-muted">{{ selectedViewPolicy.insuranceName }}</small>
                </div>
                 <div class="col-md-6">
                    <label class="fw-bold text-muted small">Expiry Date</label>
                    <div>{{ selectedViewPolicy.expiryDate | date:'mediumDate' }}</div>
                </div>

                 <!-- Customer MIS Fields (Toggle-able) -->
                 <div class="col-12"><hr class="my-1 text-muted opacity-25"></div>

                 <!-- DOB -->
                 <div class="col-md-6">
                    <label class="fw-bold text-muted small">Date of Birth</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.customer.dob | date:'mediumDate' }}</div>
                    <input *ngIf="isEditing" type="date" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.customer.dob">
                 </div>
                 <!-- Billing Freq -->
                 <div class="col-md-6">
                    <label class="fw-bold text-muted small">Billing Freq.</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.customer.billingFrequency || '-' }}</div>
                     <select *ngIf="isEditing" class="form-select form-select-sm" [(ngModel)]="selectedViewPolicy.customer.billingFrequency">
                        <option value="Monthly">Monthly</option>
                        <option value="Quarterly">Quarterly</option>
                        <option value="Half-YearLy">Half-Yearly</option>
                        <option value="Yearly">Yearly</option>
                    </select>
                 </div>
                 <!-- PAN -->
                  <div class="col-md-6">
                    <label class="fw-bold text-muted small">PAN Number</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.customer.panNumber || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm text-uppercase" [(ngModel)]="selectedViewPolicy.customer.panNumber">
                 </div>
                 <!-- GST -->
                  <div class="col-md-6">
                    <label class="fw-bold text-muted small">GST Number</label>
                     <div *ngIf="!isEditing">{{ selectedViewPolicy.customer.gstNumber || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm text-uppercase" [(ngModel)]="selectedViewPolicy.customer.gstNumber">
                 </div>
                 <!-- Address -->
                 <div class="col-12">
                    <label class="fw-bold text-muted small">Address Details</label>
                     <div *ngIf="!isEditing">
                        <div>{{ selectedViewPolicy.customer.address || '-' }}</div>
                        <div class="text-muted small" *ngIf="selectedViewPolicy.customer.city || selectedViewPolicy.customer.state">
                            {{ selectedViewPolicy.customer.city }}{{ selectedViewPolicy.customer.state ? ', ' + selectedViewPolicy.customer.state : '' }}
                        </div>
                    </div>
                     <div *ngIf="isEditing" class="row g-2">
                        <div class="col-12">
                            <textarea class="form-control form-control-sm" rows="2" [(ngModel)]="selectedViewPolicy.customer.address" placeholder="Full Address"></textarea>
                        </div>
                        <div class="col-6">
                            <input type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.customer.city" placeholder="City">
                        </div>
                        <div class="col-6">
                            <input type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.customer.state" placeholder="State">
                        </div>
                    </div>
                 </div>

                <!-- MIS Enrichment Details Section -->
                <div class="col-12 mt-3">
                    <h5 class="border-bottom pb-2">MIS Enrichment Details</h5>
                </div>
                 <!-- Business Type -->
                 <div class="col-md-6">
                    <label class="fw-bold text-muted small">Business Type</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.businessType || '-' }}</div>
                    <select *ngIf="isEditing" class="form-select form-select-sm" [(ngModel)]="selectedViewPolicy.businessType">
                        <option value="Fresh">Fresh</option>
                        <option value="Renewal">Renewal</option>
                        <option value="Portability">Portability</option>
                    </select>
                 </div>
                 <!-- Login Status -->
                 <div class="col-md-6">
                    <label class="fw-bold text-muted small">Login Status</label>
                    <div *ngIf="!isEditing">
                         <span class="badge" [ngClass]="getBadgeClass(selectedViewPolicy.loginStatus)">{{ selectedViewPolicy.loginStatus || 'Pending' }}</span>
                    </div>
                    <select *ngIf="isEditing" class="form-select form-select-sm" [(ngModel)]="selectedViewPolicy.loginStatus">
                        <option value="Issued">Issued</option>
                        <option value="Logged">Logged</option>
                        <option value="Cancelled">Cancelled</option>
                    </select>
                 </div>
                 <!-- Branch -->
                 <div class="col-md-6">
                    <label class="fw-bold text-muted small">Branch</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.branch || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.branch">
                 </div>


                <!-- Payment Details Section -->
                <div class="col-12 mt-3">
                    <h5 class="border-bottom pb-2">Financial Payment Details</h5>
                </div>
                 <div class="col-md-6">
                    <label class="fw-bold text-muted small">Payment Mode</label>
                    <div>{{ selectedViewPolicy.paymentMode || '-' }}</div>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Payment Date</label>
                    <div>{{ selectedViewPolicy.paymentDate | date:'mediumDate' }}</div>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Bank Name</label>
                    <div>{{ selectedViewPolicy.paymentBank || '-' }}</div>
                </div>
                 <div class="col-md-6">
                    <label class="fw-bold text-muted small">Reference / ID</label>
                    <div>{{ selectedViewPolicy.paymentReference || '-' }}</div>
                </div>
                 <div class="col-md-6">
                    <label class="fw-bold text-muted small">Payment Amount</label>
                    <div class="text-success fw-bold">{{ selectedViewPolicy.paymentAmount | currency:'INR' }}</div>
                </div>
            </div>
            
            <hr>
            <h5>Documents</h5>
            <div class="d-flex gap-3">
                <button class="btn btn-outline-primary" (click)="viewDocument('payment')" [disabled]="!selectedViewPolicy.paymentDocumentPath">
                    <i class="bi bi-eye"></i> View Payment Proof
                </button>
                <button class="btn btn-outline-success" (click)="viewDocument('policy')" [disabled]="!selectedViewPolicy.policyDocumentPath">
                    <i class="bi bi-eye"></i> View Policy Document
                </button>
            </div>
             <p class="text-muted small mt-2" *ngIf="!selectedViewPolicy.paymentDocumentPath && !selectedViewPolicy.policyDocumentPath">
                No documents uploaded for this policy.
            </p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" (click)="closeViewModal()">Close</button>
            <button type="button" class="btn"
                [ngClass]="isEditing ? 'btn-success' : 'btn-primary'"
                (click)="isEditing ? savePolicyChanges() : toggleEditMode()">
                {{ isEditing ? 'Save Changes' : 'Edit Details' }}
            </button>
        </div>
      </div>
    </div>
      <!-- Renewal Modal -->
      <div class="modal-overlay" *ngIf="showRenewalModal" (click)="closeRenewalModal()">
        <div class="custom-modal-content renewal-modal" (click)="$event.stopPropagation()">
          <div class="modal-header">
            <h3>Add / Edit Policy</h3>
            <button class="btn-close" (click)="closeRenewalModal()"></button>
          </div>
          <div class="modal-body">
            <!-- Search -->
            <div class="form-group mb-4 position-relative">
              <label class="form-label">Search Existing Customer / Policy (Optional)</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-search"></i></span>
                <input type="text" class="form-control" placeholder="Type name or policy number to auto-fill..." 
                       [(ngModel)]="renewalSearchTerm" (input)="searchPoliciesForRenewal()">
              </div>
              <!-- Dropdown -->
              <div class="search-results" *ngIf="renewalSearchResults.length > 0">
                <div class="search-item" *ngFor="let result of renewalSearchResults" (click)="selectPolicyForRenewal(result)">
                  <strong>{{ result.customer.firstName }} {{ result.customer.lastName }}</strong>
                  <small class="d-block text-muted">{{ result.policyNumber }} - {{ result.insuranceName }} | Exp: {{ result.expiryDate | date:'mediumDate' }}</small>
                </div>
              </div>
            </div>

            <!-- Always show form -->
            <div class="row g-3">
              <!-- Customer Details -->
              <div class="col-12"><h5 class="border-bottom pb-2">Customer Details</h5></div>
              <div class="col-md-6">
                <label class="form-label">First Name *</label>
                <input type="text" class="form-control" [(ngModel)]="renewalForm.customer.firstName" placeholder="Enter first name">
              </div>
              <div class="col-md-6">
                <label class="form-label">Last Name *</label>
                <input type="text" class="form-control" [(ngModel)]="renewalForm.customer.lastName" placeholder="Enter last name">
              </div>
              <div class="col-md-6">
                <label class="form-label">Email *</label>
                <input type="email" class="form-control" [(ngModel)]="renewalForm.customer.email" placeholder="Enter email">
              </div>
              <div class="col-md-6">
                <label class="form-label">Phone *</label>
                <input type="text" class="form-control" [(ngModel)]="renewalForm.customer.phone" placeholder="Enter phone">
              </div>
              <div class="col-md-6">
                <label class="form-label">Billing Frequency</label>
                <select class="form-select" [(ngModel)]="renewalForm.customer.billingFrequency">
                  <option value="">Select frequency</option>
                  <option value="Monthly">Monthly</option>
                  <option value="Quarterly">Quarterly</option>
                  <option value="Half-Yearly">Half-Yearly</option>
                  <option value="Yearly">Yearly</option>
                </select>
              </div>

              <!-- Policy Details -->
              <div class="col-12 mt-4"><h5 class="border-bottom pb-2">Policy Details</h5></div>
              <div class="col-md-6">
                <label class="form-label">Policy Number *</label>
                <input type="text" class="form-control" [(ngModel)]="renewalForm.policyNumber" placeholder="Enter policy number">
              </div>
              <div class="col-md-6">
                <label class="form-label">Insurance Name *</label>
                <input type="text" class="form-control" [(ngModel)]="renewalForm.insuranceName" placeholder="Enter insurance name">
              </div>
              <div class="col-md-6">
                <label class="form-label">Product Name</label>
                <input type="text" class="form-control" [(ngModel)]="renewalForm.productName" placeholder="Enter product name">
              </div>
              <div class="col-md-6">
                <label class="form-label">Policy Type *</label>
                <input type="text" class="form-control" [(ngModel)]="renewalForm.type" placeholder="e.g., Motor Insurance, Health">
              </div>
              <div class="col-md-6">
                <label class="form-label">Amount *</label>
                <input type="number" class="form-control" [(ngModel)]="renewalForm.amount" placeholder="Enter amount">
              </div>
              <div class="col-md-6">
                <label class="form-label">Premium</label>
                <input type="number" class="form-control" [(ngModel)]="renewalForm.duePremium" placeholder="Enter premium">
              </div>
              <div class="col-md-6">
                <label class="form-label">Policy Start Date *</label>
                <input type="date" class="form-control" [(ngModel)]="renewalForm.policyStartDate">
              </div>
              <div class="col-md-6">
                <label class="form-label">Policy End Date *</label>
                <input type="date" class="form-control" [(ngModel)]="renewalForm.policyEndDate">
              </div>

              <!-- Additional Details -->
              <div class="col-12 mt-4"><h5 class="border-bottom pb-2">Additional Details</h5></div>
              <div class="col-md-6">
                <label class="form-label">RM Name</label>
                <input type="text" class="form-control" [(ngModel)]="renewalForm.rmName" placeholder="Enter RM name">
              </div>
              <div class="col-md-6">
                <label class="form-label">Associate Name</label>
                <input type="text" class="form-control" [(ngModel)]="renewalForm.associateName" placeholder="Enter associate name">
              </div>
              <div class="col-md-6">
                <label class="form-label">Associate Code</label>
                <input type="text" class="form-control" [(ngModel)]="renewalForm.associateCode" placeholder="Enter associate code">
              </div>
              <div class="col-md-6">
                <label class="form-label">Vehicle Reg No</label>
                <input type="text" class="form-control" [(ngModel)]="renewalForm.vehicleRegNo" placeholder="Enter vehicle reg no">
              </div>
              <div class="col-md-6">
                <label class="form-label">Vehicle Model</label>
                <input type="text" class="form-control" [(ngModel)]="renewalForm.vehicleModel" placeholder="Enter vehicle model">
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button class="btn btn-secondary" (click)="closeRenewalModal()">Cancel</button>
            <button class="btn btn-primary" (click)="submitRenewal()">
              {{ selectedRenewalPolicy ? 'Update Policy' : 'Create Policy' }}
            </button>
          </div>
        </div>
      </div>

    </div>

    <!-- Branch Modal -->
    <div class="modal-overlay" *ngIf="showBranchModal" (click)="closeBranchModal()">
      <div class="custom-modal-content premium-branch-modal" style="max-width: 450px;" (click)="$event.stopPropagation()">
        <div class="modal-header border-0 pb-0 mt-2">
          <div class="d-flex align-items-center w-100">
            <div class="header-icon bg-primary bg-opacity-10 text-primary me-3">
              <i class="bi bi-buildings-fill fs-4"></i>
            </div>
            <h3 class="mb-0 fw-bold">Manage Branches</h3>
            <button class="btn-close ms-auto" (click)="closeBranchModal()"></button>
          </div>
        </div>
        <div class="modal-body px-4 pt-4">
          <div class="branch-list-container mb-4">
            <label class="form-label text-muted fw-bold small text-uppercase tracking-wide mb-3">Active Branches</label>
            <div class="branch-list border rounded-3 overflow-hidden shadow-sm">
              <div class="list-group list-group-flush">
                <div class="list-group-item d-flex align-items-center py-3 branch-item" *ngFor="let b of availableBranches">
                   <div class="branch-indicator me-3"></div>
                   <span class="fw-semibold text-dark">{{ b }}</span>
                   <i class="bi bi-check-circle-fill ms-auto text-success opacity-75"></i>
                </div>
                <div class="list-group-item text-muted text-center py-4" *ngIf="availableBranches.length === 0">
                  <i class="bi bi-inbox fs-3 d-block mb-2 opacity-50"></i>
                  No branches configured
                </div>
              </div>
            </div>
          </div>
          
          <div class="add-branch-section p-4 bg-light rounded-4 border border-light shadow-sm mb-2">
            <label class="form-label fw-bold text-dark mb-2">Add New Region</label>
            <div class="input-group shadow-sm new-branch-group">
              <span class="input-group-text bg-white border-end-0 border-primary-focus"><i class="bi bi-plus text-primary"></i></span>
              <input type="text" [(ngModel)]="newBranchName" class="form-control border-start-0 border-primary-focus shadow-none" placeholder="e.g. Kolkata" (keyup.enter)="saveBranch()">
              <button class="btn btn-primary px-4 fw-bold" (click)="saveBranch()">
                Add 
              </button>
            </div>
            <small class="text-muted mt-2 d-block"><i class="bi bi-info-circle me-1"></i> Instantly activates cross-dashboard routing.</small>
          </div>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .admin-container { padding: 20px; max-width: 1400px; margin: 0 auto; }

    /* Branch Selector Redesign */
    .branch-selector {
      background: white;
      border: 1px solid #e2e8f0;
      border-radius: 50px;
      width: 280px;
      transition: all 0.2s ease-in-out;
    }
    .branch-selector:hover {
      box-shadow: 0 4px 12px rgba(13, 110, 253, 0.15) !important;
      border-color: #0d6efd;
    }
    .branch-selector .input-group-text {
      border-radius: 50px 0 0 50px;
    }
    .branch-selector .icon-circle {
      width: 32px;
      height: 32px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .branch-selector select {
      cursor: pointer;
      border-radius: 0 50px 50px 0;
    }
    .branch-selector select:focus {
      box-shadow: none !important;
    }
    .btn-branch {
      border-radius: 50px;
      font-weight: 600;
      border: 1px solid #e2e8f0;
      background: white;
      transition: all 0.2s;
      color: #334155;
    }
    .btn-branch:hover {
      background: #f8fafc;
      border-color: #cbd5e1;
    }
    
    /* Premium Branch Modal */
    .premium-branch-modal {
      border-radius: 20px !important;
      animation: modalSlideUp 0.3s cubic-bezier(0.16, 1, 0.3, 1);
    }
    @keyframes modalSlideUp {
      from { opacity: 0; transform: translateY(20px) scale(0.98); }
      to { opacity: 1; transform: translateY(0) scale(1); }
    }
    .header-icon {
      width: 48px;
      height: 48px;
      border-radius: 12px;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .tracking-wide {
      letter-spacing: 0.05em;
    }
    .branch-list {
      max-height: 250px;
      overflow-y: auto;
      border-color: #f1f5f9 !important;
    }
    .branch-item {
      transition: background 0.2s;
      cursor: default;
    }
    .branch-item:hover {
      background: #f8fafc;
    }
    .branch-indicator {
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: #0d6efd;
      box-shadow: 0 0 0 4px rgba(13, 110, 253, 0.1);
    }
    .new-branch-group {
      border-radius: 12px;
      overflow: hidden;
      transition: all 0.2s;
    }
    .new-branch-group:focus-within {
      box-shadow: 0 0 0 4px rgba(13, 110, 253, 0.15) !important;
    }
    .new-branch-group .form-control {
      background: white;
    }
    .border-primary-focus:focus-within {
      border-color: #86b7fe !important;
    }
    .header-section { 
      margin-bottom: 35px; 
      padding-bottom: 25px; 
      border-bottom: 1px solid #e2e8f0;
    }
    .header-section h2 { 
      margin-bottom: 8px; 
      color: #1e293b; 
      font-weight: 800;
      font-size: 2.2rem;
      letter-spacing: -0.03em;
    }
    .header-section p {
      font-size: 1.1rem;
      color: #64748b;
      margin: 0;
    }
    
    /* Stats Cards */
    .stats-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 25px; }
    .stat-card { 
      background: white; 
      padding: 25px; 
      border-radius: 15px; 
      box-shadow: 0 4px 15px rgba(0,0,0,0.05); 
      display: flex; 
      align-items: center; 
      gap: 20px;
      transition: transform 0.2s;
    }
    .stat-card:hover { transform: translateY(-5px); }
    .stat-icon { font-size: 2.5rem; background: #f8f9fa; padding: 15px; border-radius: 12px; }
    .stat-info h3 { margin: 0; font-size: 0.9rem; color: #6c757d; text-transform: uppercase; letter-spacing: 1px; }
    .stat-value { margin: 5px 0 0; font-size: 2.2rem; font-weight: 700; color: #2c3e50; }
    
    .stat-card.primary .stat-icon { background: #e3f2fd; color: #0d6efd; }
    .stat-card.warning .stat-icon { background: #fff3cd; color: #ffc107; }
    .stat-card.success .stat-icon { background: #d1e7dd; color: #198754; }

    /* Date View Card */
    .date-view-card { 
      background: white; 
      border-radius: 15px; 
      box-shadow: 0 4px 20px rgba(0,0,0,0.08); 
      overflow: hidden;
      margin-top: 40px;
    }
    .card-header { 
      background: #f8f9fa; 
      padding: 20px 30px; 
      border-bottom: 1px solid #e9ecef;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .card-header h3 { margin: 0; font-size: 1.2rem; color: #495057; }
    .card-body { padding: 30px; }
    
    .date-input { 
      padding: 10px 15px; 
      border-radius: 8px; 
      border: 1px solid #ced4da; 
      font-size: 1rem;
      min-width: 200px;
    }

    .section-header { 
      display: flex; 
      align-items: center; 
      gap: 15px; 
      margin-bottom: 20px;
      font-size: 1.3rem;
    }
    .badge { padding: 5px 12px; border-radius: 20px; font-size: 0.9rem; color: white; }
    .bg-primary { background-color: #0d6efd; }
    .bg-warning { background-color: #ffc107; color: #000; }
    .bg-success { background-color: #198754; }
    .bg-danger { background-color: #dc3545; }
    .bg-secondary { background-color: #6c757d; }
    .text-primary { color: #0d6efd; }
    .text-warning { color: #ffc107; text-shadow: 0px 0px 1px #997404; }
    
    .divider { margin: 40px 0; border-top: 1px solid #e9ecef; }
    .py-5 { padding-top: 3rem; padding-bottom: 3rem; }
    
    .table th { font-weight: 600; color: #6c757d; border-bottom: 2px solid #dee2e6; }
    .table td { vertical-align: middle; }

    /* Renewal Modal Styles */
    .modal-overlay {
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: rgba(0, 0, 0, 0.5);
      display: flex;
      align-items: center;
      justify-content: center;
      z-index: 1050;
    }
    .custom-modal-content {
      background: white;
      border-radius: 12px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
      overflow: hidden;
      display: flex;
      flex-direction: column;
      max-height: 90vh;
    }
    .modal-header {
      padding: 15px 25px;
      border-bottom: 1px solid #e9ecef;
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #f8f9fa;
      position: relative;
    }
    .modal-header h3 { margin: 0; }
    .modal-header .btn-close {
      position: absolute;
      right: 25px;
      background: transparent url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23000'%3e%3cpath d='M.293.293a1 1 0 0 1 1.414 0L8 6.586 14.293.293a1 1 0 1 1 1.414 1.414L9.414 8l6.293 6.293a1 1 0 0 1-1.414 1.414L8 9.414l-6.293 6.293a1 1 0 0 1-1.414-1.414L6.586 8 .293 1.707a1 1 0 0 1 0-1.414z'/%3e%3c/svg%3e") center/1em auto no-repeat;
      width: 1em; height: 1em; padding: 0.5rem; border: 0; opacity: 0.5; cursor: pointer;
    }
    .modal-body { padding: 25px; overflow-y: auto; }
    .modal-footer {
      padding: 15px 25px;
      border-top: 1px solid #e9ecef;
      display: flex;
      justify-content: flex-end;
      background-color: #f8f9fa;
      gap: 10px;
    }

    .renewal-modal { width: 800px; max-width: 95%; }
    .search-results {
      position: absolute;
      top: 100%;
      left: 0;
      right: 0;
      background: white;
      border: 1px solid #ced4da;
      border-radius: 0 0 8px 8px;
      max-height: 200px;
      overflow-y: auto;
      z-index: 1000;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }
    .search-item {
      padding: 10px 15px;
      cursor: pointer;
      border-bottom: 1px solid #f1f3f5;
    }
    .search-item:hover { background-color: #f8f9fa; }
    .search-item:last-child { border-bottom: none; }
    
    .search-group { min-width: 400px; }
    
    /* Ensure search input matches date input height */
    .search-group .form-control, .search-group .btn {
      padding: 10px 15px;
    }
  `]
})
export class AdminDashboardComponent implements OnInit {
  @ViewChild(WorkProgressComponent) workProgressComponent!: WorkProgressComponent;
  stats: any = {};
  selectedDate: string = '';
  selectedDateRecords: any = { expiringPolicies: [], scheduledFollowUps: [] };
  loading: boolean = false;
  adminSearchTerm: string = '';
  isSearchMode: boolean = false;
  selectedDay: number | string | null = null;
  timelineCounts: { [key: number]: number } = {};
  selectedAdminBranch: string = ''; // Supports "All Branches" by default empty
  availableBranches: string[] = [];
  showBranchModal: boolean = false;
  newBranchName: string = '';

  // Renewer Records
  renewerRecords: any[] = [];

  // Audit Logs
  auditLogs: any[] = [];
  viewHistoryMode: boolean = false;
  searchTerm: string = '';
  selectedCategory: string = 'All';
  loadingRecords: boolean = false;

  // Late Renewals
  lateRenewals: any[] = [];

  // Renewal Modal
  showRenewalModal: boolean = false;
  renewalForm: any = { customer: {} };
  selectedRenewalPolicy: any = null;
  renewalSearchTerm: string = '';
  renewalSearchResults: any[] = [];
  newPolicyEndDate: string = '';

  constructor(private apiService: ApiService) { }

  ngOnInit() {
    this.loadStats();
    this.refreshTimelineCounts();
    this.loadRenewerRecords();
    // this.loadLateRenewals(); // Not needed as separate section is removed

    // Do not auto-select date. User must select manually.
    this.selectedDate = '';
    this.selectedDay = null;

    this.loadBranches();
  }

  loadBranches() {
    this.apiService.getBranches().subscribe(branches => {
      this.availableBranches = branches;
    });
  }

  openBranchModal() {
    this.showBranchModal = true;
  }

  closeBranchModal() {
    this.showBranchModal = false;
    this.newBranchName = '';
  }

  saveBranch() {
    if (!this.newBranchName || !this.newBranchName.trim()) return;
    this.apiService.createBranch({ name: this.newBranchName.trim() }).subscribe({
      next: (res) => {
         this.loadBranches();
         this.newBranchName = '';
      },
      error: (err) => {
         alert('Error creating branch: ' + (err.error || err.message));
      }
    });
  }

  loadStats() {
    this.apiService.getAdminStats(this.selectedAdminBranch).subscribe({
      next: (data) => this.stats = data,
      error: (err) => console.error('Error loading stats:', err)
    });
  }

  refreshTimelineCounts() {
    this.apiService.getTimelineCounts(this.selectedAdminBranch).subscribe({
      next: (counts) => {
          this.timelineCounts = counts;
          // Refresh Timeline View to trigger a re-render map layout
          this.timelineCounts = { ...this.timelineCounts };
      },
      error: (err) => console.error('Error fetching timeline counts for admin', err)
    });
  }

  onBranchChange() {
      this.loadStats();
      this.refreshTimelineCounts();
      this.loadRenewerRecords();
      if (this.selectedDate) {
          this.onDateChange();
      } else if (this.selectedDay === 'todays-work') {
          this.openTodaysWork();
      }
  }

  // loadLateRenewals removed as per user request

  get filteredRecords() {
    // Search-First Logic: Hide records if no search term AND category is 'All'
    if (!this.searchTerm && this.selectedCategory === 'All') {
      return [];
    }

    return this.renewerRecords.filter(record => {
      const matchesSearch = !this.searchTerm ||
        record.policyNumber.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        (record.customer.firstName + ' ' + record.customer.lastName).toLowerCase().includes(this.searchTerm.toLowerCase());

      const outcome = record.reminder?.lastCallOutcome || 'Pending';

      const matchesCategory = this.selectedCategory === 'All' ||
        (this.selectedCategory === 'Pending' && (!record.reminder?.lastCallOutcome || record.reminder?.lastCallOutcome === 'Pending')) ||
        (this.selectedCategory === 'Call Back Later' && (outcome === 'Call Back Later' || outcome === 'Call Later')) ||
        outcome.toLowerCase() === this.selectedCategory.toLowerCase();

      return matchesSearch && matchesCategory;
    });
  }

  loadRenewerRecords() {
    this.loadingRecords = true;
    this.apiService.getAllCallRecords(this.selectedAdminBranch).subscribe({
      next: (reminders) => {
        this.renewerRecords = reminders.map(r => ({
          policyNumber: r.policy.policyNumber,
          customer: r.policy.customer,
          reminder: r
        }));
        this.loadingRecords = false;
      },
      error: (err) => {
        console.error(err);
        this.loadingRecords = false;
      }
    });
  }

  searchAdminDailyRecords() {
    if (!this.adminSearchTerm.trim()) return;

    this.loading = true;
    this.isSearchMode = true;
    this.selectedDate = ''; // Clear date selection
    this.selectedDay = null; // Clear todays-work mode

    this.apiService.searchPolicies(this.adminSearchTerm)
      .pipe(finalize(() => this.loading = false))
      .subscribe({
        next: (policies) => {
          this.selectedDateRecords = {
            expiringPolicies: policies,
            scheduledFollowUps: [], // Search mainly returns policies, follow-ups context might be missing
            workedOnPolicies: []
          };
        },
        error: (err) => {
          console.error('Error searching:', err);
          this.selectedDateRecords = { expiringPolicies: [], scheduledFollowUps: [], workedOnPolicies: [] };
        }
      });
  }

  clearSearch() {
    this.adminSearchTerm = '';
    this.isSearchMode = false;
    this.selectedDate = ''; // Reset date too? Or maybe keep it empty. 
    // Ideally, if a date was selected before, we might want to return to it, but for now reset.
    if (this.selectedDay !== 'todays-work') {
      this.onDateChange(); // This will just clear records if date is empty
    }
  }


  onDateChange() {
    if (!this.selectedDate) {
      this.selectedDay = null;
      return;
    }

    // Reverse calc the timeline day highlight
    const selected = new Date(this.selectedDate);
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const diffTime = selected.getTime() - today.getTime();
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

    const validBuckets = [75, 60, 45, 30, 15, 7, 3, 2, 1, 0, -1, -2, -3, -7, -15, -30, -45, -60, -75];
    if (validBuckets.includes(diffDays)) {
      this.selectedDay = diffDays;
    } else {
      this.selectedDay = null;
    }

    this.isSearchMode = false;
    this.adminSearchTerm = '';

    this.loading = true;
    this.apiService.getRecordsForDate(this.selectedDate, this.selectedAdminBranch)
      .pipe(finalize(() => this.loading = false))
      .subscribe({
        next: (data) => {
          try {
            this.selectedDateRecords = {
              expiringPolicies: data.expiringPolicies || [],
              scheduledFollowUps: data.scheduledFollowUps || [],
              workedOnPolicies: data.workedOnPolicies || []
            };
          } catch (e) {
            console.error('Error processing records:', e);
            this.selectedDateRecords = { expiringPolicies: [], scheduledFollowUps: [], workedOnPolicies: [] };
          }
        },
        error: (err) => {
          console.error('Error fetching records:', err);
          this.selectedDateRecords = { expiringPolicies: [], scheduledFollowUps: [], workedOnPolicies: [] };
        }
      });
  }

  onDaySelected(day: number) {
    this.selectedDay = day;
    this.isSearchMode = false;
    this.adminSearchTerm = '';

    const targetDate = new Date();
    targetDate.setDate(targetDate.getDate() + day);

    // Format YYYY-MM-DD local
    const yyyy = targetDate.getFullYear();
    const mm = String(targetDate.getMonth() + 1).padStart(2, '0');
    const dd = String(targetDate.getDate()).padStart(2, '0');

    this.selectedDate = `${yyyy}-${mm}-${dd}`;
    this.onDateChange(); // fetch records
  }

  openTodaysWork() {
    this.selectedDate = '';
    this.isSearchMode = false;
    this.adminSearchTerm = '';
    this.selectedDay = 'todays-work';

    this.loading = true;
    this.apiService.getTodaysWork().subscribe({
      next: (policies) => {
        this.selectedDateRecords = {
          expiringPolicies: policies,
          scheduledFollowUps: [],
          workedOnPolicies: []
        };
        this.loading = false;
        if (this.workProgressComponent) {
            this.workProgressComponent.refreshProgress();
        }
      },
      error: (err) => {
        console.error('Error fetching todays work:', err);
        this.selectedDateRecords = { expiringPolicies: [], scheduledFollowUps: [], workedOnPolicies: [] };
        this.loading = false;
      }
    });
  }

  onDataUpdated() {
    this.refreshTimelineCounts();
    this.loadStats(); // Update the top-level stats like "Today's Work Count"
    if (this.selectedDay === 'todays-work') {
      this.openTodaysWork();
      if (this.workProgressComponent) {
          this.workProgressComponent.refreshProgress();
      }
    } else if (this.selectedDate) {
      this.onDateChange();
    } else if (this.isSearchMode) {
      this.searchAdminDailyRecords();
    }
  }

  getBadgeClass(outcome: string): string {
    if (!outcome) return 'bg-secondary';
    switch (outcome.toLowerCase()) {
      case 'interested': return 'bg-success';
      case 'pending issuance': return 'bg-info text-dark';
      case 'renewed':
      case 'externally renewed': return 'bg-success';
      case 'late renewed': return 'bg-danger';
      case 'not interested': return 'bg-danger';
      case 'call later':
      case 'call back later': return 'bg-warning text-dark';
      case 'pending': return 'bg-secondary'; // Grey style for Pending
      default: return 'bg-secondary';
    }
  }

  // View Modal Logic
  selectedViewPolicy: any = null;
  showViewModal: boolean = false;

  openViewModal(policy: any) {
    this.selectedViewPolicy = policy;
    this.showViewModal = true;
    this.isEditing = false;
    this.viewHistoryMode = false;
    this.auditLogs = [];

    // Fetch fresh data
    this.apiService.getPolicyById(policy.id).subscribe({
      next: (freshPolicy) => {
        this.selectedViewPolicy = freshPolicy;
        console.log('Admin Dashboard: Policy refreshed from server');
      },
      error: (err) => console.error('Error refreshing policy in Admin Dashboard:', err)
    });
  }

  closeViewModal() {
    this.showViewModal = false;
    this.selectedViewPolicy = null;
  }

  viewDocument(type: 'payment' | 'policy') {
    if (!this.selectedViewPolicy) return;
    const id = this.selectedViewPolicy.id;

    const request = type === 'payment'
      ? this.apiService.downloadPaymentProof(id)
      : this.apiService.downloadPolicyDocument(id);

    request.subscribe({
      next: (blob) => {
        const url = window.URL.createObjectURL(blob);
        window.open(url, '_blank');
        // optimize: revoke url after some time? or let browser handle it on close.
        // window.URL.revokeObjectURL(url); // Can't revoke immediately if valid
      },
      error: () => alert('Failed to view document. It might not exist.')
    });
  }

  openRenewalModal(policy: any = null) {
    this.showRenewalModal = true;
    if (policy) {
      this.selectPolicyForRenewal(policy);
    } else {
      this.resetRenewalForm();
    }
  }

  deletePolicy(id: any) {
    if (confirm('Are you sure you want to delete this policy? This action cannot be undone.')) {
      this.apiService.deletePolicy(id).subscribe({
        next: () => {
          alert('Policy deleted successfully');
          this.refreshTimelineCounts();
          this.loadRenewerRecords();
          if (this.selectedDate) {
            this.onDateChange();
          }
        },
        error: (err) => alert('Failed to delete policy: ' + err.message)
      });
    }
  }

  loadAuditLogs(policyId: number) {
    this.viewHistoryMode = true;
    this.apiService.getAuditLogs(policyId).subscribe({
      next: (logs) => this.auditLogs = logs,
      error: (err) => console.error('Error loading audit logs', err)
    });
  }

  closeRenewalModal() {
    this.showRenewalModal = false;
    this.resetRenewalForm();
  }

  resetRenewalForm() {
    this.renewalSearchTerm = '';
    this.renewalSearchResults = [];
    this.selectedRenewalPolicy = null;
    this.renewalForm = { customer: {} };
    this.newPolicyEndDate = '';
  }

  searchPoliciesForRenewal() {
    if (this.renewalSearchTerm.length < 2) {
      this.renewalSearchResults = [];
      return;
    }
    this.apiService.searchPolicies(this.renewalSearchTerm).subscribe(results => {
      this.renewalSearchResults = results;
    });
  }

  selectPolicyForRenewal(policy: any) {
    this.selectedRenewalPolicy = policy;
    this.renewalForm = JSON.parse(JSON.stringify(policy)); // Initial copy
    this.renewalSearchResults = [];
    this.renewalSearchTerm = ''; // Clear search

    // Fetch fresh data to ensure we are editing/renewing the latest version
    this.apiService.getPolicyById(policy.id).subscribe({
      next: (freshPolicy) => {
        this.selectedRenewalPolicy = freshPolicy;
        this.renewalForm = JSON.parse(JSON.stringify(freshPolicy));
        console.log('Renewal Form: Policy refreshed from server');
      },
      error: (err) => console.error('Error refreshing policy for renewal:', err)
    });
  }

  submitRenewal() {
    // Validate required fields
    if (!this.renewalForm.customer.firstName || !this.renewalForm.customer.lastName ||
      !this.renewalForm.customer.email || !this.renewalForm.customer.phone ||
      !this.renewalForm.policyNumber || !this.renewalForm.insuranceName ||
      !this.renewalForm.type || !this.renewalForm.amount ||
      !this.renewalForm.policyStartDate || !this.renewalForm.policyEndDate) {
      alert('Please fill all required fields marked with *');
      return;
    }

    // Calculate expiryDate from policyEndDate
    this.renewalForm.expiryDate = this.renewalForm.policyEndDate;
    this.renewalForm.status = 'ACTIVE';

    if (this.selectedRenewalPolicy) {
      // Update existing policy
      this.apiService.updatePolicy(this.selectedRenewalPolicy.id, this.renewalForm).subscribe({
        next: () => {
          alert('Policy updated successfully!');
          this.closeRenewalModal();
          this.ngOnInit(); // Refresh stats
        },
        error: (err) => alert('Error updating policy: ' + err.message)
      });
    } else {
      // Create new policy
      this.apiService.createPolicy(this.renewalForm).subscribe({
        next: () => {
          alert('Policy created successfully!');
          this.closeRenewalModal();
          this.ngOnInit(); // Refresh stats
        },
        error: (err) => alert('Error creating policy: ' + err.message)
      });
    }
  }
  // Edit Mode Logic (Mirrored from MIS Dashboard)
  isEditing: boolean = false;

  toggleEditMode(): void {
    if (this.isEditing) {
      this.isEditing = false;
    } else {
      this.isEditing = true;
    }
  }

  savePolicyChanges(): void {
    if (!this.selectedViewPolicy) return;

    this.apiService.updatePolicy(this.selectedViewPolicy.id, this.selectedViewPolicy).subscribe({
      next: (updatedPolicy) => {
        alert('Policy details updated successfully!');
        this.selectedViewPolicy = updatedPolicy; // Update view
        this.isEditing = false;
        // Refresh lists if needed
        this.refreshTimelineCounts();
        this.loadRenewerRecords();
        if (this.selectedDate) this.onDateChange();
      },
      error: (err) => {
        console.error('Error updating policy:', err);
        alert('Failed to update policy details.');
      }
    });
  }
}

