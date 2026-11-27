import { NotificationService } from '../../services/notification.service';
import { Component, OnInit, ViewChild, ChangeDetectorRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ApiService } from '../../services/api.service';
import { AuthService } from '../../services/auth.service';
import { finalize } from 'rxjs/operators';
import { CustomerListComponent } from '../customer-list/customer-list.component';
import { WorkProgressComponent } from '../work-progress/work-progress.component';
import { TimelineComponent } from '../timeline/timeline.component';
import * as XLSX from 'xlsx';

@Component({
  selector: 'app-admin-dashboard',
  standalone: true,
  imports: [CommonModule, FormsModule, CustomerListComponent, WorkProgressComponent, TimelineComponent],
  template: `
    <div class="admin-container">
      <div class="header-section d-flex justify-content-between align-items-center">
        <div>
          <h2>{{ isPospRole() ? 'POSP Dashboard' : (isRmRole() ? 'RM Dashboard' : 'Administrative Dashboard') }}</h2>
          <p class="text-muted">{{ isPospRole() ? 'View your mapped policies and follow-ups' : (isRmRole() ? 'Manage your relationship data and follow-ups' : 'Real-time insights into system performance and daily administrative tasks') }}</p>
        </div>
        
        <div class="d-flex flex-column align-items-end gap-2">
          <div class="d-flex gap-3 align-items-center">
            <div *ngIf="!isRmRole() && !isPospRole()" class="branch-selector shadow-sm">
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
            <button *ngIf="!isRmRole() && !isPospRole()" class="btn btn-outline-secondary btn-branch shadow-sm px-3" (click)="openBranchModal()">
              <i class="bi bi-diagram-3-fill me-2 text-primary"></i> Manage
            </button>
            <button class="btn btn-primary shadow-sm px-4" (click)="openRenewalModal()">
              <i class="bi bi-plus-circle me-2"></i> Add / Edit Policy
            </button>
          </div>
          <div class="d-flex gap-2 justify-content-end w-100 mt-2">
            <button class="btn btn-dark btn-sm shadow-sm px-3 fw-semibold d-flex align-items-center" *ngIf="!isRmRole() && !isPospRole()" (click)="openRenewerStatsModal()" title="View Renewer Activity">
              <i class="bi bi-bar-chart-fill me-2 fs-6 text-info"></i> Renewer Activity
            </button>
            <button *ngIf="!isRmRole() && !isPospRole()" class="btn btn-success btn-sm shadow-sm" (click)="exportTodaysReport()" title="Export Today's Updates">
              <i class="bi bi-file-earmark-excel me-1"></i> Download Today's Report
            </button>
            <div *ngIf="!isRmRole() && !isPospRole()" class="input-group input-group-sm shadow-sm ms-2" style="width: 250px;">
              <input type="month" class="form-control border-success text-success fw-bold" [(ngModel)]="selectedMonthForReport" title="Select Month for Report">
              <button class="btn btn-success" (click)="exportMonthlyReport()" title="Export Monthly Activity">
                <i class="bi bi-file-earmark-excel me-1"></i> Monthly Report
              </button>
            </div>
          </div>
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

      <app-work-progress *ngIf="selectedDay === 'todays-work'" [branch]="selectedAdminBranch"></app-work-progress>

      <div class="mt-4 mb-3">
        <app-timeline [counts]="timelineCounts" [adminMode]="true" [userRole]="isPospRole() ? 'POSP' : (isRmRole() ? 'RM' : 'ADMIN')" (daySelected)="onDaySelected($event)"></app-timeline>
      </div>

      <!-- Date Picker Section -->
      <div class="date-view-card mt-5">
        <div class="card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
          <h3 class="mb-0 text-nowrap">📅 Daily Records View</h3>
          <div class="date-picker-wrapper d-flex gap-2 align-items-center flex-nowrap">
            <!-- POSP Filter Dropdown: Only shown for RM / Sales / Admin role -->
            <div class="posp-filter-group" *ngIf="isRmRole() || isAdmin()" style="width: 210px; min-width: 180px;">
              <div class="input-group flex-nowrap shadow-sm">
                <span class="input-group-text bg-light border-secondary-subtle text-primary fw-bold px-2" style="font-size: 0.82rem; height: 38px;">
                  <i class="bi bi-person-vcard-fill me-1"></i> POSP
                </span>
                <select class="form-select border-secondary-subtle fw-semibold px-2" 
                        [(ngModel)]="selectedPospFilter" 
                        (change)="onPospFilterChange()" 
                        style="cursor: pointer; font-size: 0.88rem; height: 38px;">
                  <option value="">-- All POSP --</option>
                  <option *ngFor="let posp of availablePospNames" [value]="posp">{{ posp }}</option>
                </select>
                <button class="btn btn-outline-secondary border-secondary-subtle px-2" type="button" *ngIf="selectedPospFilter" (click)="clearPospFilter()" title="Clear POSP Filter" style="height: 38px;">
                  <i class="bi bi-x-lg"></i>
                </button>
              </div>
            </div>

            <div class="search-group">
                <div class="input-group flex-nowrap shadow-sm">
                    <input type="text" class="form-control border-secondary-subtle" placeholder="Search Policy #, Cust Code or Name" 
                           [(ngModel)]="adminSearchTerm" (keyup.enter)="searchAdminDailyRecords()">
                    <button class="btn btn-outline-primary border-secondary-subtle px-2" type="button" (click)="searchAdminDailyRecords()" title="Search">
                        <i class="bi bi-search"></i>
                    </button>
                    <button class="btn btn-outline-secondary border-secondary-subtle px-2" type="button" *ngIf="adminSearchTerm" (click)="clearSearch()" title="Clear">
                        <i class="bi bi-x-lg"></i>
                    </button>
                </div>
            </div>
            <input type="date" [(ngModel)]="selectedDate" (change)="onDateChange()" class="form-control date-input shadow-sm">
          </div>
        </div>

        <div class="card-body">
          <div *ngIf="!selectedDate && !isSearchMode && !isPospFilterActive && selectedDay !== 'todays-work' && selectedDay !== 600" class="text-center py-5">
            <i class="bi bi-calendar-date display-4 text-muted mb-3"></i>
            <p class="text-muted lead">Please select a date or POSP to view scheduled tasks and expiring policies.</p>
          </div>

          <div *ngIf="(selectedDate || isSearchMode || isPospFilterActive || selectedDay === 'todays-work' || selectedDay === 600) && loading" class="text-center py-5">
            <div class="spinner-border text-primary" role="status">
              <span class="visually-hidden">Loading...</span>
            </div>
          </div>

          <div *ngIf="(selectedDate || isSearchMode || isPospFilterActive || selectedDay === 'todays-work' || selectedDay === 600) && !loading" class="records-content">
            <!-- Expiring Policies -->
            <div class="record-section">
              <div class="d-flex justify-content-between align-items-start flex-wrap gap-3 mb-4">
                <div class="d-flex flex-column gap-2">
                  <h4 class="section-header text-primary mb-0">
                    <span *ngIf="isPospFilterActive">All Policies for POSP: "{{ selectedPospFilter }}"</span>
                    <span *ngIf="!isPospFilterActive && !isSearchMode && selectedDay !== 'todays-work' && selectedDay !== 600">Policies Expiring on {{ selectedDate | date:'mediumDate' }}</span>
                    <span *ngIf="selectedDay === 600">All Policies in Next 60 Days</span>
                    <span *ngIf="isSearchMode">Search Results for "{{ adminSearchTerm }}"</span>
                    <span *ngIf="selectedDay === 'todays-work' && todaysWorkTab === 'expiring'">Today's Work <span class="badge bg-primary ms-2 fs-6 fw-normal">Calls To be made Today: {{ todaysExpiring.length }}</span></span>
                    <span *ngIf="selectedDay === 'todays-work' && todaysWorkTab === 'followups'" class="text-warning">Today's Follow-ups <span class="badge bg-warning text-dark ms-2 fs-6 fw-normal">Total: {{ todaysFollowUps.length }}</span></span>
                    <span *ngIf="selectedDay !== 'todays-work'" class="badge bg-primary">{{ selectedDateRecords.expiringPolicies.length }}</span>
                  </h4>

                  <div *ngIf="selectedDay === 'todays-work'" class="d-flex gap-2">
                    <button class="btn shadow-sm" [ngClass]="todaysWorkTab === 'expiring' ? 'btn-primary' : 'btn-outline-primary bg-white'" (click)="setAdminTodaysWorkTab('expiring')">
                       Expiring Policies <span class="badge ms-1" [ngClass]="todaysWorkTab === 'expiring' ? 'bg-white text-primary' : 'bg-light text-primary'">{{ todaysExpiring.length }}</span>
                    </button>
                    <button class="btn shadow-sm" [ngClass]="todaysWorkTab === 'followups' ? 'btn-warning text-dark' : 'btn-outline-warning text-dark bg-white'" (click)="setAdminTodaysWorkTab('followups')">
                       Today's Follow-ups <span class="badge ms-1" [ngClass]="todaysWorkTab === 'followups' ? 'bg-white text-dark' : 'bg-warning text-dark'">{{ todaysFollowUps.length }}</span>
                    </button>
                    <button class="btn shadow-sm" [ngClass]="todaysWorkTab === 'updated' ? 'btn-success' : 'btn-outline-success bg-white'" (click)="setAdminTodaysWorkTab('updated')">
                       Updated Today <span class="badge ms-1" [ngClass]="todaysWorkTab === 'updated' ? 'bg-white text-success' : 'bg-success'">{{ todaysUpdated.length }}</span>
                    </button>
                  </div>
                </div>
                <!-- Filters Container -->
                <div class="d-flex flex-column align-items-end gap-2 ms-auto">
                  <div class="d-flex align-items-center justify-content-end flex-wrap gap-2">
                    <!-- Day Match Filter (Only for 60 Days View) -->
                    <div class="input-group shadow-sm" style="width: 140px;" *ngIf="selectedDay === 600">
                      <span class="input-group-text bg-white border-secondary-subtle text-muted fw-bold">Day</span>
                      <input type="number" class="form-control border-secondary-subtle text-center" 
                             placeholder="e.g. 1" [(ngModel)]="dayFilter" (input)="applyDayFilter()" min="0" max="60">
                    </div>

                    <!-- Renewer Filter -->
                    <div class="d-flex align-items-center bg-white border rounded shadow-sm overflow-hidden" *ngIf="selectedDay === 'todays-work'" style="width: 180px;">
                      <span class="px-3 py-2 text-muted small fw-bold bg-light border-end d-flex align-items-center h-100">
                        <i class="bi bi-person-badge-fill me-1"></i> Renewer
                      </span>
                      <select class="form-select border-0 shadow-none text-secondary fw-bold rounded-0 bg-white px-2" [(ngModel)]="selectedRenewerFilter" (change)="applyPremiumFilter()" style="cursor: pointer; outline: none; box-shadow: none;">
                        <option value="all">All</option>
                        <option *ngFor="let renewer of availableRenewers" [value]="renewer.username">{{ renewer.username }}</option>
                      </select>
                    </div>
                    

                    <!-- Type Filter -->
                    <div class="d-flex align-items-center bg-white border rounded shadow-sm overflow-hidden" style="width: 200px;">
                      <span class="px-3 py-2 text-muted small fw-bold bg-light border-end d-flex align-items-center h-100">
                        <i class="bi bi-tags-fill me-1"></i> Type
                      </span>
                      <select class="form-select border-0 shadow-none text-secondary fw-bold rounded-0 bg-white px-2" [(ngModel)]="selectedPolicyType" (change)="applyPremiumFilter()" style="cursor: pointer; outline: none; box-shadow: none;">
                        <option value="all">All Types</option>
                        <option *ngFor="let t of availablePolicyTypes" [value]="t">{{ t }}</option>
                      </select>
                    </div>
                  </div>

                <div class="d-flex align-items-center justify-content-end flex-wrap gap-2">
                  <!-- RM Filter -->
                  <div class="d-flex align-items-center bg-white border rounded shadow-sm overflow-hidden" *ngIf="selectedDay === 'todays-work'" style="width: 180px;">
                    <span class="px-3 py-2 text-muted small fw-bold bg-light border-end d-flex align-items-center h-100">
                      <i class="bi bi-briefcase-fill me-1"></i> RM
                    </span>
                    <select class="form-select border-0 shadow-none text-secondary fw-bold rounded-0 bg-white px-2" [(ngModel)]="selectedRmFilter" (change)="applyPremiumFilter()" style="cursor: pointer; outline: none; box-shadow: none;">
                      <option value="all">All RMs</option>
                      <option *ngFor="let rm of availableRmNames" [value]="rm">{{ rm }}</option>
                    </select>
                  </div>
                  
                  <div class="d-flex align-items-center bg-white border rounded shadow-sm overflow-hidden">
                    <span class="px-3 py-2 text-muted small fw-bold bg-light border-end d-flex align-items-center h-100">
                      <i class="bi bi-funnel-fill me-1"></i> Premium
                    </span>
                    <div class="btn-group h-100" role="group">
                      <button class="btn btn-sm rounded-0 border-0 py-2 px-2 fw-bold" [ngClass]="selectedPremiumRange === 'all' ? 'btn-dark text-white' : 'btn-white text-secondary'" (click)="setPremiumRange('all')">All</button>
                      <button class="btn btn-sm rounded-0 border-0 border-start py-2 px-2 fw-bold" [ngClass]="selectedPremiumRange === '0-1' ? 'btn-dark text-white' : 'btn-white text-secondary'" (click)="setPremiumRange('0-1')">0-1L</button>
                      <button class="btn btn-sm rounded-0 border-0 border-start py-2 px-2 fw-bold" [ngClass]="selectedPremiumRange === '1-3' ? 'btn-dark text-white' : 'btn-white text-secondary'" (click)="setPremiumRange('1-3')">1L-3L</button>
                      <button class="btn btn-sm rounded-0 border-0 border-start py-2 px-2 fw-bold" [ngClass]="selectedPremiumRange === '3-5' ? 'btn-dark text-white' : 'btn-white text-secondary'" (click)="setPremiumRange('3-5')">3L-5L</button>
                      <button class="btn btn-sm rounded-0 border-0 border-start py-2 px-2 fw-bold" [ngClass]="selectedPremiumRange === '5+' ? 'btn-dark text-white' : 'btn-white text-secondary'" (click)="setPremiumRange('5+')">>&nbsp;5L</button>
                    </div>
                  </div>
                </div>
                </div>
              </div>
              
              <app-customer-list [policies]="selectedDateRecords.expiringPolicies" [loading]="false" [isAdmin]="isAdmin()" (dataUpdated)="onDataUpdated()"></app-customer-list>
            </div>
            
            <hr class="divider">

            <!-- Scheduled Follow-ups (Hide in Search Mode or Todays Work mode or POSP Filter mode) -->
            <div class="record-section" *ngIf="(!isSearchMode && !isPospFilterActive && selectedDay !== 'todays-work') && selectedDateRecords.scheduledFollowUps.length > 0">
              <h4 class="section-header text-warning">
                <span *ngIf="selectedDay !== 600">Follow-ups Scheduled for {{ selectedDate | date:'mediumDate' }}</span>
                <span *ngIf="selectedDay === 600">All Scheduled Follow-ups in Next 60 Days</span>
                <span class="badge bg-warning">{{ selectedDateRecords.scheduledFollowUps.length }}</span>
              </h4>
              <app-customer-list [policies]="selectedDateRecords.scheduledFollowUps" [loading]="false" [isAdmin]="isAdmin()" (dataUpdated)="onDataUpdated()"></app-customer-list>
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
                  <th style="width: 10%">Cust Code</th>
                  <th style="width: 10%">Policy #</th>
                  <th style="width: 14%">Customer</th>
                  <th style="width: 10%">Expiry Date</th>
                  <th style="width: 9%">Renewer</th>
                  <th style="width: 11%">Call Outcome</th>
                  <th style="width: 29%">Notes</th>
                  <th style="width: 10%">Last Updated</th>
                  <th style="width: 7%">Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr *ngFor="let record of filteredRecords">
                  <td>
                    <span class="fw-bold text-dark" style="font-size: 0.88rem; letter-spacing: 0.2px;">
                      {{ record.customerCode || record.customer?.customerCode || '-' }}
                    </span>
                  </td>
                  <td class="fw-bold">{{ record.policyNumber }}</td>
                  <td>
                    <div class="fw-bold">{{ record.customer?.firstName }} {{ record.customer?.lastName }}</div>
                    <small class="text-muted">{{ record.customer?.phone }}</small>
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
                <div class="col-12 d-flex justify-content-between align-items-center border-bottom pb-2">
                    <h5 class="mb-0">Policy & Customer Details</h5>
                    <span *ngIf="selectedViewPolicy.customerCode || selectedViewPolicy.customer?.customerCode" 
                          class="badge bg-light text-dark border px-2 py-1 fw-bold" 
                          style="font-size: 0.84rem; background-color: #f8fafc !important; border-color: #cbd5e1 !important; color: #1e293b !important; letter-spacing: 0.3px;">
                        {{ selectedViewPolicy.customerCode || selectedViewPolicy.customer?.customerCode }}
                    </span>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Customer Name</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.customer?.firstName }} {{ selectedViewPolicy.customer?.lastName }}</div>
                    <div *ngIf="isEditing" class="d-flex gap-1">
                        <input type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.customer.firstName" placeholder="First Name">
                        <input type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.customer.lastName" placeholder="Last Name">
                    </div>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Gender</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.customer?.gender || '-' }}</div>
                    <select *ngIf="isEditing" class="form-select form-select-sm" [(ngModel)]="selectedViewPolicy.customer.gender">
                        <option value="">Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Contact</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.customer?.phone || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.customer.phone">
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Email ID</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.customer?.email || '-' }}</div>
                    <input *ngIf="isEditing" type="email" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.customer.email">
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Policy Number</label>
                    <div *ngIf="!isEditing" class="fw-bold">{{ selectedViewPolicy.policyNumber }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.policyNumber">
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Application no. / Customer ID</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.applicationNumber || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.applicationNumber" placeholder="Application no. / Cust ID">
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Insurance Type</label>
                    <div *ngIf="!isEditing"><span class="badge bg-primary-subtle text-primary border border-primary-subtle">{{ selectedViewPolicy.type || '-' }}</span></div>
                    <select *ngIf="isEditing" class="form-select form-select-sm" [(ngModel)]="selectedViewPolicy.type">
                        <option value="Health">Health</option>
                        <option value="Life">Life</option>
                        <option value="Motor">Motor</option>
                        <option value="Commercial">Commercial</option>
                        <option value="GMC">GMC</option>
                        <option value="GPA">GPA</option>
                        <option value="GTL">GTL</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Insurer Name</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.insuranceName || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.insuranceName">
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Product Name</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.productName || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.productName">
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Policy Issue Date</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.policyIssueDate | date:'mediumDate' }}</div>
                    <input *ngIf="isEditing" type="date" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.policyIssueDate">
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Policy Start Date</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.policyStartDate | date:'mediumDate' }}</div>
                    <input *ngIf="isEditing" type="date" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.policyStartDate">
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Expiry Date</label>
                    <div *ngIf="!isEditing">{{ (selectedViewPolicy.policyEndDate || selectedViewPolicy.expiryDate) | date:'mediumDate' }}</div>
                    <input *ngIf="isEditing" type="date" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.policyEndDate">
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Premium (Due)</label>
                    <div *ngIf="!isEditing" class="text-success fw-bold">{{ selectedViewPolicy.duePremium ? (selectedViewPolicy.duePremium | currency:'INR') : '-' }}</div>
                    <input *ngIf="isEditing" type="number" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.duePremium">
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Total Amount</label>
                    <div *ngIf="!isEditing" class="fw-bold">{{ selectedViewPolicy.amount ? (selectedViewPolicy.amount | currency:'INR') : '-' }}</div>
                    <input *ngIf="isEditing" type="number" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.amount">
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Sum Assured / Insured</label>
                    <div *ngIf="!isEditing" class="text-primary fw-semibold">{{ selectedViewPolicy.sumInsured ? (selectedViewPolicy.sumInsured | currency:'INR') : '-' }}</div>
                    <input *ngIf="isEditing" type="number" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.sumInsured">
                </div>

                <!-- Customer MIS Fields -->
                <div class="col-12"><hr class="my-1 text-muted opacity-25"></div>

                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Date of Birth</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.customer?.dob | date:'mediumDate' }}</div>
                    <input *ngIf="isEditing" type="date" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.customer.dob">
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Billing Freq.</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.customer?.billingFrequency || '-' }}</div>
                    <select *ngIf="isEditing" class="form-select form-select-sm" [(ngModel)]="selectedViewPolicy.customer.billingFrequency">
                        <option value="Monthly">Monthly</option>
                        <option value="Quarterly">Quarterly</option>
                        <option value="Half-Yearly">Half-Yearly</option>
                        <option value="Yearly">Yearly</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">PAN Number</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.customer?.panNumber || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm text-uppercase" [(ngModel)]="selectedViewPolicy.customer.panNumber">
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">GST Number</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.customer?.gstNumber || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm text-uppercase" [(ngModel)]="selectedViewPolicy.customer.gstNumber">
                </div>
                <div class="col-12">
                    <label class="fw-bold text-muted small">Address Details</label>
                    <div *ngIf="!isEditing">
                        <div>{{ selectedViewPolicy.customer?.address || '-' }}</div>
                        <div class="text-muted small" *ngIf="selectedViewPolicy.customer?.city || selectedViewPolicy.customer?.state || selectedViewPolicy.customer?.pincode">
                            {{ selectedViewPolicy.customer?.city }}{{ selectedViewPolicy.customer?.state ? ', ' + selectedViewPolicy.customer?.state : '' }}{{ selectedViewPolicy.customer?.pincode ? ' - ' + selectedViewPolicy.customer?.pincode : '' }}
                        </div>
                    </div>
                    <div *ngIf="isEditing" class="row g-2">
                        <div class="col-12">
                            <textarea class="form-control form-control-sm" rows="2" [(ngModel)]="selectedViewPolicy.customer.address" placeholder="Full Address"></textarea>
                        </div>
                        <div class="col-4">
                            <input type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.customer.city" placeholder="City">
                        </div>
                        <div class="col-4">
                            <input type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.customer.state" placeholder="State">
                        </div>
                        <div class="col-4">
                            <input type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.customer.pincode" placeholder="Pin Code">
                        </div>
                    </div>
                </div>

                <!-- Team Details -->
                <div class="col-12 mt-2">
                    <h6 class="border-bottom pb-1 text-primary fw-bold"><i class="bi bi-people-fill me-1"></i> Team & Sales Details</h6>
                </div>
                <div class="col-md-4">
                    <label class="fw-bold text-muted small">RM Name</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.rmName || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.rmName">
                </div>
                <div class="col-md-4">
                    <label class="fw-bold text-muted small">Associate Name</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.associateName || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.associateName">
                </div>
                <div class="col-md-4">
                    <label class="fw-bold text-muted small">POSP Name</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.pospName || selectedViewPolicy.associateName || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.pospName">
                </div>

                <!-- Motor Asset Details Section (if motor) -->
                <div class="col-12 mt-2" *ngIf="isMotorPolicy(selectedViewPolicy)">
                    <h6 class="border-bottom pb-1 text-primary fw-bold"><i class="bi bi-car-front-fill me-1"></i> Asset Details (Motor)</h6>
                </div>
                <div class="col-md-4" *ngIf="isMotorPolicy(selectedViewPolicy)">
                    <label class="fw-bold text-muted small">Car / Reg No</label>
                    <div *ngIf="!isEditing" class="fw-bold">{{ selectedViewPolicy.vehicleRegNo || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.vehicleRegNo">
                </div>
                <div class="col-md-4" *ngIf="isMotorPolicy(selectedViewPolicy)">
                    <label class="fw-bold text-muted small">Model Name</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.vehicleModel || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.vehicleModel">
                </div>
                <div class="col-md-4" *ngIf="isMotorPolicy(selectedViewPolicy)">
                    <label class="fw-bold text-muted small">Mfg Year</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.mfgYear || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.mfgYear">
                </div>
                <div class="col-md-4" *ngIf="isMotorPolicy(selectedViewPolicy)">
                    <label class="fw-bold text-muted small">Vehicle Type</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.vehicleType || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.vehicleType">
                </div>
                <div class="col-md-4" *ngIf="isMotorPolicy(selectedViewPolicy)">
                    <label class="fw-bold text-muted small">IDV</label>
                    <div *ngIf="!isEditing" class="fw-semibold">{{ selectedViewPolicy.idv ? (selectedViewPolicy.idv | currency:'INR') : '-' }}</div>
                    <input *ngIf="isEditing" type="number" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.idv">
                </div>
                <div class="col-md-4" *ngIf="isMotorPolicy(selectedViewPolicy)">
                    <label class="fw-bold text-muted small">OD Amount</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.odAmount ? (selectedViewPolicy.odAmount | currency:'INR') : '-' }}</div>
                    <input *ngIf="isEditing" type="number" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.odAmount">
                </div>
                <div class="col-md-4" *ngIf="isMotorPolicy(selectedViewPolicy)">
                    <label class="fw-bold text-muted small">TP Amount</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.tpAmount ? (selectedViewPolicy.tpAmount | currency:'INR') : '-' }}</div>
                    <input *ngIf="isEditing" type="number" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.tpAmount">
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
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.paymentMode || '-' }}</div>
                    <select *ngIf="isEditing" class="form-select form-select-sm" [(ngModel)]="selectedViewPolicy.paymentMode">
                        <option value="">Select Mode</option>
                        <option value="Online">Online</option>
                        <option value="Cheque">Cheque</option>
                        <option value="DD">DD</option>
                        <option value="Cash">Cash</option>
                        <option value="NEFT">NEFT</option>
                        <option value="RTGS">RTGS</option>
                        <option value="UPI">UPI</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Payment Date</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.paymentDate | date:'mediumDate' }}</div>
                    <input *ngIf="isEditing" type="date" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.paymentDate">
                </div>
                <div class="col-md-6">
                    <label class="fw-bold text-muted small">Bank Name</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.paymentBank || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.paymentBank">
                </div>
                 <div class="col-md-6">
                    <label class="fw-bold text-muted small">Ref / Cheque / DD No</label>
                    <div *ngIf="!isEditing">{{ selectedViewPolicy.paymentReference || '-' }}</div>
                    <input *ngIf="isEditing" type="text" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.paymentReference">
                </div>
                 <div class="col-md-6">
                    <label class="fw-bold text-muted small">Payment Amount</label>
                    <div *ngIf="!isEditing" class="text-success fw-bold">{{ (selectedViewPolicy.paymentAmount || selectedViewPolicy.amount) | currency:'INR' }}</div>
                    <input *ngIf="isEditing" type="number" class="form-control form-control-sm" [(ngModel)]="selectedViewPolicy.paymentAmount">
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
      <!-- Renewal Modal with Multi-Step Flow -->
      <div class="modal-overlay" *ngIf="showRenewalModal" (click)="closeRenewalModal()">
        <div class="custom-modal-content renewal-modal" style="max-width: 960px; width: 95%; max-height: 90vh;" (click)="$event.stopPropagation()">
          <div class="modal-header d-flex justify-content-between align-items-center py-3 px-4 border-bottom bg-light">
            <div class="d-flex align-items-center gap-2">
              <span class="badge bg-primary bg-opacity-10 text-primary p-2 rounded-circle">
                <i class="bi bi-file-earmark-plus-fill fs-5"></i>
              </span>
              <div>
                <h4 class="mb-0 fw-bold text-dark">{{ selectedRenewalPolicy ? 'Edit Policy Details' : 'Add / Edit Policy' }}</h4>
                <small class="text-muted" *ngIf="!selectedRenewalPolicy">
                  <span *ngIf="renewalModalStep === 'section'">Step 1: Choose Policy Category</span>
                  <span *ngIf="renewalModalStep === 'renewal-search'">Step 2: Search & Select Customer</span>
                  <span *ngIf="renewalModalStep === 'type'">Step {{ selectedSection === 'Renewal' ? '3' : '2' }}: Choose Insurance Type</span>
                  <span *ngIf="renewalModalStep === 'form'">Step {{ selectedSection === 'Renewal' ? '4' : '3' }}: Fill Policy & Customer Details</span>
                </small>
                <small class="text-muted" *ngIf="selectedRenewalPolicy">
                  Policy #: <strong>{{ selectedRenewalPolicy.policyNumber }}</strong> | Type: <strong>{{ selectedInsuranceType }}</strong>
                </small>
              </div>
            </div>
            <button class="btn-close" (click)="closeRenewalModal()"></button>
          </div>

          <div class="modal-body p-4" style="overflow-y: auto;">

            <!-- STEP 1: SECTION SELECTION (Fresh, Renewal, Endorsement) -->
            <div *ngIf="renewalModalStep === 'section' && !selectedRenewalPolicy">
              <div class="text-center mb-4">
                <h5 class="fw-bold text-dark mb-1">Select Policy Category</h5>
                <p class="text-muted small">Please choose the category of policy you wish to record</p>
              </div>

              <!-- 3 Section Cards -->
              <div class="row g-3 justify-content-center mb-3">
                <!-- Fresh -->
                <div class="col-md-4">
                  <div class="card h-100 border text-center p-3 section-card shadow-sm cursor-pointer" 
                       [class.border-primary]="selectedSection === 'Fresh'"
                       (click)="selectSection('Fresh')">
                    <div class="section-icon-wrapper bg-primary bg-opacity-10 text-primary mx-auto mb-3">
                      <i class="bi bi-file-earmark-plus-fill fs-2"></i>
                    </div>
                    <h5 class="fw-bold mb-1 text-dark">Fresh</h5>
                    <span class="badge bg-success bg-opacity-10 text-success mb-2">New Entry</span>
                    <p class="text-muted small mb-0">Policy not currently in the system. Create fresh customer and policy record.</p>
                  </div>
                </div>

                <!-- Renewal -->
                <div class="col-md-4">
                  <div class="card h-100 border text-center p-3 section-card shadow-sm cursor-pointer"
                       [class.border-success]="selectedSection === 'Renewal'"
                       (click)="selectSection('Renewal')">
                    <div class="section-icon-wrapper bg-success bg-opacity-10 text-success mx-auto mb-3">
                      <i class="bi bi-arrow-repeat fs-2"></i>
                    </div>
                    <h5 class="fw-bold mb-1 text-dark">Renewal</h5>
                    <span class="badge bg-primary bg-opacity-10 text-primary mb-2">Existing Customer</span>
                    <p class="text-muted small mb-0">Find existing customer by code, name, or policy #, view all policies, and add renewal.</p>
                  </div>
                </div>

                <!-- Endorsement -->
                <div class="col-md-4">
                  <div class="card h-100 border text-center p-3 section-card shadow-sm cursor-pointer"
                       [class.border-warning]="selectedSection === 'Endorsement'"
                       (click)="selectSection('Endorsement')">
                    <div class="section-icon-wrapper bg-warning bg-opacity-10 text-warning mx-auto mb-3">
                      <i class="bi bi-pencil-square fs-2"></i>
                    </div>
                    <h5 class="fw-bold mb-1 text-dark">Endorsement</h5>
                    <span class="badge bg-warning bg-opacity-10 text-dark mb-2">Policy Alteration</span>
                    <p class="text-muted small mb-0">Record policy endorsement, premium change, or nominee alterations.</p>
                  </div>
                </div>
              </div>

              <!-- Notice for Endorsement -->
              <div *ngIf="selectedSection === 'Endorsement'" class="alert alert-warning border-0 shadow-sm d-flex align-items-center justify-content-between p-3 mt-3">
                <div class="d-flex align-items-center gap-3">
                  <i class="bi bi-info-circle-fill fs-4 text-warning"></i>
                  <div>
                    <strong class="d-block text-dark">Endorsement Section</strong>
                    <span class="small text-muted">Endorsement alteration workflow is coming soon. Please select <strong>Fresh</strong> or <strong>Renewal</strong> to continue.</span>
                  </div>
                </div>
                <div class="d-flex gap-2">
                  <button class="btn btn-sm btn-primary text-nowrap" (click)="selectSection('Fresh')">
                    Fresh Entry
                  </button>
                  <button class="btn btn-sm btn-success text-nowrap" (click)="selectSection('Renewal')">
                    Renewal Entry
                  </button>
                </div>
              </div>
            </div>

            <!-- STEP: RENEWAL CUSTOMER SEARCH -->
            <div *ngIf="renewalModalStep === 'renewal-search' && !selectedRenewalPolicy">
              <div class="d-flex justify-content-between align-items-center mb-3">
                <div>
                  <h5 class="fw-bold text-dark mb-1"><i class="bi bi-search text-primary me-2"></i>Find Customer for Renewal</h5>
                  <p class="text-muted small mb-0">Search by <strong>Policy Number</strong>, <strong>Customer Name</strong>, or <strong>Customer Code</strong></p>
                </div>
                <button class="btn btn-sm btn-outline-secondary" (click)="renewalModalStep = 'section'; selectedSection = null;">
                  <i class="bi bi-arrow-left me-1"></i> Change Category
                </button>
              </div>

              <!-- Search Bar -->
              <div class="card border-0 bg-light p-3 mb-3 shadow-sm rounded-3">
                <div class="input-group">
                  <span class="input-group-text bg-white border-end-0">
                    <i class="bi bi-search text-primary"></i>
                  </span>
                  <input type="text" 
                         class="form-control border-start-0 ps-0" 
                         placeholder="Enter Policy Number, Customer Name, or Customer Code (e.g. SIIBPL12529)..." 
                         [(ngModel)]="renewalSearchQuery" 
                         (keyup.enter)="searchRenewalCustomer()" 
                         autofocus>
                  <button class="btn btn-outline-secondary" type="button" *ngIf="renewalSearchQuery" (click)="clearRenewalSearch()">
                    <i class="bi bi-x-lg"></i> Clear
                  </button>
                  <button class="btn btn-primary px-4 fw-semibold" type="button" (click)="searchRenewalCustomer()" [disabled]="searchingCustomers || !renewalSearchQuery.trim()">
                    <span *ngIf="searchingCustomers" class="spinner-border spinner-border-sm me-1"></span>
                    <i *ngIf="!searchingCustomers" class="bi bi-search me-1"></i> Search
                  </button>
                </div>
                <div class="d-flex align-items-center justify-content-between mt-2 px-1">
                  <small class="text-muted">
                    <i class="bi bi-info-circle me-1"></i> Code & Policy No. find the exact customer; Name search shows all matching customers.
                  </small>
                  <small class="text-muted" *ngIf="hasSearchedCustomer && renewalSearchResults.length > 0">
                    Found <strong>{{ renewalSearchResults.length }}</strong> matching customer(s)
                  </small>
                </div>
              </div>

              <!-- Loading Indicator -->
              <div *ngIf="searchingCustomers" class="text-center py-5">
                <div class="spinner-border text-primary mb-2" role="status"></div>
                <div class="text-muted small">Searching customers & existing policies...</div>
              </div>

              <!-- No Results Message -->
              <div *ngIf="hasSearchedCustomer && !searchingCustomers && renewalSearchResults.length === 0" class="alert alert-warning border-0 shadow-sm text-center py-4 my-3">
                <i class="bi bi-exclamation-triangle-fill fs-3 text-warning d-block mb-2"></i>
                <h6 class="fw-bold mb-1">No Customers Found</h6>
                <p class="text-muted small mb-3">No matching record found for "<strong>{{ renewalSearchQuery }}</strong>". Please check your query or create as Fresh.</p>
                <button class="btn btn-sm btn-outline-primary" (click)="selectSection('Fresh')">
                  <i class="bi bi-file-earmark-plus me-1"></i> Add as Fresh Policy
                </button>
              </div>

              <!-- Matching Customers List -->
              <div *ngIf="!searchingCustomers && renewalSearchResults.length > 0" class="mb-3">
                <label class="form-label small fw-bold text-dark text-uppercase tracking-wider mb-2">
                  Matching Customers ({{ renewalSearchResults.length }}) — Click to Select
                </label>
                <div class="list-group shadow-sm mb-3" style="max-height: 220px; overflow-y: auto;">
                  <button type="button" 
                          *ngFor="let cust of renewalSearchResults"
                          class="list-group-item list-group-item-action d-flex justify-content-between align-items-center p-3"
                          [class.active]="selectedRenewalCustomer?.id === cust.id"
                          [class.bg-primary-subtle]="selectedRenewalCustomer?.id === cust.id"
                          [class.border-primary]="selectedRenewalCustomer?.id === cust.id"
                          (click)="selectCustomerForRenewal(cust)">
                    <div>
                      <div class="d-flex align-items-center gap-2 mb-1">
                        <span class="badge" [ngClass]="selectedRenewalCustomer?.id === cust.id ? 'bg-primary text-white' : 'bg-dark text-white'">
                          {{ cust.customerCode }}
                        </span>
                        <strong class="text-dark fs-6">{{ cust.fullName }}</strong>
                        <span *ngIf="selectedRenewalCustomer?.id === cust.id" class="badge bg-success">
                          <i class="bi bi-check-circle-fill me-1"></i> Selected
                        </span>
                      </div>
                      <div class="small text-muted d-flex flex-wrap gap-3">
                        <span *ngIf="cust.phone"><i class="bi bi-telephone me-1"></i>{{ cust.phone }}</span>
                        <span *ngIf="cust.email"><i class="bi bi-envelope me-1"></i>{{ cust.email }}</span>
                        <span *ngIf="cust.city"><i class="bi bi-geo-alt me-1"></i>{{ cust.city }}<span *ngIf="cust.state">, {{ cust.state }}</span></span>
                      </div>
                    </div>
                    <div class="text-end">
                      <span class="badge bg-light text-dark border px-2 py-1 mb-1 d-inline-block">
                        <i class="bi bi-shield-check me-1 text-primary"></i>{{ cust.policyCount }} Policies
                      </span>
                      <div class="small text-primary fw-semibold" *ngIf="selectedRenewalCustomer?.id !== cust.id">
                        Select <i class="bi bi-chevron-right ms-1"></i>
                      </div>
                    </div>
                  </button>
                </div>
              </div>

              <!-- Selected Customer Details & Policies Table -->
              <div *ngIf="selectedRenewalCustomer" class="card border-primary border-opacity-25 shadow-sm rounded-3 mb-3">
                <div class="card-header bg-primary bg-opacity-10 d-flex justify-content-between align-items-center py-2 px-3">
                  <div class="d-flex align-items-center gap-2">
                    <span class="badge bg-dark fw-bold">{{ selectedRenewalCustomer.customerCode }}</span>
                    <strong class="text-dark">{{ selectedRenewalCustomer.fullName }}</strong>
                    <span class="badge bg-primary rounded-pill">{{ selectedRenewalCustomer.policies?.length || 0 }} Total Policies</span>
                  </div>
                  <button class="btn btn-primary btn-sm fw-bold shadow-sm" (click)="proceedToRenewalType()">
                    <i class="bi bi-plus-circle me-1"></i> Add Renewal Policy
                  </button>
                </div>
                <div class="card-body p-0">
                  <div class="table-responsive" style="max-height: 250px;">
                    <table class="table table-hover table-sm align-middle mb-0" style="font-size: 0.85rem;">
                      <thead class="table-light sticky-top">
                        <tr>
                          <th class="ps-3">Policy No.</th>
                          <th>App No / Cust ID</th>
                          <th>Type</th>
                          <th>Insurer</th>
                          <th>Product</th>
                          <th>Expiry Date</th>
                          <th>Premium</th>
                          <th>Status</th>
                          <th class="text-end pe-3">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr *ngFor="let p of selectedRenewalCustomer.policies">
                          <td class="ps-3 fw-bold text-dark">{{ p.policyNumber }}</td>
                          <td><span class="text-muted">{{ p.applicationNumber || '-' }}</span></td>
                          <td><span class="badge bg-primary-subtle text-primary border border-primary-subtle">{{ p.type || '-' }}</span></td>
                          <td>{{ p.insuranceName || '-' }}</td>
                          <td><small class="text-muted">{{ p.productName || '-' }}</small></td>
                          <td class="text-nowrap">{{ (p.expiryDate || p.policyEndDate) | date:'mediumDate' }}</td>
                          <td class="fw-semibold text-dark">₹{{ (p.duePremium || p.amount || 0) | number:'1.2-2' }}</td>
                          <td>
                            <span class="badge" [ngClass]="p.status === 'EXPIRED' ? 'bg-danger' : (p.status === 'RENEWED' ? 'bg-success' : 'bg-info')">
                              {{ p.status || 'ACTIVE' }}
                            </span>
                          </td>
                          <td class="text-end pe-3">
                            <button class="btn btn-xs btn-outline-primary py-0 px-2" (click)="renewSpecificPolicy(p)" title="Renew this policy">
                              <i class="bi bi-arrow-repeat me-1"></i> Renew
                            </button>
                          </td>
                        </tr>
                        <tr *ngIf="!selectedRenewalCustomer.policies || selectedRenewalCustomer.policies.length === 0">
                          <td colspan="9" class="text-center text-muted py-3">No existing policies found for this customer.</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>

            </div>

            <!-- STEP 2 / 3: INSURANCE TYPE SELECTION -->
            <div *ngIf="renewalModalStep === 'type' && !selectedRenewalPolicy">
              <div class="d-flex justify-content-between align-items-center mb-3">
                <div>
                  <h5 class="fw-bold text-dark mb-1">Select Insurance Type</h5>
                  <p class="text-muted small mb-0" *ngIf="selectedSection === 'Renewal' && selectedRenewalCustomer">
                    Renewing for: <strong>{{ selectedRenewalCustomer.fullName }}</strong> ({{ selectedRenewalCustomer.customerCode }})
                  </p>
                  <p class="text-muted small mb-0" *ngIf="selectedSection !== 'Renewal'">
                    Choose insurance type to load the tailored field format
                  </p>
                </div>
                <button class="btn btn-sm btn-outline-secondary" (click)="selectedSection === 'Renewal' ? (renewalModalStep = 'renewal-search') : (renewalModalStep = 'section');">
                  <i class="bi bi-arrow-left me-1"></i> {{ selectedSection === 'Renewal' ? 'Back to Customer Search' : 'Change Category' }}
                </button>
              </div>

              <div class="row g-3">
                <!-- Health -->
                <div class="col-md-4 col-sm-6">
                  <div class="card h-100 type-card p-3 border shadow-sm cursor-pointer" (click)="selectInsuranceType('Health')">
                    <div class="d-flex align-items-center gap-3">
                      <div class="type-icon-box bg-danger bg-opacity-10 text-danger">
                        <i class="bi bi-heart-pulse-fill fs-4"></i>
                      </div>
                      <div>
                        <h6 class="fw-bold mb-0 text-dark">Health Insurance</h6>
                        <span class="text-muted" style="font-size: 0.75rem;">Standard Format</span>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- Life -->
                <div class="col-md-4 col-sm-6">
                  <div class="card h-100 type-card p-3 border shadow-sm cursor-pointer" (click)="selectInsuranceType('Life')">
                    <div class="d-flex align-items-center gap-3">
                      <div class="type-icon-box bg-primary bg-opacity-10 text-primary">
                        <i class="bi bi-shield-fill-check fs-4"></i>
                      </div>
                      <div>
                        <h6 class="fw-bold mb-0 text-dark">Life Insurance</h6>
                        <span class="text-muted" style="font-size: 0.75rem;">Standard Format</span>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- GMC -->
                <div class="col-md-4 col-sm-6">
                  <div class="card h-100 type-card p-3 border shadow-sm cursor-pointer" (click)="selectInsuranceType('GMC')">
                    <div class="d-flex align-items-center gap-3">
                      <div class="type-icon-box bg-info bg-opacity-10 text-info">
                        <i class="bi bi-people-fill fs-4"></i>
                      </div>
                      <div>
                        <h6 class="fw-bold mb-0 text-dark">GMC</h6>
                        <span class="text-muted" style="font-size: 0.75rem;">Group Medical Cover</span>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- GPA -->
                <div class="col-md-4 col-sm-6">
                  <div class="card h-100 type-card p-3 border shadow-sm cursor-pointer" (click)="selectInsuranceType('GPA')">
                    <div class="d-flex align-items-center gap-3">
                      <div class="type-icon-box bg-warning bg-opacity-10 text-warning">
                        <i class="bi bi-bandaid-fill fs-4"></i>
                      </div>
                      <div>
                        <h6 class="fw-bold mb-0 text-dark">GPA</h6>
                        <span class="text-muted" style="font-size: 0.75rem;">Group Personal Accident</span>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- GTL -->
                <div class="col-md-4 col-sm-6">
                  <div class="card h-100 type-card p-3 border shadow-sm cursor-pointer" (click)="selectInsuranceType('GTL')">
                    <div class="d-flex align-items-center gap-3">
                      <div class="type-icon-box bg-secondary bg-opacity-10 text-secondary">
                        <i class="bi bi-file-earmark-person-fill fs-4"></i>
                      </div>
                      <div>
                        <h6 class="fw-bold mb-0 text-dark">GTL</h6>
                        <span class="text-muted" style="font-size: 0.75rem;">Group Term Life</span>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- Motor -->
                <div class="col-md-4 col-sm-6">
                  <div class="card h-100 type-card p-3 border shadow-sm cursor-pointer" (click)="selectInsuranceType('Motor')">
                    <div class="d-flex align-items-center gap-3">
                      <div class="type-icon-box bg-success bg-opacity-10 text-success">
                        <i class="bi bi-car-front-fill fs-4"></i>
                      </div>
                      <div>
                        <h6 class="fw-bold mb-0 text-dark">Motor Insurance</h6>
                        <span class="text-muted" style="font-size: 0.75rem;">OD, TP, IDV, Vehicle Reg</span>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- Commercial -->
                <div class="col-md-4 col-sm-6">
                  <div class="card h-100 type-card p-3 border shadow-sm cursor-pointer" (click)="selectInsuranceType('Commercial')">
                    <div class="d-flex align-items-center gap-3">
                      <div class="type-icon-box bg-dark bg-opacity-10 text-dark">
                        <i class="bi bi-building-fill fs-4"></i>
                      </div>
                      <div>
                        <h6 class="fw-bold mb-0 text-dark">Commercial (all Other)</h6>
                        <span class="text-muted" style="font-size: 0.75rem;">Commercial Format + PAN</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- STEP 3: FORM ENTRY -->
            <div *ngIf="renewalModalStep === 'form'">
              <!-- Breadcrumb Header -->
              <div class="d-flex justify-content-between align-items-center bg-light p-2 px-3 rounded border mb-3">
                <div class="d-flex align-items-center gap-2">
                  <span class="badge bg-primary px-2 py-1">{{ selectedSection || 'Fresh' }}</span>
                  <i class="bi bi-chevron-right text-muted small"></i>
                  <span class="badge bg-dark px-2 py-1">{{ selectedInsuranceType }}</span>
                </div>
                <div class="d-flex gap-2" *ngIf="!selectedRenewalPolicy">
                  <button class="btn btn-sm btn-outline-secondary py-1 px-2" (click)="renewalModalStep = 'type'">
                    <i class="bi bi-arrow-repeat me-1"></i> Change Type
                  </button>
                  <button class="btn btn-sm btn-outline-secondary py-1 px-2" (click)="renewalModalStep = 'section'; selectedSection = null;">
                    <i class="bi bi-grid me-1"></i> Change Category
                  </button>
                </div>
              </div>

              <!-- Search Existing Customer / Policy (Optional) -->
              <div class="form-group mb-3 position-relative" *ngIf="!selectedRenewalPolicy">
                <label class="form-label small fw-semibold text-muted">Search Existing Customer / Policy to Auto-fill (Optional)</label>
                <div class="input-group input-group-sm">
                  <span class="input-group-text bg-white"><i class="bi bi-search text-muted"></i></span>
                  <input type="text" class="form-control" placeholder="Search by customer name, code (SIIBPL...), or policy #..." 
                         [(ngModel)]="renewalSearchTerm" (input)="searchPoliciesForRenewal()">
                </div>
                <div class="search-results" *ngIf="renewalSearchResults.length > 0">
                  <div class="search-item py-2 px-3 border-bottom" *ngFor="let result of renewalSearchResults" (click)="selectPolicyForRenewal(result)">
                    <div class="d-flex justify-content-between">
                      <strong>{{ result.customer?.firstName }} {{ result.customer?.lastName }}</strong>
                      <span class="badge bg-primary">{{ result.customerCode || result.customer?.customerCode }}</span>
                    </div>
                    <small class="d-block text-muted">{{ result.policyNumber }} - {{ result.insuranceName }} ({{ result.type }})</small>
                  </div>
                </div>
              </div>

              <!-- Renewal Customer Locked Banner -->
              <div *ngIf="selectedSection === 'Renewal' && selectedRenewalCustomer" class="alert alert-primary bg-primary bg-opacity-10 border-primary border-opacity-25 d-flex justify-content-between align-items-center p-3 mb-4 rounded-3">
                <div class="d-flex align-items-center gap-3">
                  <div class="bg-primary text-white rounded-circle p-2 d-flex align-items-center justify-content-center" style="width: 40px; height: 40px;">
                    <i class="bi bi-arrow-repeat fs-5"></i>
                  </div>
                  <div>
                    <span class="badge bg-primary text-uppercase me-2">Renewal Policy</span>
                    <strong class="text-dark">{{ selectedRenewalCustomer.fullName }}</strong>
                    <span class="badge bg-dark ms-2">{{ selectedRenewalCustomer.customerCode }}</span>
                    <div class="small text-muted mt-1">Customer code is locked and will be attached to this renewed policy.</div>
                  </div>
                </div>
                <button class="btn btn-sm btn-outline-secondary" (click)="renewalModalStep = 'renewal-search'">
                  <i class="bi bi-arrow-left me-1"></i> Change Customer
                </button>
              </div>

              <!-- ================= FORMAT A: Health, Life, GMC, GPA, GTL ================= -->
              <div class="row g-3" *ngIf="isGeneralFormat()">
                <!-- Customer Details -->
                <div class="col-12"><h6 class="border-bottom pb-1 text-primary fw-bold"><i class="bi bi-person-fill me-1"></i> Customer Details</h6></div>
                
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Customer Code <span *ngIf="selectedSection === 'Renewal'" class="badge bg-secondary-subtle text-secondary ms-1">Auto-Selected</span></label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.customerCode" 
                         [disabled]="selectedSection === 'Renewal'" [readonly]="selectedSection === 'Renewal'"
                         [class.bg-light]="selectedSection === 'Renewal'"
                         placeholder="Auto-generated (e.g. SIIBPL...)">
                </div>
                <div class="col-md-5">
                  <label class="form-label small fw-semibold">Customer Name *</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="customerFullName" (ngModelChange)="onCustomerNameChange($event)" placeholder="Enter full name">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Gender</label>
                  <select class="form-select form-select-sm" [(ngModel)]="renewalForm.customer.gender">
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                  </select>
                </div>

                <div class="col-md-4">
                  <label class="form-label small fw-semibold">DOB</label>
                  <input type="date" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.dob">
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Contact No *</label>
                  <input type="tel" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.phone" placeholder="Mobile / Phone number">
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Email ID *</label>
                  <input type="email" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.email" placeholder="customer@example.com">
                </div>

                <div class="col-md-6">
                  <label class="form-label small fw-semibold">Address</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.address" placeholder="Residential / Office address">
                </div>
                <div class="col-md-2">
                  <label class="form-label small fw-semibold">City</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.city" placeholder="City">
                </div>
                <div class="col-md-2">
                  <label class="form-label small fw-semibold">State</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.state" placeholder="State">
                </div>
                <div class="col-md-2">
                  <label class="form-label small fw-semibold">Pin Code</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.pincode" placeholder="Pin Code">
                </div>

                <!-- Policy Details -->
                <div class="col-12 mt-3"><h6 class="border-bottom pb-1 text-primary fw-bold"><i class="bi bi-file-earmark-text-fill me-1"></i> Policy Details</h6></div>

                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Policy No. *</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.policyNumber" placeholder="Enter policy number">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Application no. / Customer ID</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.applicationNumber" placeholder="Optional application no. / customer ID">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Insurance Type *</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.type" placeholder="e.g. Health, Life, GMC">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Insurer Name *</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.insuranceName" placeholder="e.g. HDFC ERGO, Star Health">
                </div>

                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Product Name</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.productName" placeholder="Enter product name">
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Policy Issue Date</label>
                  <input type="date" class="form-control form-control-sm" [(ngModel)]="renewalForm.policyIssueDate">
                </div>
                <div class="col-md-2">
                  <label class="form-label small fw-semibold">Start Date *</label>
                  <input type="date" class="form-control form-control-sm" [(ngModel)]="renewalForm.policyStartDate">
                </div>
                <div class="col-md-2">
                  <label class="form-label small fw-semibold">Expiry Date *</label>
                  <input type="date" class="form-control form-control-sm" [(ngModel)]="renewalForm.policyEndDate">
                </div>

                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Sum Assured / Insured</label>
                  <input type="number" class="form-control form-control-sm" [(ngModel)]="renewalForm.sumInsured" placeholder="₹ Sum Insured">
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Premium</label>
                  <input type="number" class="form-control form-control-sm" [(ngModel)]="renewalForm.duePremium" placeholder="₹ Premium amount">
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Amount *</label>
                  <input type="number" class="form-control form-control-sm" [(ngModel)]="renewalForm.amount" placeholder="₹ Total Amount">
                </div>

                <!-- Payment Details -->
                <div class="col-12 mt-3"><h6 class="border-bottom pb-1 text-primary fw-bold"><i class="bi bi-credit-card-2-front-fill me-1"></i> Payment & Financial Details</h6></div>

                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Billing Frequency</label>
                  <select class="form-select form-select-sm" [(ngModel)]="renewalForm.customer.billingFrequency">
                    <option value="">Select frequency</option>
                    <option value="Monthly">Monthly</option>
                    <option value="Quarterly">Quarterly</option>
                    <option value="Half-Yearly">Half-Yearly</option>
                    <option value="Yearly">Yearly</option>
                    <option value="Single">Single</option>
                  </select>
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Payment Mode</label>
                  <select class="form-select form-select-sm" [(ngModel)]="renewalForm.paymentMode">
                    <option value="">Select payment mode</option>
                    <option value="Cheque">Cheque</option>
                    <option value="Net Banking / NEFT">Net Banking / NEFT</option>
                    <option value="UPI">UPI</option>
                    <option value="Credit Card">Credit Card</option>
                    <option value="Debit Card">Debit Card</option>
                    <option value="Cash">Cash</option>
                    <option value="DD">DD</option>
                  </select>
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Ref / Cheque / DD No</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.paymentReference" placeholder="Cheque / UTR / Txn number">
                </div>

                <!-- Team & Branch -->
                <div class="col-12 mt-3"><h6 class="border-bottom pb-1 text-primary fw-bold"><i class="bi bi-people-fill me-1"></i> Branch & Team Details</h6></div>

                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Branch *</label>
                  <select class="form-select form-select-sm" [(ngModel)]="renewalForm.branch">
                    <option value="">Select branch</option>
                    <option *ngFor="let b of availableBranches" [value]="b">{{b}}</option>
                  </select>
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">RM Name</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.rmName" placeholder="Enter RM name">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Associate Name</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.associateName" placeholder="Enter associate name">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">POSP Name</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.pospName" placeholder="Enter POSP name">
                </div>
              </div>

              <!-- ================= FORMAT B: Motor ================= -->
              <div class="row g-3" *ngIf="isMotorFormat()">
                <!-- Customer Details -->
                <div class="col-12"><h6 class="border-bottom pb-1 text-primary fw-bold"><i class="bi bi-person-fill me-1"></i> Customer Details</h6></div>

                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Customer Code <span *ngIf="selectedSection === 'Renewal'" class="badge bg-secondary-subtle text-secondary ms-1">Auto-Selected</span></label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.customerCode" 
                         [disabled]="selectedSection === 'Renewal'" [readonly]="selectedSection === 'Renewal'"
                         [class.bg-light]="selectedSection === 'Renewal'"
                         placeholder="Auto-generated (e.g. SIIBPL...)">
                </div>
                <div class="col-md-8">
                  <label class="form-label small fw-semibold">Customer Name *</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="customerFullName" (ngModelChange)="onCustomerNameChange($event)" placeholder="Enter full name">
                </div>

                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Contact No *</label>
                  <input type="tel" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.phone" placeholder="Mobile / Phone number">
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Email ID *</label>
                  <input type="email" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.email" placeholder="customer@example.com">
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Billing Frequency</label>
                  <select class="form-select form-select-sm" [(ngModel)]="renewalForm.customer.billingFrequency">
                    <option value="">Select frequency</option>
                    <option value="Yearly">Yearly</option>
                    <option value="Monthly">Monthly</option>
                    <option value="Quarterly">Quarterly</option>
                    <option value="Half-Yearly">Half-Yearly</option>
                  </select>
                </div>

                <div class="col-md-6">
                  <label class="form-label small fw-semibold">Address</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.address" placeholder="Residential / Office address">
                </div>
                <div class="col-md-2">
                  <label class="form-label small fw-semibold">City</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.city" placeholder="City">
                </div>
                <div class="col-md-2">
                  <label class="form-label small fw-semibold">State</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.state" placeholder="State">
                </div>
                <div class="col-md-2">
                  <label class="form-label small fw-semibold">Pin Code</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.pincode" placeholder="Pin Code">
                </div>

                <!-- Vehicle Details -->
                <div class="col-12 mt-3"><h6 class="border-bottom pb-1 text-primary fw-bold"><i class="bi bi-car-front-fill me-1"></i> Vehicle Details</h6></div>

                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Car / Reg No</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.vehicleRegNo" placeholder="e.g. MH02AB1234">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Model Name</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.vehicleModel" placeholder="e.g. Swift Dzire VXI">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Mgf Year</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.mfgYear" placeholder="e.g. 2022">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Vehicle Type</label>
                  <select class="form-select form-select-sm" [(ngModel)]="renewalForm.vehicleType">
                    <option value="">Select Vehicle Type</option>
                    <option value="Two Wheeler">Two Wheeler</option>
                    <option value="Private Car">Private Car</option>
                    <option value="Commercial Vehicle">Commercial Vehicle</option>
                    <option value="Bus / Van">Bus / Van</option>
                    <option value="Taxi">Taxi</option>
                    <option value="Other">Other</option>
                  </select>
                </div>

                <!-- Policy Details -->
                <div class="col-12 mt-3"><h6 class="border-bottom pb-1 text-primary fw-bold"><i class="bi bi-file-earmark-text-fill me-1"></i> Policy Details</h6></div>

                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Policy No. *</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.policyNumber" placeholder="Enter policy number">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Application no. / Customer ID</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.applicationNumber" placeholder="Optional application no. / customer ID">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Insurance Type *</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.type" placeholder="Motor Insurance">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Insurer Name *</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.insuranceName" placeholder="e.g. ICICI Lombard, Tata AIG">
                </div>

                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Product Name</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.productName" placeholder="Enter product name">
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Policy Issue Date</label>
                  <input type="date" class="form-control form-control-sm" [(ngModel)]="renewalForm.policyIssueDate">
                </div>
                <div class="col-md-2">
                  <label class="form-label small fw-semibold">Start Date *</label>
                  <input type="date" class="form-control form-control-sm" [(ngModel)]="renewalForm.policyStartDate">
                </div>
                <div class="col-md-2">
                  <label class="form-label small fw-semibold">Expiry Date *</label>
                  <input type="date" class="form-control form-control-sm" [(ngModel)]="renewalForm.policyEndDate">
                </div>

                <!-- Financials: OD, TP, IDV, Amount -->
                <div class="col-12 mt-3"><h6 class="border-bottom pb-1 text-primary fw-bold"><i class="bi bi-cash-stack me-1"></i> Motor Premium Breakdown</h6></div>

                <div class="col-md-3">
                  <label class="form-label small fw-semibold">IDV</label>
                  <input type="number" class="form-control form-control-sm" [(ngModel)]="renewalForm.idv" placeholder="₹ Insured Declared Value">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">OD Amt (Own Damage)</label>
                  <input type="number" class="form-control form-control-sm" [(ngModel)]="renewalForm.odAmount" placeholder="₹ OD Amount">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">TP Amt (Third Party)</label>
                  <input type="number" class="form-control form-control-sm" [(ngModel)]="renewalForm.tpAmount" placeholder="₹ TP Amount">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Sum Assured / Insured</label>
                  <input type="number" class="form-control form-control-sm" [(ngModel)]="renewalForm.sumInsured" placeholder="₹ Sum Insured">
                </div>

                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Premium</label>
                  <input type="number" class="form-control form-control-sm" [(ngModel)]="renewalForm.duePremium" placeholder="₹ Net Premium">
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Amount (Total) *</label>
                  <input type="number" class="form-control form-control-sm" [(ngModel)]="renewalForm.amount" placeholder="₹ Gross Amount">
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Payment Mode</label>
                  <select class="form-select form-select-sm" [(ngModel)]="renewalForm.paymentMode">
                    <option value="">Select payment mode</option>
                    <option value="Cheque">Cheque</option>
                    <option value="Net Banking / NEFT">Net Banking / NEFT</option>
                    <option value="UPI">UPI</option>
                    <option value="Credit Card">Credit Card</option>
                    <option value="Debit Card">Debit Card</option>
                    <option value="Cash">Cash</option>
                    <option value="DD">DD</option>
                  </select>
                </div>

                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Ref / Cheque / DD No</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.paymentReference" placeholder="Ref / Cheque / Txn No">
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Branch *</label>
                  <select class="form-select form-select-sm" [(ngModel)]="renewalForm.branch">
                    <option value="">Select branch</option>
                    <option *ngFor="let b of availableBranches" [value]="b">{{b}}</option>
                  </select>
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">RM Name</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.rmName" placeholder="Enter RM name">
                </div>

                <div class="col-md-6">
                  <label class="form-label small fw-semibold">Associate Name</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.associateName" placeholder="Enter associate name">
                </div>
                <div class="col-md-6">
                  <label class="form-label small fw-semibold">POSP Name</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.pospName" placeholder="Enter POSP name">
                </div>
              </div>

              <!-- ================= FORMAT C: Commercial ================= -->
              <div class="row g-3" *ngIf="isCommercialFormat()">
                <!-- Customer Details -->
                <div class="col-12"><h6 class="border-bottom pb-1 text-primary fw-bold"><i class="bi bi-person-fill me-1"></i> Customer & Entity Details</h6></div>

                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Customer Code <span *ngIf="selectedSection === 'Renewal'" class="badge bg-secondary-subtle text-secondary ms-1">Auto-Selected</span></label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.customerCode" 
                         [disabled]="selectedSection === 'Renewal'" [readonly]="selectedSection === 'Renewal'"
                         [class.bg-light]="selectedSection === 'Renewal'"
                         placeholder="Auto-generated (e.g. SIIBPL...)">
                </div>
                <div class="col-md-5">
                  <label class="form-label small fw-semibold">Customer Name *</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="customerFullName" (ngModelChange)="onCustomerNameChange($event)" placeholder="Enter entity / customer name">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Gender</label>
                  <select class="form-select form-select-sm" [(ngModel)]="renewalForm.customer.gender">
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                  </select>
                </div>

                <div class="col-md-3">
                  <label class="form-label small fw-semibold">DOB / Incorp Date</label>
                  <input type="date" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.dob">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Contact No *</label>
                  <input type="tel" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.phone" placeholder="Contact number">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Email ID *</label>
                  <input type="email" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.email" placeholder="email@company.com">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">PAN Number</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.panNumber" placeholder="ABCDE1234F">
                </div>

                <div class="col-md-6">
                  <label class="form-label small fw-semibold">Address</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.address" placeholder="Commercial address">
                </div>
                <div class="col-md-2">
                  <label class="form-label small fw-semibold">City</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.city" placeholder="City">
                </div>
                <div class="col-md-2">
                  <label class="form-label small fw-semibold">State</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.state" placeholder="State">
                </div>
                <div class="col-md-2">
                  <label class="form-label small fw-semibold">Pin Code</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.customer.pincode" placeholder="Pin Code">
                </div>

                <!-- Policy Details -->
                <div class="col-12 mt-3"><h6 class="border-bottom pb-1 text-primary fw-bold"><i class="bi bi-file-earmark-text-fill me-1"></i> Policy Details</h6></div>

                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Policy No. *</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.policyNumber" placeholder="Enter policy number">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Application no. / Customer ID</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.applicationNumber" placeholder="Optional application no. / customer ID">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Insurance Type *</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.type" placeholder="Commercial">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Insurer Name</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.insuranceName" placeholder="Enter insurance company">
                </div>

                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Product Name</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.productName" placeholder="e.g. Fire, Marine, Liability">
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Policy Issue Date</label>
                  <input type="date" class="form-control form-control-sm" [(ngModel)]="renewalForm.policyIssueDate">
                </div>
                <div class="col-md-2">
                  <label class="form-label small fw-semibold">Start Date *</label>
                  <input type="date" class="form-control form-control-sm" [(ngModel)]="renewalForm.policyStartDate">
                </div>
                <div class="col-md-2">
                  <label class="form-label small fw-semibold">Expiry Date *</label>
                  <input type="date" class="form-control form-control-sm" [(ngModel)]="renewalForm.policyEndDate">
                </div>

                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Sum Assured / Insured</label>
                  <input type="number" class="form-control form-control-sm" [(ngModel)]="renewalForm.sumInsured" placeholder="₹ Sum Insured">
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Premium</label>
                  <input type="number" class="form-control form-control-sm" [(ngModel)]="renewalForm.duePremium" placeholder="₹ Premium">
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Amount *</label>
                  <input type="number" class="form-control form-control-sm" [(ngModel)]="renewalForm.amount" placeholder="₹ Amount">
                </div>

                <!-- Payment Details -->
                <div class="col-12 mt-3"><h6 class="border-bottom pb-1 text-primary fw-bold"><i class="bi bi-credit-card-2-front-fill me-1"></i> Payment & Financial Details</h6></div>

                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Billing Frequency</label>
                  <select class="form-select form-select-sm" [(ngModel)]="renewalForm.customer.billingFrequency">
                    <option value="">Select frequency</option>
                    <option value="Yearly">Yearly</option>
                    <option value="Monthly">Monthly</option>
                    <option value="Quarterly">Quarterly</option>
                    <option value="Half-Yearly">Half-Yearly</option>
                    <option value="Single">Single</option>
                  </select>
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Payment Mode</label>
                  <select class="form-select form-select-sm" [(ngModel)]="renewalForm.paymentMode">
                    <option value="">Select payment mode</option>
                    <option value="Cheque">Cheque</option>
                    <option value="Net Banking / NEFT">Net Banking / NEFT</option>
                    <option value="UPI">UPI</option>
                    <option value="Credit Card">Credit Card</option>
                    <option value="Debit Card">Debit Card</option>
                    <option value="Cash">Cash</option>
                    <option value="DD">DD</option>
                  </select>
                </div>
                <div class="col-md-4">
                  <label class="form-label small fw-semibold">Ref / Cheque / DD No</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.paymentReference" placeholder="Ref / Cheque / DD No">
                </div>

                <!-- Team & Branch -->
                <div class="col-12 mt-3"><h6 class="border-bottom pb-1 text-primary fw-bold"><i class="bi bi-people-fill me-1"></i> Branch & Team Details</h6></div>

                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Branch *</label>
                  <select class="form-select form-select-sm" [(ngModel)]="renewalForm.branch">
                    <option value="">Select branch</option>
                    <option *ngFor="let b of availableBranches" [value]="b">{{b}}</option>
                  </select>
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">RM Name</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.rmName" placeholder="Enter RM name">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">Associate Name</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.associateName" placeholder="Enter associate name">
                </div>
                <div class="col-md-3">
                  <label class="form-label small fw-semibold">POSP Name</label>
                  <input type="text" class="form-control form-control-sm" [(ngModel)]="renewalForm.pospName" placeholder="Enter POSP name">
                </div>
              </div>
            </div>

          </div>

          <div class="modal-footer py-2 px-4 bg-light border-top d-flex justify-content-between align-items-center">
            <div>
              <button class="btn btn-outline-secondary btn-sm" *ngIf="renewalModalStep === 'renewal-search'" (click)="renewalModalStep = 'section'; selectedSection = null;">
                <i class="bi bi-arrow-left me-1"></i> Back to Categories
              </button>
              <button class="btn btn-outline-secondary btn-sm" *ngIf="renewalModalStep === 'type'" (click)="selectedSection === 'Renewal' ? (renewalModalStep = 'renewal-search') : (renewalModalStep = 'section');">
                <i class="bi bi-arrow-left me-1"></i> {{ selectedSection === 'Renewal' ? 'Back to Customer Search' : 'Back to Categories' }}
              </button>
              <button class="btn btn-outline-secondary btn-sm" *ngIf="renewalModalStep === 'form' && !selectedRenewalPolicy" (click)="renewalModalStep = 'type'">
                <i class="bi bi-arrow-left me-1"></i> Back to Types
              </button>
            </div>
            <div class="d-flex gap-2">
              <button class="btn btn-secondary btn-sm" (click)="closeRenewalModal()">Cancel</button>
              <button class="btn btn-primary btn-sm px-4 shadow-sm" *ngIf="renewalModalStep === 'form'" (click)="submitRenewal()">
                <i class="bi bi-check-circle-fill me-1"></i> {{ selectedRenewalPolicy ? 'Update Policy' : 'Create Policy' }}
              </button>
            </div>
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

    <!-- Top 10 High-Value Policies Popup -->
    <div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 1055; margin-top: 60px;" *ngIf="topHighValuePolicies.length > 0">
      
      <!-- Reopen Button (Shows when popup is closed) -->
      <div class="text-end" *ngIf="!showHighValuePopup" style="pointer-events: auto;">
        <button class="btn btn-primary shadow-lg d-flex align-items-center justify-content-center ms-auto" 
                style="width: 40px; height: 40px; border-radius: 50%;" 
                (click)="showHighValuePopup = true" 
                title="Show Top High-Value Deals">
          <i class="bi bi-star-fill text-warning"></i>
        </button>
      </div>

      <!-- Popup Content (Shows when open) -->
      <div class="toast show bg-white shadow-lg border-0 pe-auto" role="alert" aria-live="assertive" aria-atomic="true" style="width: 360px; max-width: 95vw; border-radius: 8px; overflow: hidden; pointer-events: auto;" *ngIf="showHighValuePopup">
        <div class="toast-header bg-primary text-white border-0 py-2 px-3">
          <i class="bi bi-star-fill text-warning me-2"></i>
          <strong class="me-auto">Top High-Value Deals</strong>
          <button type="button" class="btn-close btn-close-white" (click)="showHighValuePopup = false" aria-label="Close"></button>
        </div>
        <div class="toast-body p-0 overflow-auto" style="max-height: 350px; overflow-x: hidden !important;">
          <div class="list-group list-group-flush">
            <ng-container *ngFor="let p of topHighValuePolicies; let i = index">
              <div class="list-group-item d-flex justify-content-between align-items-center py-2 px-3 list-group-item-action" 
                   style="cursor: pointer;"
                   (click)="p.policyCount > 1 ? p.expanded = !p.expanded : jumpToRecord(p.policies[0])">
                <div class="me-2" style="flex: 1; min-width: 0;">
                  <div class="fw-bold text-dark text-truncate small" [title]="p.customerName">
                    {{i + 1}}. {{ p.customerName }}
                  </div>
                  <div class="text-muted text-truncate" style="font-size: 0.75rem; margin-top: 2px;">
                    <span *ngIf="p.policyCount > 1">
                      <i class="bi" [ngClass]="p.expanded ? 'bi-chevron-down' : 'bi-chevron-right'"></i> 
                      {{ p.policyCount }} Policies
                    </span>
                    <span *ngIf="p.policyCount === 1" class="text-truncate"><i class="bi bi-file-earmark-text me-1"></i>{{ p.insuranceName }} | {{ p.policyNumber }}</span>
                  </div>
                </div>
                <div class="text-end flex-shrink-0">
                  <span class="badge bg-success bg-opacity-10 text-success border border-success rounded-pill px-2 py-1 shadow-sm" style="font-size: 0.75rem;">
                    {{ p.totalPremium | currency:'INR':'symbol':'1.0-0' }}
                  </span>
                </div>
              </div>
              
              <!-- Expanded Policies -->
              <div class="list-group-item bg-light p-2" *ngIf="p.policyCount > 1 && p.expanded">
                <div *ngFor="let sub of p.policies; let last = last" class="d-flex justify-content-between align-items-center rounded px-2 py-1 list-group-item-action" [ngClass]="{'mb-1': !last}" style="cursor: pointer;" (click)="jumpToRecord(sub)">
                  <div class="text-truncate me-2" style="font-size: 0.7rem;">
                    <i class="bi bi-arrow-return-right text-muted mx-1"></i>
                    <span class="text-dark fw-medium">{{ sub.insuranceName || sub.type }}</span>
                    <span class="text-muted"> | {{ sub.policyNumber }}</span>
                  </div>
                  <div class="text-success fw-bold flex-shrink-0" style="font-size: 0.7rem;">
                    {{ (sub.duePremium ? sub.duePremium : (sub.amount || 0)) | currency:'INR':'symbol':'1.0-0' }}
                  </div>
                </div>
              </div>
            </ng-container>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Simple & Clean Renewer Stats Modal -->
    <div class="modal-overlay" *ngIf="showRenewerStatsModal" (click)="closeRenewerStatsModal()" style="background: rgba(0, 0, 0, 0.4);">
      <div class="custom-modal-content border-0 shadow" style="max-width: 750px; padding: 0; overflow: hidden; border-radius: 8px; background: #ffffff;" (click)="$event.stopPropagation()">
        
        <!-- Header -->
        <div class="p-3 d-flex justify-content-between align-items-center" style="border-bottom: 1px solid #eaedf1; background: #f8f9fa;">
          <h4 class="mb-0 text-dark fw-bold d-flex align-items-center">
            <i class="bi bi-person-lines-fill text-primary me-2"></i> 
            Renewer Activity
          </h4>
          <button class="btn btn-sm btn-light text-secondary rounded-circle" (click)="closeRenewerStatsModal()" style="width: 32px; height: 32px; padding: 0; display: flex; align-items: center; justify-content: center;">
            <i class="bi bi-x-lg"></i>
          </button>
        </div>

        <!-- Body -->
        <div class="modal-body p-4" style="max-height: 80vh; overflow-y: auto;">
          
          <!-- State 1: Simple List View -->
          <div *ngIf="!selectedRenewerStat" class="fade-in">
            <p class="text-muted mb-3 fs-6">Select a team member to view their performance for the current month.</p>
            
            <div class="row g-3">
              <div class="col-md-6" *ngFor="let stat of renewerStats">
                <div class="card h-100 border shadow-sm simple-hover-card" style="cursor: pointer; border-color: #eaedf1; border-radius: 8px;" (click)="selectedRenewerStat = stat">
                  <div class="card-body p-3 d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-center">
                      <div class="bg-light text-secondary rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px;">
                        <i class="bi bi-person-fill fs-5"></i>
                      </div>
                      <h6 class="mb-0 fw-bold text-dark">{{ stat.agentName }}</h6>
                    </div>
                    <div>
                      <span class="badge bg-light text-dark border px-2 py-1">{{ stat.total }} Tasks</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <div *ngIf="renewerStats?.length === 0" class="text-center py-5 my-4 bg-light border rounded-3">
              <i class="bi bi-inbox fs-2 text-muted mb-2 d-block"></i>
              <h6 class="fw-bold text-dark">No renewers found</h6>
              <p class="text-muted small mb-0">Ensure users are assigned the RENEWER role.</p>
            </div>
          </div>
          
          <!-- State 2: Simple Detail View -->
          <div *ngIf="selectedRenewerStat" class="fade-in">
            <div class="d-flex justify-content-between align-items-center mb-4">
              <div class="d-flex align-items-center">
                <div class="bg-light text-secondary rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 48px; height: 48px;">
                   <i class="bi bi-person-fill fs-4"></i>
                </div>
                <div>
                  <h5 class="mb-0 fw-bold text-dark">{{ selectedRenewerStat.agentName }}</h5>
                  <small class="text-muted mb-0" *ngIf="!selectedStatsDate">Current Month's Activity</small>
                  <small class="text-muted mb-0" *ngIf="selectedStatsDate">Activity for {{ selectedStatsDate | date:'mediumDate' }}</small>
                </div>
              </div>
              <div class="d-flex align-items-center gap-3">
                <div class="d-flex align-items-center gap-2">
                  <input type="date" class="form-control form-control-sm border shadow-sm p-1" style="width: auto; height: 31px; font-size: 0.85rem;" [(ngModel)]="selectedStatsDate" (change)="onStatsDateChange()">
                  <button *ngIf="selectedStatsDate" class="btn btn-sm btn-link text-decoration-none p-0" (click)="clearStatsDate()">Clear</button>
                </div>
                <button class="btn btn-sm btn-outline-secondary px-3" style="height: 31px; display: flex; align-items: center;" (click)="goBackToRenewerList()">
                  <i class="bi bi-arrow-left me-1"></i> Back
                </button>
              </div>
            </div>
            
            <div class="row g-3 mb-4">
              <!-- Renewed -->
              <div class="col-md-4 col-sm-6">
                <div class="card h-100 border shadow-sm" style="border-radius: 8px; border-color: #eaedf1;">
                  <div class="card-body p-3">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                      <span class="text-muted small fw-semibold text-uppercase">Renewed</span>
                      <div class="rounded-circle d-flex align-items-center justify-content-center" style="width: 28px; height: 28px; background-color: #e6f4ea; color: #1e8e3e;">
                        <i class="bi bi-check-lg"></i>
                      </div>
                    </div>
                    <h3 class="mb-0 fw-bold text-dark">{{ selectedRenewerStat.stats['Renewed'] || 0 }}</h3>
                  </div>
                </div>
              </div>
              
              <!-- Interested -->
              <div class="col-md-4 col-sm-6">
                <div class="card h-100 border shadow-sm" style="border-radius: 8px; border-color: #eaedf1;">
                  <div class="card-body p-3">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                      <span class="text-muted small fw-semibold text-uppercase">Interested</span>
                      <div class="rounded-circle d-flex align-items-center justify-content-center" style="width: 28px; height: 28px; background-color: #e8f0fe; color: #1a73e8;">
                        <i class="bi bi-hand-thumbs-up"></i>
                      </div>
                    </div>
                    <h3 class="mb-0 fw-bold text-dark">{{ selectedRenewerStat.stats['Interested'] || 0 }}</h3>
                  </div>
                </div>
              </div>

              <!-- Call Back Later -->
              <div class="col-md-4 col-sm-6">
                <div class="card h-100 border shadow-sm" style="border-radius: 8px; border-color: #eaedf1;">
                  <div class="card-body p-3">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                      <span class="text-muted small fw-semibold text-uppercase">Call Back</span>
                      <div class="rounded-circle d-flex align-items-center justify-content-center" style="width: 28px; height: 28px; background-color: #fef7e0; color: #f29900;">
                        <i class="bi bi-clock"></i>
                      </div>
                    </div>
                    <h3 class="mb-0 fw-bold text-dark">{{ selectedRenewerStat.stats['Call Back Later'] || 0 }}</h3>
                  </div>
                </div>
              </div>

              <!-- Not Interested -->
              <div class="col-md-4 col-sm-6">
                <div class="card h-100 border shadow-sm" style="border-radius: 8px; border-color: #eaedf1;">
                  <div class="card-body p-3">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                      <span class="text-muted small fw-semibold text-uppercase">Not Interested</span>
                      <div class="rounded-circle d-flex align-items-center justify-content-center" style="width: 28px; height: 28px; background-color: #fce8e6; color: #d93025;">
                        <i class="bi bi-x-lg"></i>
                      </div>
                    </div>
                    <h3 class="mb-0 fw-bold text-dark">{{ selectedRenewerStat.stats['Not Interested'] || 0 }}</h3>
                  </div>
                </div>
              </div>

              <!-- Voicemail -->
              <div class="col-md-4 col-sm-6">
                <div class="card h-100 border shadow-sm" style="border-radius: 8px; border-color: #eaedf1;">
                  <div class="card-body p-3">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                      <span class="text-muted small fw-semibold text-uppercase">Voicemail</span>
                      <div class="rounded-circle d-flex align-items-center justify-content-center" style="width: 28px; height: 28px; background-color: #f1f3f4; color: #5f6368;">
                        <i class="bi bi-voicemail"></i>
                      </div>
                    </div>
                    <h3 class="mb-0 fw-bold text-dark">{{ selectedRenewerStat.stats['Voicemail'] || 0 }}</h3>
                  </div>
                </div>
              </div>

              <!-- Externally Renewed -->
              <div class="col-md-4 col-sm-6">
                <div class="card h-100 border shadow-sm" style="border-radius: 8px; border-color: #eaedf1;">
                  <div class="card-body p-3">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                      <span class="text-muted small fw-semibold text-uppercase">Ext. Renewed</span>
                      <div class="rounded-circle d-flex align-items-center justify-content-center" style="width: 28px; height: 28px; background-color: #f3e8fd; color: #9334e6;">
                        <i class="bi bi-box-arrow-up-right"></i>
                      </div>
                    </div>
                    <h3 class="mb-0 fw-bold text-dark">{{ selectedRenewerStat.stats['Externally Renewed'] || 0 }}</h3>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- Total Card -->
            <div class="d-flex rounded mt-3" style="background-color: #f8f9fa; border: 1px solid #eaedf1; overflow: hidden;">
              <div class="flex-fill p-3 text-center border-end" style="border-color: #eaedf1 !important;">
                 <h4 class="fw-bold mb-1 text-dark">{{ selectedRenewerStat.total }}</h4>
                 <div class="text-muted text-uppercase fw-semibold" style="font-size: 0.75rem; letter-spacing: 0.5px;">Total Calls Made</div>
              </div>
              <div class="flex-fill p-3 text-center" style="background-color: #f1f8ff;">
                 <h4 class="fw-bold mb-1 text-primary">{{ selectedRenewerStat.uniqueCount || 0 }} <span class="text-muted fw-normal fs-5">/ {{ selectedRenewerStat.assignedCount || 0 }}</span></h4>
                 <div class="text-primary text-uppercase fw-semibold" style="font-size: 0.75rem; letter-spacing: 0.5px; opacity: 0.8;">Unique Policies Touched</div>
              </div>
            </div>
          </div>
          
        </div>
      </div>
    </div>
    
  `,
  styles: [`
    .admin-container { padding: 20px; max-width: 1400px; margin: 0 auto; }

    /* Simple Custom Utilities */
    .simple-hover-card { transition: all 0.2s ease; }
    .simple-hover-card:hover { transform: translateY(-2px); box-shadow: 0 .5rem 1rem rgba(0,0,0,.08)!important; }
    
    .fade-in { animation: fadeIn 0.2s ease-in; }
    @keyframes fadeIn { from { opacity: 0; transform: translateY(5px); } to { opacity: 1; transform: translateY(0); } }
    
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
      padding: 7px 10px; 
      border-radius: 6px; 
      border: 1px solid #ced4da; 
      font-size: 0.88rem;
      width: 145px;
      height: 38px;
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

    .section-card {
      transition: all 0.25s ease;
      border-radius: 12px;
      background: #ffffff;
      border: 2px solid #e9ecef !important;
    }
    .section-card:hover {
      transform: translateY(-4px);
      box-shadow: 0 10px 25px rgba(0,0,0,0.08) !important;
      border-color: #0d6efd !important;
    }
    .section-icon-wrapper {
      width: 64px;
      height: 64px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .type-card {
      transition: all 0.2s ease;
      border-radius: 10px;
      background: #ffffff;
      border: 1px solid #dee2e6;
    }
    .type-card:hover {
      transform: translateY(-2px);
      border-color: #0d6efd !important;
      box-shadow: 0 6px 18px rgba(13,110,253,0.12) !important;
    }
    .type-icon-box {
      width: 44px;
      height: 44px;
      border-radius: 8px;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
    }
    .cursor-pointer {
      cursor: pointer;
    }
    
    .search-group { width: 220px; min-width: 180px; }
    
    /* Ensure search input matches date input height */
    .search-group .form-control, .search-group .btn {
      padding: 7px 12px;
      font-size: 0.88rem;
      height: 38px;
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
  selectedAdminBranch: string = ''; // Supports "All Branches"
  selectedMonthForReport: string = new Date().toISOString().slice(0, 7); // For YYYY-MM input
  availableBranches: string[] = [];

  // POSP Filter
  availablePospNames: string[] = [];
  selectedPospFilter: string = '';
  isPospFilterActive: boolean = false;
  allPospPolicies: any[] = [];

  // Top 10 High Value Policies
  topHighValuePolicies: any[] = [];
  showHighValuePopup: boolean = false;
  showBranchModal: boolean = false;
  newBranchName: string = '';

  // Renewer Records
  renewerRecords: any[] = [];
  renewerStats: any[] = [];

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
  renewalModalStep: 'section' | 'renewal-search' | 'type' | 'form' = 'section';
  selectedSection: 'Fresh' | 'Renewal' | 'Endorsement' | null = null;
  selectedInsuranceType: string | null = null;
  customerFullName: string = '';
  renewalForm: any = { customer: {} };
  selectedRenewalPolicy: any = null;
  renewalSearchTerm: string = '';
  renewalSearchResults: any[] = [];
  renewalSearchQuery: string = '';
  searchingCustomers: boolean = false;
  hasSearchedCustomer: boolean = false;
  selectedRenewalCustomer: any = null;
  newPolicyEndDate: string = '';

  // Renewer Stats Modal
  showRenewerStatsModal: boolean = false;
  selectedRenewerStat: any = null;
  selectedStatsDate: string = '';

  constructor(private apiService: ApiService, private authService: AuthService, private cdr: ChangeDetectorRef, private notificationService: NotificationService) { }

  ngOnInit() {
    this.apiService.adminViewAs = '';
    this.loadStats();
    this.refreshTimelineCounts();
    this.fetchTopHighValuePolicies();
    this.loadInitialData();
    this.loadPospNames();
    if (!this.isRmRole() && !this.isPospRole()) {
      this.loadRenewerStats();
    }
  }

  isAdmin(): boolean { return this.authService.isAdmin(); }

  isRmRole(): boolean {
    return this.authService.hasRole('RM');
  }

  isPospRole(): boolean {
    return this.authService.hasRole('POSP');
  }

  loadInitialData() {
    this.loadRenewerRecords();
    // this.loadLateRenewals(); // Not needed as separate section is removed

    this.selectedDate = '';
    this.selectedDay = null;

    this.loadBranches();
  }

  loadRenewerStats(date?: string, agentName?: string) {
    this.apiService.getRenewerMonthlyStats(date, agentName).subscribe({
      next: (stats) => {
        if (agentName) {
            // Update only the selected renewer
            const updatedStat = stats.find(s => s.agentName === agentName);
            if (updatedStat) {
                this.selectedRenewerStat = updatedStat;
            } else {
                // If no stats returned for this agent on this date, zero it out but keep agentName
                this.selectedRenewerStat = {
                    agentName: agentName,
                    stats: {
                        'Renewed': 0, 'Interested': 0, 'Call Back Later': 0, 
                        'Not Interested': 0, 'Voicemail': 0, 'Externally Renewed': 0
                    },
                    total: 0
                };
            }
        } else {
            // Update the main list
            this.renewerStats = stats;
        }
      },
      error: (err) => console.error('Error fetching renewer stats:', err)
    });
  }

  onStatsDateChange() {
    if (this.selectedRenewerStat) {
        this.loadRenewerStats(this.selectedStatsDate, this.selectedRenewerStat.agentName);
    }
  }

  clearStatsDate() {
    this.selectedStatsDate = '';
    if (this.selectedRenewerStat) {
        this.loadRenewerStats(undefined, this.selectedRenewerStat.agentName);
    }
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

  openRenewerStatsModal() {
    this.showRenewerStatsModal = true;
    this.selectedRenewerStat = null;
  }

  closeRenewerStatsModal() {
    this.showRenewerStatsModal = false;
    this.selectedRenewerStat = null;
    this.selectedStatsDate = '';
  }

  goBackToRenewerList() {
    this.selectedRenewerStat = null;
    this.selectedStatsDate = '';
    this.loadRenewerStats();
  }

  saveBranch() {
    if (!this.newBranchName || !this.newBranchName.trim()) return;
    this.apiService.createBranch({ name: this.newBranchName.trim() }).subscribe({
      next: (res) => {
        this.loadBranches();
        this.newBranchName = '';
      },
      error: (err) => {
        this.notificationService.showErrorModal('Error creating branch: ' + (err.error || err.message));
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
    this.loadPospNames();
    this.loadStats();
    this.refreshTimelineCounts();
    this.loadRenewerRecords();
    this.fetchTopHighValuePolicies();
    if (this.isPospFilterActive) {
      this.onPospFilterChange();
    } else if (this.selectedDate) {
      this.onDateChange();
    } else if (this.selectedDay === 'todays-work') {
      this.openTodaysWork();
    }
  }

  fetchTopHighValuePolicies() {
    this.apiService.getHighValueDeals(this.selectedAdminBranch).subscribe({
      next: (policies) => {
        if (!policies) {
          this.topHighValuePolicies = [];
          return;
        }

        // Group by customer name
        const customerMap = new Map<string, any>();

        policies.forEach(p => {
          if (!p.customer) return;

          let fullName = `${p.customer.firstName || ''} ${p.customer.lastName || ''}`.trim();
          let baseName = fullName;

          // Strip out " (LA: ...)" part to group by base customer name
          if (baseName.includes(' (LA:')) {
            baseName = baseName.split(' (LA:')[0].trim();
          } else if (baseName.includes('(LA:')) {
            baseName = baseName.split('(LA:')[0].trim();
          }

          const premium = p.duePremium ? p.duePremium : (p.amount || 0);

          if (customerMap.has(baseName)) {
            const existing = customerMap.get(baseName);
            existing.totalPremium += premium;
            existing.policyCount += 1;
            existing.policies.push(p);
          } else {
            customerMap.set(baseName, {
              customerName: baseName,
              totalPremium: premium,
              policyCount: 1,
              insuranceName: p.insuranceName || p.type, // keep first one
              policyNumber: p.policyNumber, // keep first one
              policies: [p],
              expanded: false
            });
          }
        });

        this.topHighValuePolicies = Array.from(customerMap.values())
          .sort((a, b) => b.totalPremium - a.totalPremium)
          .slice(0, 20);

        if (this.topHighValuePolicies.length > 0) {
          this.showHighValuePopup = true;
        }
      },
      error: (err) => console.error('Error fetching top policies:', err)
    });
  }

  toggleHighValuePopup(show: boolean, event?: Event) {
    if (event) {
      event.preventDefault();
      event.stopPropagation();
    }
    this.showHighValuePopup = show;
    this.cdr.detectChanges();
  }

  jumpToRecord(policy: any) {
    this.showHighValuePopup = false;
    this.adminSearchTerm = policy.policyNumber;
    this.searchAdminDailyRecords();
    
    // Scroll smoothly to the Daily Records View section
    setTimeout(() => {
        const dailyViewElement = document.querySelector('.date-view-card');
        if (dailyViewElement) {
            dailyViewElement.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
    }, 100);
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

  loadPospNames() {
    this.apiService.getPospNames(this.selectedAdminBranch).subscribe({
      next: (names) => {
        this.availablePospNames = (names || []).filter(n => n && n.trim() !== '' && n.trim() !== '-');
      },
      error: (err) => console.error('Error fetching POSP names:', err)
    });
  }

  onPospFilterChange() {
    if (!this.selectedPospFilter || this.selectedPospFilter.trim() === '') {
      this.clearPospFilter();
      return;
    }

    this.isPospFilterActive = true;
    this.isSearchMode = false;
    this.adminSearchTerm = '';
    this.selectedDate = '';
    this.selectedDay = null;
    this.loading = true;

    this.apiService.getPoliciesByPosp(this.selectedPospFilter, this.selectedAdminBranch)
      .pipe(finalize(() => this.loading = false))
      .subscribe({
        next: (policies) => {
          this.allPospPolicies = policies || [];
          this.selectedDateRecords = {
            expiringPolicies: [...this.allPospPolicies],
            scheduledFollowUps: [],
            workedOnPolicies: []
          };
          this.applyPremiumFilter();
        },
        error: (err) => {
          console.error('Error fetching policies by POSP:', err);
          this.allPospPolicies = [];
          this.selectedDateRecords = { expiringPolicies: [], scheduledFollowUps: [], workedOnPolicies: [] };
        }
      });
  }

  clearPospFilter() {
    this.selectedPospFilter = '';
    this.isPospFilterActive = false;
    this.allPospPolicies = [];
    if (this.selectedDay !== 'todays-work') {
      this.onDateChange();
    }
  }

  searchAdminDailyRecords() {
    if (!this.adminSearchTerm.trim()) return;

    this.loading = true;
    this.isSearchMode = true;
    this.selectedDate = ''; // Clear date selection
    this.selectedDay = null; // Clear todays-work mode
    this.selectedPospFilter = '';
    this.isPospFilterActive = false;
    this.allPospPolicies = [];

    this.apiService.searchPolicies(this.adminSearchTerm, this.selectedAdminBranch)
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
    if (this.selectedDate) {
      this.selectedPospFilter = '';
      this.isPospFilterActive = false;
      this.allPospPolicies = [];
    }
    if (!this.selectedDate) {
      this.selectedDay = null;
      if (!this.isPospFilterActive && !this.isSearchMode) {
        this.selectedDateRecords = { expiringPolicies: [], scheduledFollowUps: [], workedOnPolicies: [] };
      }
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
    this.selectedPospFilter = '';
    this.isPospFilterActive = false;
    this.allPospPolicies = [];

    if (day === 600) {
      this.load60DaysWorkload();
      return;
    }

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

  load60DaysWorkload() {
    this.selectedDate = '';
    this.isSearchMode = false;
    this.adminSearchTerm = '';
    this.selectedDay = 600;
    this.selectedPospFilter = '';
    this.isPospFilterActive = false;
    this.allPospPolicies = [];

    this.loading = true;
    this.apiService.getRecordsForNext60Days(this.selectedAdminBranch)
      .pipe(finalize(() => this.loading = false))
      .subscribe({
        next: (data) => {
          try {
            let expiring = data.expiringPolicies || [];
            let followups = data.scheduledFollowUps || [];
            
            if (this.isRmRole() || this.isPospRole()) {
               const normalizeDate = (val: any) => {
                 if (!val) return '';
                 if (Array.isArray(val)) return `${val[0]}-${String(val[1]).padStart(2, '0')}-${String(val[2]).padStart(2, '0')}`;
                 return String(val).substring(0, 10);
               };
               const todayStr = new Date().toISOString().split('T')[0];
               const today = new Date(todayStr);
               
               expiring = expiring.filter((p: any) => {
                 if(!p.expiryDate) return false;
                 const diffDays = Math.round((new Date(normalizeDate(p.expiryDate)).getTime() - today.getTime()) / (1000 * 60 * 60 * 24));
                 return diffDays <= 30 && diffDays >= 0;
               });
               
               followups = followups.filter((p: any) => {
                 if(!p.reminder || !p.reminder.followUpDate) return false;
                 const diffDays = Math.round((new Date(normalizeDate(p.reminder.followUpDate)).getTime() - today.getTime()) / (1000 * 60 * 60 * 24));
                 return diffDays <= 30 && diffDays >= 0;
               });
            }

            this.all60DaysExpiring = expiring;
            this.all60DaysFollowUps = followups;
            this.applyDayFilter();
          } catch (e) {
            console.error('Error processing 60 days records:', e);
            this.selectedDateRecords = { expiringPolicies: [], scheduledFollowUps: [], workedOnPolicies: [] };
          }
        },
        error: (err) => {
          console.error('Error fetching 60 days records:', err);
          this.selectedDateRecords = { expiringPolicies: [], scheduledFollowUps: [], workedOnPolicies: [] };
        }
      });
  }

  applyDayFilter() {
    if (this.selectedDay !== 600) return;

    if (this.dayFilter !== null && this.dayFilter !== '') {
      const normalizeDate = (val: any) => {
        if (!val) return '';
        if (Array.isArray(val)) return `${val[0]}-${String(val[1]).padStart(2, '0')}-${String(val[2]).padStart(2, '0')}`;
        return String(val).substring(0, 10);
      };

      const filterFn = (p: any) => {
        if (!p.expiryDate) return false;
        const expiryDate = normalizeDate(p.expiryDate);
        const todayStr = new Date().toISOString().split('T')[0];

        const expiry = new Date(expiryDate);
        const today = new Date(todayStr);
        const diffTime = expiry.getTime() - today.getTime();
        const diffDays = Math.round(diffTime / (1000 * 60 * 60 * 24));

        return diffDays === Number(this.dayFilter);
      };

      const followUpFilterFn = (p: any) => {
        if (!p.reminder || !p.reminder.followUpDate) return false;
        const followUpDateStr = normalizeDate(p.reminder.followUpDate);
        const todayStr = new Date().toISOString().split('T')[0];

        const followUp = new Date(followUpDateStr);
        const today = new Date(todayStr);
        const diffTime = followUp.getTime() - today.getTime();
        const diffDays = Math.round(diffTime / (1000 * 60 * 60 * 24));

        return diffDays === Number(this.dayFilter);
      };

      this.selectedDateRecords = {
        expiringPolicies: this.all60DaysExpiring.filter(filterFn),
        scheduledFollowUps: this.all60DaysFollowUps.filter(followUpFilterFn),
        workedOnPolicies: this.selectedDateRecords?.workedOnPolicies || []
      };
    } else {
      this.selectedDateRecords = {
        expiringPolicies: this.all60DaysExpiring,
        scheduledFollowUps: this.all60DaysFollowUps,
        workedOnPolicies: this.selectedDateRecords?.workedOnPolicies || []
      };
    }
  }

  todaysWorkTab: 'expiring' | 'followups' | 'updated' = 'expiring';
  todaysExpiring: any[] = [];
  todaysFollowUps: any[] = [];
  todaysUpdated: any[] = [];
  allTodaysExpiring: any[] = [];
  allTodaysFollowUps: any[] = [];
  allTodaysUpdated: any[] = [];
  all60DaysExpiring: any[] = [];
  all60DaysFollowUps: any[] = [];
  dayFilter: string | null = null;
  selectedPremiumRange: string = 'all';
  selectedPolicyType: string = 'all';
  availablePolicyTypes: string[] = [];
  selectedRenewerFilter: string = 'all';
  availableRenewers: any[] = [];
  selectedRmFilter: string = 'all';
  availableRmNames: string[] = [];

  applyPremiumFilter() {
    if (this.isPospFilterActive) {
      const filterFn = (p: any) => {
        let isPremiumMatch = true;
        if (this.selectedPremiumRange !== 'all') {
          const amt = p.amount || 0;
          if (this.selectedPremiumRange === '0-1') isPremiumMatch = amt >= 0 && amt <= 100000;
          else if (this.selectedPremiumRange === '1-3') isPremiumMatch = amt > 100000 && amt <= 300000;
          else if (this.selectedPremiumRange === '3-5') isPremiumMatch = amt > 300000 && amt <= 500000;
          else if (this.selectedPremiumRange === '5+') isPremiumMatch = amt > 500000;
        }

        let isTypeMatch = true;
        if (this.selectedPolicyType !== 'all') {
          isTypeMatch = p.type === this.selectedPolicyType;
        }

        return isPremiumMatch && isTypeMatch;
      };

      if (this.selectedDateRecords) {
        this.selectedDateRecords.expiringPolicies = this.allPospPolicies.filter(filterFn);
      }
      return;
    }

    const filterFn = (p: any) => {
      let isPremiumMatch = true;
      if (this.selectedPremiumRange !== 'all') {
        const amt = p.amount || 0;
        if (this.selectedPremiumRange === '0-1') isPremiumMatch = amt >= 0 && amt <= 100000;
        else if (this.selectedPremiumRange === '1-3') isPremiumMatch = amt > 100000 && amt <= 300000;
        else if (this.selectedPremiumRange === '3-5') isPremiumMatch = amt > 300000 && amt <= 500000;
        else if (this.selectedPremiumRange === '5+') isPremiumMatch = amt > 500000;
      }

      let isTypeMatch = true;
      if (this.selectedPolicyType !== 'all') {
        isTypeMatch = p.type === this.selectedPolicyType;
      }

      let isRenewerMatch = true;
      if (this.selectedRenewerFilter !== 'all') {
        const rUser = this.availableRenewers.find(u => u.username === this.selectedRenewerFilter);
        if (rUser) {
           let matchesBranch = true;
           if (rUser.assignedBranch && rUser.assignedBranch !== 'null') {
              const branches = rUser.assignedBranch.split(',').map((b: string) => b.trim().toLowerCase());
              matchesBranch = p.branch && branches.includes(p.branch.toLowerCase());
           }
           let matchesPremium = true;
           if (rUser.assignedPremiumRange && rUser.assignedPremiumRange !== 'null') {
              const rangesStr = rUser.assignedPremiumRange;
              const amt = p.amount || 0;
              matchesPremium = false;
              if (rangesStr.includes('<50,000') && amt <= 50000) matchesPremium = true;
              if (rangesStr.includes('50,000-1,00,000') && amt > 50000 && amt <= 100000) matchesPremium = true;
              if (rangesStr.includes('>1,00,000') && amt > 100000) matchesPremium = true;
              if (rangesStr.trim() === '') matchesPremium = true;
           }
           let matchesType = true;
           if (rUser.assignedProductType && rUser.assignedProductType !== 'null') {
              const types = rUser.assignedProductType.split(',').map((t: string) => t.trim().toLowerCase());
              matchesType = p.type && types.includes(p.type.toLowerCase());
           }
           let matchesCustomer = true;
           if (rUser.assignedCustomers && rUser.assignedCustomers !== 'null') {
              const customers = rUser.assignedCustomers.split(',').map((c: string) => c.trim().toLowerCase());
              const cName = p.customer && typeof p.customer === 'string' ? p.customer.toLowerCase() : (p.customer?.firstName ? p.customer.firstName.toLowerCase() : '');
              matchesCustomer = false;
              for (const c of customers) {
                 if (cName.includes(c)) { matchesCustomer = true; break; }
              }
              if (customers.length === 0 || rUser.assignedCustomers.trim() === '') matchesCustomer = true;
           }
           
           const matchesRules = matchesBranch && matchesPremium && matchesType && matchesCustomer;
           const isLastUpdatedBy = p.reminder && p.reminder.lastUpdatedBy === this.selectedRenewerFilter;
           
           isRenewerMatch = matchesRules || isLastUpdatedBy;
        } else {
           isRenewerMatch = p.reminder && p.reminder.lastUpdatedBy === this.selectedRenewerFilter;
        }
      }

      let isRmMatch = true;
      if (this.selectedRmFilter !== 'all') {
        isRmMatch = p.rmName === this.selectedRmFilter;
      }

      return isPremiumMatch && isTypeMatch && isRenewerMatch && isRmMatch;
    };

    this.todaysExpiring = this.allTodaysExpiring.filter(filterFn);
    this.todaysFollowUps = this.allTodaysFollowUps.filter(filterFn);
    this.todaysUpdated = this.allTodaysUpdated.filter(filterFn);

    if (this.selectedDateRecords) {
      if (this.todaysWorkTab === 'expiring') {
        this.selectedDateRecords.expiringPolicies = this.todaysExpiring;
      } else if (this.todaysWorkTab === 'followups') {
        this.selectedDateRecords.expiringPolicies = this.todaysFollowUps;
      } else {
        this.selectedDateRecords.expiringPolicies = this.todaysUpdated;
      }
    }
  }

  setPremiumRange(range: string) {
    this.selectedPremiumRange = range;
    this.applyPremiumFilter();
  }

  setAdminTodaysWorkTab(tab: 'expiring' | 'followups' | 'updated') {
    this.todaysWorkTab = tab;
    if (this.selectedDateRecords) {
      if (tab === 'expiring') {
        this.selectedDateRecords.expiringPolicies = this.todaysExpiring;
      } else if (tab === 'followups') {
        this.selectedDateRecords.expiringPolicies = this.todaysFollowUps;
      } else {
        this.selectedDateRecords.expiringPolicies = this.todaysUpdated;
      }
    }
  }

  openTodaysWork() {
    this.selectedDate = '';
    this.isSearchMode = false;
    this.adminSearchTerm = '';
    this.selectedDay = 'todays-work';
    this.selectedPospFilter = '';
    this.isPospFilterActive = false;
    this.allPospPolicies = [];

    this.loading = true;
    this.apiService.getTodaysWork(this.selectedAdminBranch).subscribe({
      next: (policies) => {
        const todayStr = new Date().toISOString().split('T')[0];

        const normalizeDate = (val: any) => {
          if (!val) return '';
          if (Array.isArray(val)) return `${val[0]}-${String(val[1]).padStart(2, '0')}-${String(val[2]).padStart(2, '0')}`;
          return String(val).substring(0, 10);
        };

        this.allTodaysFollowUps = policies.filter((p: any) => {
          if (!p.reminder || !p.reminder.followUpDate) return false;
          return normalizeDate(p.reminder.followUpDate) <= todayStr;
        });

        this.allTodaysExpiring = policies.filter((p: any) => {
          if (!p.reminder || !p.reminder.followUpDate) return true;
          return normalizeDate(p.reminder.followUpDate) > todayStr;
        });

        // Extract available types
        const typesSet = new Set<string>();
        [...this.allTodaysExpiring, ...this.allTodaysFollowUps].forEach(p => {
          if (p.type) typesSet.add(p.type);
        });
        this.availablePolicyTypes = Array.from(typesSet).sort();

        // Extract available RMs
        const rmSet = new Set<string>();
        [...this.allTodaysExpiring, ...this.allTodaysFollowUps].forEach(p => {
          if (p.rmName) rmSet.add(p.rmName);
        });
        this.availableRmNames = Array.from(rmSet).sort();

        // Populate Updated Today records
        const updatedToday = this.renewerRecords.filter(r => {
          if (!r.reminder || !r.reminder.lastReminderSentAt) return false;
          return normalizeDate(r.reminder.lastReminderSentAt) === todayStr;
        });

        this.allTodaysUpdated = updatedToday.map(r => {
          const p = r.reminder.policy ? { ...r.reminder.policy } : {};
          p.customer = r.customer;
          p.reminder = r.reminder;
          p.policyNumber = p.policyNumber || r.policyNumber;
          return p;
        });

        // Get available Renewers
        this.authService.getUsers().subscribe({
          next: (users) => {
            this.availableRenewers = users.filter((u: any) => u.role.includes('RENEWER'));
          },
          error: (err) => console.error('Failed to load renewers:', err)
        });

        // Apply filter initially
        this.applyPremiumFilter();

        this.selectedDateRecords = {
          expiringPolicies: this.todaysWorkTab === 'expiring' ? this.todaysExpiring : (this.todaysWorkTab === 'followups' ? this.todaysFollowUps : this.todaysUpdated),
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
    } else if (this.selectedDay === 600) {
      this.load60DaysWorkload();
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

  isMotorPolicy(policy: any): boolean {
    if (!policy) return false;
    const type = (policy.type || '').toLowerCase();
    const insurance = (policy.insuranceName || '').toLowerCase();
    const product = (policy.productName || '').toLowerCase();

    if (policy.vehicleRegNo || policy.vehicleModel || policy.vehicleType || policy.mfgYear ||
        policy.idv || policy.odAmount || policy.tpAmount) {
      return true;
    }

    if (type.includes('life') || type.includes('health') || product.includes('life') || product.includes('health')) {
      return false;
    }

    const motorKeywords = ['motor', 'auto', 'car', 'vehicle', 'two wheeler', 'gcv', 'pcv'];
    return motorKeywords.some(keyword => type.includes(keyword) || product.includes(keyword));
  }

  openViewModal(policy: any) {
    this.selectedViewPolicy = policy;
    if (this.selectedViewPolicy) {
      if (!this.selectedViewPolicy.customer) {
        this.selectedViewPolicy.customer = {};
      }
      if (!this.selectedViewPolicy.customerCode && this.selectedViewPolicy.customer?.customerCode) {
        this.selectedViewPolicy.customerCode = this.selectedViewPolicy.customer.customerCode;
      } else if (!this.selectedViewPolicy.customer?.customerCode && this.selectedViewPolicy.customerCode) {
        this.selectedViewPolicy.customer.customerCode = this.selectedViewPolicy.customerCode;
      }
    }
    this.showViewModal = true;
    this.isEditing = false;
    this.viewHistoryMode = false;
    this.auditLogs = [];

    // Fetch fresh data
    if (policy && policy.id) {
      this.apiService.getPolicyById(policy.id).subscribe({
        next: (freshPolicy) => {
          this.selectedViewPolicy = freshPolicy;
          if (this.selectedViewPolicy) {
            if (!this.selectedViewPolicy.customer) {
              this.selectedViewPolicy.customer = {};
            }
            if (!this.selectedViewPolicy.customerCode && this.selectedViewPolicy.customer?.customerCode) {
              this.selectedViewPolicy.customerCode = this.selectedViewPolicy.customer.customerCode;
            } else if (!this.selectedViewPolicy.customer?.customerCode && this.selectedViewPolicy.customerCode) {
              this.selectedViewPolicy.customer.customerCode = this.selectedViewPolicy.customerCode;
            }
          }
          console.log('Admin Dashboard: Policy refreshed from server');
        },
        error: (err) => console.error('Error refreshing policy in Admin Dashboard:', err)
      });
    }
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
      error: (err: any) => {
                console.error('Failed to view document:', err);
                const status = err?.status;
                const msg = status === 404
                    ? 'The requested document file could not be found on the server.'
                    : (status === 401 || status === 403)
                        ? 'Authentication required or session expired to view this document.'
                        : 'Failed to view document (' + (status ? 'HTTP ' + status : 'Network Error') + ').';
                this.notificationService.showErrorModal(msg);
            }
    });
  }

  async deletePolicy(id: any) {
    if (await this.notificationService.confirmAction('Are you sure you want to delete this policy? This action cannot be undone.')) {
      this.apiService.deletePolicy(id).subscribe({
        next: () => {
          this.notificationService.showSuccessToast('Policy deleted successfully');
          this.refreshTimelineCounts();
          this.loadRenewerRecords();
          if (this.selectedDate) {
            this.onDateChange();
          }
        },
        error: (err) => this.notificationService.showErrorModal('Failed to delete policy: ' + err.message)
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

  selectSection(section: 'Fresh' | 'Renewal' | 'Endorsement') {
    this.selectedSection = section;
    if (section === 'Fresh') {
      this.selectedRenewalCustomer = null;
      this.renewalModalStep = 'type';
    } else if (section === 'Renewal') {
      this.selectedRenewalCustomer = null;
      this.renewalSearchQuery = '';
      this.renewalSearchResults = [];
      this.hasSearchedCustomer = false;
      this.renewalModalStep = 'renewal-search';
    } else {
      this.renewalModalStep = 'section';
    }
  }

  searchRenewalCustomer() {
    const q = (this.renewalSearchQuery || '').trim();
    if (!q) return;
    this.searchingCustomers = true;
    this.hasSearchedCustomer = false;
    this.apiService.searchCustomersForRenewal(q).subscribe({
      next: (results) => {
        this.searchingCustomers = false;
        this.hasSearchedCustomer = true;
        this.renewalSearchResults = results || [];
        if (this.renewalSearchResults.length === 1) {
          this.selectCustomerForRenewal(this.renewalSearchResults[0]);
        }
      },
      error: (err) => {
        this.searchingCustomers = false;
        this.hasSearchedCustomer = true;
        console.error('Error searching customers for renewal:', err);
      }
    });
  }

  clearRenewalSearch() {
    this.renewalSearchQuery = '';
    this.renewalSearchResults = [];
    this.hasSearchedCustomer = false;
    this.selectedRenewalCustomer = null;
  }

  selectCustomerForRenewal(cust: any) {
    this.selectedRenewalCustomer = cust;
  }

  proceedToRenewalType() {
    if (!this.selectedRenewalCustomer) return;
    this.renewalModalStep = 'type';
  }

  renewSpecificPolicy(policy: any) {
    if (!this.selectedRenewalCustomer) return;
    const t = (policy.type || '').toLowerCase();
    if (t.includes('motor') || t.includes('vehicle') || t.includes('car')) {
      this.selectedInsuranceType = 'Motor';
    } else if (t.includes('commercial')) {
      this.selectedInsuranceType = 'Commercial';
    } else if (t.includes('life')) {
      this.selectedInsuranceType = 'Life';
    } else if (t.includes('gmc')) {
      this.selectedInsuranceType = 'GMC';
    } else if (t.includes('gpa')) {
      this.selectedInsuranceType = 'GPA';
    } else if (t.includes('gtl')) {
      this.selectedInsuranceType = 'GTL';
    } else {
      this.selectedInsuranceType = 'Health';
    }
    this.selectInsuranceType(this.selectedInsuranceType, policy);
  }

  selectInsuranceType(type: string, basePolicy: any = null) {
    this.selectedInsuranceType = type;
    if (!this.renewalForm) this.renewalForm = { customer: {} };
    if (!this.renewalForm.customer) this.renewalForm.customer = {};
    this.renewalForm.type = type;
    this.renewalForm.businessType = this.selectedSection || 'Fresh';

    if (this.selectedSection === 'Renewal' && this.selectedRenewalCustomer) {
      this.renewalForm.customer = {
        id: this.selectedRenewalCustomer.id,
        customerCode: this.selectedRenewalCustomer.customerCode,
        firstName: this.selectedRenewalCustomer.firstName,
        lastName: this.selectedRenewalCustomer.lastName,
        gender: this.selectedRenewalCustomer.gender,
        dob: this.selectedRenewalCustomer.dob,
        phone: this.selectedRenewalCustomer.phone,
        email: this.selectedRenewalCustomer.email,
        address: this.selectedRenewalCustomer.address,
        city: this.selectedRenewalCustomer.city,
        state: this.selectedRenewalCustomer.state,
        pincode: this.selectedRenewalCustomer.pincode,
        panNumber: this.selectedRenewalCustomer.panNumber,
        billingFrequency: this.selectedRenewalCustomer.billingFrequency
      };
      this.renewalForm.customerCode = this.selectedRenewalCustomer.customerCode;
      this.customerFullName = this.selectedRenewalCustomer.fullName;

      if (basePolicy) {
        this.renewalForm.insuranceName = basePolicy.insuranceName;
        this.renewalForm.productName = basePolicy.productName;
        this.renewalForm.amount = basePolicy.amount || basePolicy.duePremium;
        this.renewalForm.duePremium = basePolicy.duePremium || basePolicy.amount;
        this.renewalForm.branch = basePolicy.branch || this.selectedAdminBranch || 'Corporate';
        this.renewalForm.rmName = basePolicy.rmName;
        this.renewalForm.associateName = basePolicy.associateName;
        this.renewalForm.pospName = basePolicy.pospName;
        this.renewalForm.vehicleRegNo = basePolicy.vehicleRegNo;
        this.renewalForm.vehicleModel = basePolicy.vehicleModel;
        this.renewalForm.mfgYear = basePolicy.mfgYear;
        this.renewalForm.vehicleType = basePolicy.vehicleType;
        this.renewalForm.idv = basePolicy.idv;
        this.renewalForm.odAmount = basePolicy.odAmount;
        this.renewalForm.tpAmount = basePolicy.tpAmount;
      }
    }

    this.renewalModalStep = 'form';
  }

  isGeneralFormat(): boolean {
    return ['Health', 'Life', 'GMC', 'GPA', 'GTL'].includes(this.selectedInsuranceType || '');
  }

  isMotorFormat(): boolean {
    return (this.selectedInsuranceType || '').toLowerCase().includes('motor');
  }

  isCommercialFormat(): boolean {
    return (this.selectedInsuranceType || '').toLowerCase().includes('commercial') || (!this.isGeneralFormat() && !this.isMotorFormat());
  }

  onCustomerNameChange(name: string) {
    this.customerFullName = name;
    if (!this.renewalForm.customer) {
      this.renewalForm.customer = {};
    }
    const trimmed = (name || '').trim();
    if (!trimmed) {
      this.renewalForm.customer.firstName = '';
      this.renewalForm.customer.lastName = '';
      return;
    }
    const parts = trimmed.split(/\s+/);
    this.renewalForm.customer.firstName = parts[0];
    this.renewalForm.customer.lastName = parts.slice(1).join(' ') || '.';
  }

  openRenewalModal(policy: any = null) {
    this.showRenewalModal = true;
    if (policy) {
      this.selectPolicyForRenewal(policy);
    } else {
      this.resetRenewalForm();
      this.selectedSection = null;
      this.selectedInsuranceType = null;
      this.renewalModalStep = 'section';
      if (this.selectedAdminBranch) {
        this.renewalForm.branch = this.selectedAdminBranch;
      }
    }
  }

  closeRenewalModal() {
    this.showRenewalModal = false;
    this.resetRenewalForm();
  }

  resetRenewalForm() {
    this.renewalSearchTerm = '';
    this.renewalSearchResults = [];
    this.renewalSearchQuery = '';
    this.searchingCustomers = false;
    this.hasSearchedCustomer = false;
    this.selectedRenewalCustomer = null;
    this.selectedRenewalPolicy = null;
    this.renewalForm = { customer: {} };
    this.customerFullName = '';
    this.newPolicyEndDate = '';
    this.selectedSection = null;
    this.selectedInsuranceType = null;
    this.renewalModalStep = 'section';
  }

  searchPoliciesForRenewal() {
    if (this.renewalSearchTerm.length < 2) {
      this.renewalSearchResults = [];
      return;
    }
    this.apiService.searchPolicies(this.renewalSearchTerm, this.selectedAdminBranch).subscribe(results => {
      this.renewalSearchResults = results;
    });
  }

  selectPolicyForRenewal(policy: any) {
    this.selectedRenewalPolicy = policy;
    const safePolicy = { ...policy };
    delete safePolicy.reminder;
    this.renewalForm = JSON.parse(JSON.stringify(safePolicy));
    if (!this.renewalForm.customer) this.renewalForm.customer = {};
    this.customerFullName = ((this.renewalForm.customer.firstName || '') + ' ' + (this.renewalForm.customer.lastName || '')).trim();
    if (this.customerFullName.endsWith('.')) {
      this.customerFullName = this.customerFullName.slice(0, -1).trim();
    }
    if (this.renewalForm.customerCode) {
      this.renewalForm.customer.customerCode = this.renewalForm.customerCode;
    }

    const t = (policy.type || '').toLowerCase();
    if (t.includes('motor') || t.includes('vehicle') || t.includes('car') || t.includes('auto')) {
      this.selectedInsuranceType = 'Motor';
    } else if (t.includes('commercial')) {
      this.selectedInsuranceType = 'Commercial';
    } else if (t.includes('gmc')) {
      this.selectedInsuranceType = 'GMC';
    } else if (t.includes('gpa')) {
      this.selectedInsuranceType = 'GPA';
    } else if (t.includes('gtl')) {
      this.selectedInsuranceType = 'GTL';
    } else if (t.includes('life')) {
      this.selectedInsuranceType = 'Life';
    } else {
      this.selectedInsuranceType = 'Health';
    }
    this.selectedSection = policy.businessType || 'Fresh';
    this.renewalModalStep = 'form';
    this.renewalSearchResults = [];
    this.renewalSearchTerm = '';

    // Fetch fresh data from server to ensure latest
    this.apiService.getPolicyById(policy.id).subscribe({
      next: (freshPolicy) => {
        this.selectedRenewalPolicy = freshPolicy;
        const freshSafe = { ...freshPolicy };
        delete freshSafe.reminder;
        this.renewalForm = JSON.parse(JSON.stringify(freshSafe));
        if (!this.renewalForm.customer) this.renewalForm.customer = {};
        this.customerFullName = ((this.renewalForm.customer.firstName || '') + ' ' + (this.renewalForm.customer.lastName || '')).trim();
        if (this.customerFullName.endsWith('.')) {
          this.customerFullName = this.customerFullName.slice(0, -1).trim();
        }
      },
      error: (err) => console.error('Error refreshing policy for renewal:', err)
    });
  }

  submitRenewal() {
    if (!this.renewalForm.customer) this.renewalForm.customer = {};

    if (this.customerFullName) {
      this.onCustomerNameChange(this.customerFullName);
    }

    if (this.selectedRenewalCustomer) {
      this.renewalForm.customer.id = this.selectedRenewalCustomer.id;
      this.renewalForm.customerCode = this.selectedRenewalCustomer.customerCode;
      this.renewalForm.customer.customerCode = this.selectedRenewalCustomer.customerCode;
      this.renewalForm.businessType = 'Renewal';
    } else if (this.renewalForm.customerCode) {
      this.renewalForm.customer.customerCode = this.renewalForm.customerCode;
    } else if (this.renewalForm.customer.customerCode) {
      this.renewalForm.customerCode = this.renewalForm.customer.customerCode;
    }

    if (!this.renewalForm.amount && this.renewalForm.duePremium) {
      this.renewalForm.amount = this.renewalForm.duePremium;
    } else if (!this.renewalForm.duePremium && this.renewalForm.amount) {
      this.renewalForm.duePremium = this.renewalForm.amount;
    }

    if (!this.renewalForm.insuranceName) {
      this.renewalForm.insuranceName = this.renewalForm.type || 'Insurance';
    }

    // Validate required fields
    if (!this.renewalForm.customer.firstName ||
      !this.renewalForm.policyNumber ||
      !this.renewalForm.type ||
      !this.renewalForm.branch ||
      !this.renewalForm.policyStartDate ||
      !this.renewalForm.policyEndDate) {
      this.notificationService.showErrorModal('Please fill mandatory fields: Customer Name, Policy Number, Policy Start Date, Expiry Date, and Branch.');
      return;
    }

    if (!this.renewalForm.customer.email) {
      const safeId = (this.renewalForm.policyNumber || Date.now().toString()).replace(/[^a-zA-Z0-9]/g, '');
      this.renewalForm.customer.email = `cust_${safeId}@insurance.local`;
    }

    // Calculate expiryDate from policyEndDate
    this.renewalForm.expiryDate = this.renewalForm.policyEndDate;
    this.renewalForm.status = 'ACTIVE';
    this.renewalForm.businessType = this.selectedSection || 'Fresh';

    if (this.selectedRenewalPolicy) {
      // Update existing policy
      const payload = { ...this.renewalForm };
      delete payload.reminder;

      this.apiService.updatePolicy(this.selectedRenewalPolicy.id, payload).subscribe({
        next: (updatedPolicy: any) => {
          this.notificationService.showSuccessToast('Policy updated successfully!');
          this.closeRenewalModal();
          this.ngOnInit(); // Refresh stats
          if (updatedPolicy) {
            this.openViewModal(updatedPolicy);
          }
        },
        error: (err) => this.notificationService.showErrorModal('Error updating policy: ' + (err.error?.message || err.message))
      });
    } else {
      // Create new policy
      this.apiService.createPolicy(this.renewalForm).subscribe({
        next: (createdPolicy: any) => {
          this.notificationService.showSuccessToast('Policy created successfully!');
          this.closeRenewalModal();
          this.ngOnInit(); // Refresh stats
          if (createdPolicy) {
            this.openViewModal(createdPolicy);
          }
        },
        error: (err) => this.notificationService.showErrorModal('Error creating policy: ' + (err.error?.message || err.message))
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
        this.notificationService.showSuccessToast('Policy details updated successfully!');
        this.selectedViewPolicy = updatedPolicy; // Update view
        this.isEditing = false;
        // Refresh lists if needed
        this.refreshTimelineCounts();
        this.loadRenewerRecords();
        if (this.selectedDate) this.onDateChange();
      },
      error: (err) => {
        console.error('Error updating policy:', err);
        this.notificationService.showErrorModal('Failed to update policy details.');
      }
    });
  }

  exportMonthlyReport(): void {
    if (!this.selectedMonthForReport) {
      this.notificationService.showErrorModal('Please select a month first (e.g. Jan 2026).');
      return;
    }
    const [yearStr, monthStr] = this.selectedMonthForReport.split('-');
    const year = parseInt(yearStr, 10);
    const month = parseInt(monthStr, 10);
    
    this.apiService.getMonthlyActivityReport(year, month, this.selectedAdminBranch).subscribe({
      next: (data) => {
        if (!data || data.length === 0) {
          this.notificationService.showErrorModal('No activity found for policies expiring in the selected month.');
          return;
        }

        const exportData = data.map((r, index) => {
          const p = r.policy || {};
          const c = p.customer || {};
          return {
            'Sr. No.': index + 1,
            'FY': p.policyEndDate ? new Date(p.policyEndDate).getFullYear() : new Date().getFullYear(),
            'Customer Name': `${c.firstName || ''} ${c.lastName || ''}`.trim(),
            'DOB': c.dob || '',
            'Contact No': c.phone || '',
            'Email ID': c.email || '',
            'Policy No': p.policyNumber || '',
            'Insurance Type': p.type || '',
            'Insurer Name': p.insuranceName || '',
            'Policy Start Date': p.policyStartDate ? new Date(p.policyStartDate).toLocaleDateString() : '',
            'Policy End Date': p.policyEndDate ? new Date(p.policyEndDate).toLocaleDateString() : '',
            'Renewal Due date': p.expiryDate ? new Date(p.expiryDate).toLocaleDateString() : '',
            'Product Name': p.productName || '',
            'Amount': p.amount || 0,
            'Premium': p.duePremium || 0,
            'RM Name': p.rmName || '',
            'Associate name': p.associateName || '',
            'Associate Code': p.associateCode || '',
            'Address 1': c.address || '',
            'City': c.city || '',
            'State': c.state || '',
            'Pin Code': c.pincode || '',
            'Car/RegNo': p.vehicleRegNo || '',
            'Model Name': p.vehicleModel || '',
            'Mgf Year': '',
            'Billing Frequency': c.billingFrequency || '',
            'PPT': '',
            'PT': '',
            'Payment Date': p.paymentDate ? new Date(p.paymentDate).toLocaleDateString() : '',
            'Branch': p.branch || '',
            'Renewer Name': r.agent || '',
            'Outcome': r.outcome || '',
            'Renewer Note': r.notes || '',
            'Update Time  Details': r.activityDate ? new Date(r.activityDate).toLocaleString() : ''
          };
        });

        const worksheet = XLSX.utils.json_to_sheet(exportData);
        const workbook = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(workbook, worksheet, 'Monthly Activity');

        XLSX.writeFile(workbook, `Monthly_Activity_Report_${this.selectedMonthForReport}.xlsx`);
      },
      error: (err) => {
        console.error('Error fetching monthly report:', err);
        this.notificationService.showErrorModal('Failed to generate monthly report.');
      }
    });
  }

  exportTodaysReport(): void {
    const todayStr = new Date().toDateString();

    const formatRecord = (r: any): any => {
      const c = r.customer;
      const rem = r.reminder;
      const actPolicy = rem?.policy || r;

      let updatedToday = false;
      if (rem && rem.lastReminderSentAt) {
        const updatedDate = new Date(rem.lastReminderSentAt).toDateString();
        if (updatedDate === todayStr) {
          updatedToday = true;
        }
      }

      const policyEndDate = actPolicy.policyEndDate;
      const policyStartDate = actPolicy.policyStartDate;
      const expiryDate = actPolicy.expiryDate;
      const insuranceName = actPolicy.insuranceName;
      const type = actPolicy.type;
      const amount = actPolicy.amount;
      const productName = actPolicy.productName;
      const rmName = actPolicy.rmName;
      const associateName = actPolicy.associateName;
      const associateCode = actPolicy.associateCode;
      const vehicleRegNo = actPolicy.vehicleRegNo;
      const vehicleModel = actPolicy.vehicleModel;
      const paymentDate = actPolicy.paymentDate;
      const branch = actPolicy.branch;

      return {
        'Sr. No.': '',
        'FY': policyEndDate ? new Date(policyEndDate).getFullYear() : new Date().getFullYear(),
        'Customer Name': c ? `${c.firstName || ''} ${c.lastName || ''}`.trim() : '',
        'DOB': c?.dob || '',
        'Contact No': c?.phone || '',
        'Email ID': c?.email || '',
        'Policy No': actPolicy.policyNumber || r.policyNumber || '',
        'Insurance Type': type || '',
        'Insurer Name': insuranceName || '',
        'Policy Start Date': policyStartDate || '',
        'Policy End Date': policyEndDate || '',
        'Renewal Due date': expiryDate || '',
        'Product Name': productName || '',
        'Amount': amount || '',
        'Premium': amount || '',
        'RM Name': rmName || '',
        'Associate name': associateName || '',
        'Associate Code': associateCode || '',
        'Address 1': c?.address || '',
        'City': c?.city || '',
        'State': c?.state || '',
        'Pin Code': '',
        'Car/RegNo': vehicleRegNo || '',
        'Model Name': vehicleModel || '',
        'Mgf Year': '',
        'Billing Frequency': c?.billingFrequency || '',
        'PPT': '',
        'PT': '',
        'Payment Date': paymentDate || '',
        'Branch': branch || '',
        'Renewer Name': (updatedToday && rem?.lastUpdatedBy && rem?.lastUpdatedBy !== 'System') ? rem.lastUpdatedBy : '',
        'Outcome': updatedToday ? (rem?.lastCallOutcome || '') : '',
        'Renewer Note': updatedToday ? (rem?.notes || '') : '',
        'Update Time  Details': (updatedToday && rem?.lastReminderSentAt) ? new Date(rem.lastReminderSentAt).toLocaleString() : ''
      };
    };

    const exportData: any[] = [];
    let index = 1;

    if (this.allTodaysExpiring && this.allTodaysExpiring.length > 0) {
      exportData.push({ 'Sr. No.': '==== EXPIRING POLICIES ====' });
      this.allTodaysExpiring.forEach((p: any) => {
        const row = formatRecord(p);
        row['Sr. No.'] = index++;
        exportData.push(row);
      });
    }

    if (this.allTodaysFollowUps && this.allTodaysFollowUps.length > 0) {
      exportData.push({ 'Sr. No.': '==== TODAYS FOLLOW-UPS ====' });
      this.allTodaysFollowUps.forEach((p: any) => {
        const row = formatRecord(p);
        row['Sr. No.'] = index++;
        exportData.push(row);
      });
    }

    if (this.allTodaysUpdated && this.allTodaysUpdated.length > 0) {
      exportData.push({ 'Sr. No.': '==== UPDATED TODAY ====' });
      this.allTodaysUpdated.forEach((p: any) => {
        const row = formatRecord(p);
        row['Sr. No.'] = index++;
        exportData.push(row);
      });
    }

    if (exportData.length === 0) {
      this.notificationService.showErrorModal("No records loaded yet. Please click on 'Today\\'s Work Count' to load the data before downloading.");
      return;
    }

    const worksheet = XLSX.utils.json_to_sheet(exportData);
    const workbook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(workbook, worksheet, 'Todays Updates');

    const formattedDate = new Date().toISOString().split('T')[0];
    XLSX.writeFile(workbook, `Daily_Renewer_Report_${formattedDate}.xlsx`);
  }
}


