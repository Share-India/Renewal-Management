import { NotificationService } from '../../services/notification.service';
import { Component, OnInit, ChangeDetectorRef, ElementRef, ViewChild, HostListener } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TimelineComponent } from '../timeline/timeline.component';
import { CustomerListComponent } from '../customer-list/customer-list.component';
import { WorkProgressComponent } from '../work-progress/work-progress.component';
import { ActivatedRoute } from '@angular/router';
import { ApiService } from '../../services/api.service';
import { AuthService } from '../../services/auth.service';
import { forkJoin, of, finalize } from 'rxjs';

@Component({
  selector: 'app-renewal',
  standalone: true,
  imports: [CommonModule, FormsModule, TimelineComponent, CustomerListComponent, WorkProgressComponent],
  template: `
    <div class="container mt-4">
      <!-- Top 10 High-Value Policies Popup -->
      <div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 1055; margin-top: 60px;" *ngIf="topHighValuePolicies.length > 0">
        
        <!-- Reopen Button -->
        <div class="text-end" *ngIf="!showHighValuePopup" style="pointer-events: auto;">
          <button class="btn btn-primary shadow-lg d-flex align-items-center justify-content-center ms-auto" 
                  style="width: 40px; height: 40px; border-radius: 50%;" 
                  (click)="toggleHighValuePopup(true, $event)" 
                  title="Show Top High-Value Deals">
            <i class="bi bi-star-fill text-warning" style="pointer-events: none;"></i>
          </button>
        </div>

        <!-- Popup Content -->
        <div class="toast show bg-white shadow-lg border-0 pe-auto" role="alert" aria-live="assertive" aria-atomic="true" style="width: 360px; max-width: 95vw; border-radius: 8px; overflow: hidden; pointer-events: auto;" *ngIf="showHighValuePopup">
          <div class="toast-header bg-primary text-white border-0 py-2 px-3">
            <i class="bi bi-star-fill text-warning me-2"></i>
            <strong class="me-auto">Top High-Value Deals</strong>
            <button type="button" class="btn-close btn-close-white" (click)="toggleHighValuePopup(false, $event)" aria-label="Close"></button>
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
      <div class="header-section d-flex justify-content-between align-items-center mb-4">
        <div>
          <h2 class="fw-bold" style="color: #2c3e50;">{{ getDashboardTitle() }}</h2>
          <p class="text-muted mb-0" style="font-size: 1.1rem;">{{ getDashboardSubtitle() }}</p>
        </div>
        
        <div class="d-flex gap-2 align-items-center">
          <!-- Branch Switcher for Multi-Branch Renewers -->
          <ng-container *ngIf="availableBranches.length > 1">
            <div class="input-group shadow-sm me-2" style="width: auto;">
              <span class="input-group-text bg-white border-end-0 text-primary">
                <i class="bi bi-geo-alt-fill"></i>
              </span>
              <select class="form-select border-start-0 fw-bold" [(ngModel)]="selectedBranch" (change)="onBranchChange()">
                <option *ngFor="let branch of availableBranches" [value]="branch">{{ branch }}</option>
              </select>
            </div>
          </ng-container>

          <button class="btn btn-warning" *ngIf="isManager()" (click)="openReturnedToRenewer()">
            <i class="bi bi-arrow-return-left"></i> Returned to Renewer (75 Days)
          </button>
          <button class="btn btn-outline-dark" *ngIf="isManager()" (click)="openAddMemberModal()">
            <i class="bi bi-person-plus-fill"></i> Add Member
          </button>
          <button class="btn btn-success" *ngIf="!isTeamRole()" (click)="openTodaysWork()">
            <i class="bi bi-briefcase"></i> Today's Work
          </button>
          <button class="btn btn-primary" (click)="openRenewalModal()">
            <i class="bi bi-plus-circle"></i> Add / Edit Policy
          </button>
        </div>
      </div>

      <app-timeline [counts]="timelineCounts" [selectedDay]="selectedDay" [selectedDate]="selectedDate" [minDate]="minSelectableDate" [maxDate]="maxSelectableDate" (daySelected)="onDaySelected($event)" (dateSelected)="onTimelineDateSelected($event)" [userRole]="getEffectiveRole()" [selectedSourceTeam]="selectedSourceTeam" [isManager]="isManager()"></app-timeline>
      
      <!-- Daily Records Calendar / Date Picker Bar (Restricted to ±2 Months, only on Renewals Dashboard) -->
      <div class="card shadow-sm border-0 mb-4 mt-3" style="border-radius: 12px; background: #ffffff;" *ngIf="showDatePicker()">
        <div class="card-body py-2 px-3 d-flex flex-wrap justify-content-between align-items-center gap-2">
          <div class="d-flex align-items-center gap-2">
            <span class="badge bg-primary bg-opacity-10 text-primary p-2 rounded-circle d-flex align-items-center justify-content-center" style="width: 36px; height: 36px;">
              <i class="bi bi-calendar3 fs-6"></i>
            </span>
            <div>
              <span class="fw-bold text-dark d-block" style="font-size: 0.95rem;">📅 Daily Records View</span>
              <span class="text-muted" style="font-size: 0.75rem;">
                Select date to view expiring policies (Allowed range: {{ minSelectableDate | date:'MMM yyyy' }} – {{ maxSelectableDate | date:'MMM yyyy' }})
              </span>
            </div>
          </div>
          
          <div class="d-flex align-items-center gap-2">
            <label class="form-label mb-0 text-muted small fw-semibold text-nowrap">Expiry Date:</label>
            <input type="date" 
                   class="form-control form-control-sm border-secondary-subtle fw-semibold" 
                   style="min-width: 160px; max-width: 190px;"
                   [min]="minSelectableDate" 
                   [max]="maxSelectableDate" 
                   [(ngModel)]="selectedDate" 
                   (change)="onDateChange()"
                   title="Select date within 3-month window: last month, current month, or next month">
            <button class="btn btn-sm btn-outline-secondary d-flex align-items-center gap-1" 
                    *ngIf="selectedDate" 
                    (click)="clearDateSelection()" 
                    title="Clear selected date">
              <i class="bi bi-x-circle"></i> Clear
            </button>
          </div>
        </div>
      </div>

      <app-work-progress *ngIf="selectedDay === 'todays-work'" [branch]="selectedBranch" [sourceTeam]="selectedSourceTeam"></app-work-progress>

      <div class="row" *ngIf="selectedDay !== null || selectedDate">
        <!-- Main List: Renewals OR Post-Expiry -->
        <div class="col-12 mb-4">
          
          <!-- Row 1: Header and Search Row -->
          <div class="d-flex flex-wrap gap-3 justify-content-between align-items-center mb-3 pb-2" [ngClass]="{'border-bottom': selectedDay !== 'todays-work'}">
            <!-- Left Side: Title -->
            <div class="d-flex flex-column align-items-start">
              <h3 class="section-title mb-0 border-0 pb-0" [ngClass]="isUpcoming() ? 'text-primary' : 'text-danger'">
                <span *ngIf="selectedDay === 'todays-work' && todaysWorkTab === 'expiring'">Today's Work <span class="badge bg-primary ms-2 fs-6 fw-normal">Calls To be made Today: {{ todaysExpiring.length }}</span></span>
                <span *ngIf="selectedDay === 'todays-work' && todaysWorkTab === 'followups'" class="text-warning">Today's Follow-ups <span class="badge bg-warning text-dark ms-2 fs-6 fw-normal">Total: {{ todaysFollowUps.length }}</span></span>
                <span *ngIf="selectedDay !== 'todays-work'">{{ getSectionTitle() }}</span>
              </h3>
            </div>

            <!-- Right Side: Search Bar and Day Filter (Aligned to Right) -->
            <div class="d-flex flex-wrap gap-2 align-items-center ms-auto justify-content-end">
              <!-- Type Filter -->
              <div class="d-flex align-items-center bg-white border rounded shadow-sm overflow-visible" style="min-width: 170px; height: 38px;" #typeDropdown>
                <span class="px-2 py-2 text-muted small fw-bold bg-light border-end d-flex align-items-center h-100">
                  <i class="bi bi-tags-fill me-1"></i> Type
                </span>
                <div #typeDropdown class="dropdown flex-grow-1" style="height: 100%;" [class.show]="isDropdownOpen">
                  <button class="btn btn-white w-100 h-100 d-flex justify-content-between align-items-center border-0 rounded-0 shadow-none text-secondary fw-bold" type="button" (click)="isDropdownOpen = !isDropdownOpen; $event.stopPropagation()" style="background: white; text-align: left; padding: 0.375rem 2rem 0.375rem 0.5rem; font-size: 0.9rem;">
                    <span class="text-truncate" style="max-width: 110px;">{{ getSelectedTypesText() }}</span>
                    <i class="bi bi-chevron-down" style="position: absolute; right: 0.5rem;"></i>
                  </button>
                  <ul class="dropdown-menu dropdown-menu-end shadow-sm border-0 py-2" [class.show]="isDropdownOpen" (click)="$event.stopPropagation()">
                    <li>
                      <label class="dropdown-item d-flex align-items-center gap-2" style="cursor: pointer;">
                        <input class="form-check-input mt-0" type="checkbox" [checked]="selectedPolicyTypes.length === 0" (change)="togglePolicyType('all')">
                        <span>All Types</span>
                      </label>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li *ngFor="let t of availablePolicyTypes">
                      <label class="dropdown-item d-flex align-items-center gap-2" style="cursor: pointer;">
                        <input class="form-check-input mt-0" type="checkbox" [checked]="selectedPolicyTypes.includes(t)" (change)="togglePolicyType(t)">
                        <span>{{ t }}</span>
                      </label>
                    </li>
                  </ul>
                </div>
              </div>

              <!-- POSP Filter (Sales Team only) -->
              <div class="d-flex align-items-center bg-white border rounded shadow-sm overflow-hidden" *ngIf="isSalesManager() || isSalesUser()" style="min-width: 180px; height: 38px;">
                <span class="px-2 py-2 text-muted small fw-bold bg-light border-end d-flex align-items-center h-100">
                  <i class="bi bi-person-vcard-fill me-1 text-primary"></i> POSP
                </span>
                <select class="form-select border-0 shadow-none text-secondary fw-bold rounded-0 bg-white px-2" [(ngModel)]="selectedPospFilter" (change)="onPospFilterChange()" style="cursor: pointer; font-size: 0.9rem; height: 100%;">
                  <option value="">All POSP</option>
                  <option *ngFor="let posp of availablePospNames" [value]="posp">{{ posp }}</option>
                </select>
                <button class="btn btn-sm btn-link text-muted pe-2 text-decoration-none border-0" 
                        type="button" 
                        *ngIf="selectedPospFilter" 
                        (click)="clearPospFilter()" 
                        title="Clear POSP Filter">
                  <i class="bi bi-x-circle-fill text-danger"></i>
                </button>
              </div>

              <!-- RM Filter (Claims, Sales, Underwriting Managers only) -->
              <div class="d-flex align-items-center bg-white border rounded shadow-sm overflow-hidden" *ngIf="isManager()" style="min-width: 180px; height: 38px;">
                <span class="px-2 py-2 text-muted small fw-bold bg-light border-end d-flex align-items-center h-100">
                  <i class="bi bi-person-badge-fill me-1 text-primary"></i> RM
                </span>
                <select class="form-select border-0 shadow-none text-secondary fw-bold rounded-0 bg-white px-2" 
                        [(ngModel)]="selectedRmFilter" 
                        (change)="onRmFilterChange()" 
                        style="cursor: pointer; font-size: 0.9rem; height: 100%;">
                  <option value="">All RMs</option>
                  <option *ngFor="let rm of availableRmNames" [value]="rm">{{ rm }}</option>
                </select>
                <button class="btn btn-sm btn-link text-muted pe-2 text-decoration-none border-0" 
                        type="button" 
                        *ngIf="selectedRmFilter" 
                        (click)="clearRmFilter()" 
                        title="Clear RM Filter">
                  <i class="bi bi-x-circle-fill text-danger"></i>
                </button>
              </div>

              <!-- Search Bar -->
              <div class="input-group shadow-sm" style="width: 330px;">
                <select class="form-select border-secondary-subtle text-muted" style="max-width: 150px; background-color: #f8f9fa; font-size: 0.9rem;" [(ngModel)]="searchBy" (change)="applyFilters()">
                  <option value="customer">Cust Code / Policy / Customer</option>
                  <option value="rm">RM Name</option>
                  <option value="posp">POSP Name</option>
                </select>
                <input type="text" class="form-control border-secondary-subtle ps-2" style="font-size: 0.9rem;"
                       [placeholder]="searchBy === 'customer' ? 'Search cust code, policy #, customer...' : (searchBy === 'rm' ? 'Search by RM Name...' : 'Search by POSP Name...')" 
                       [(ngModel)]="listSearchTerm" (input)="applyFilters()">
              </div>

              <!-- Day Match Filter (Only for 60 Days View) -->
              <div class="input-group shadow-sm" style="width: 130px;" *ngIf="selectedDay === 600">
                <span class="input-group-text bg-white border-secondary-subtle text-muted fw-bold">Day</span>
                <input type="number" class="form-control border-secondary-subtle text-center" 
                       placeholder="e.g. 1" [(ngModel)]="dayFilter" (input)="applyFilters()" min="0" max="60">
              </div>
            </div>
          </div>

          <!-- Row 2: Tabs and Filters (Today's Work Only) -->
          <div *ngIf="selectedDay === 'todays-work'" class="d-flex flex-wrap gap-3 justify-content-between align-items-center mb-3 pb-3 border-bottom">
            <!-- Left Side: Tab Buttons -->
            <div class="d-flex gap-2">
              <button class="btn shadow-sm" [ngClass]="todaysWorkTab === 'expiring' ? 'btn-primary' : 'btn-outline-primary bg-white'" (click)="setTodaysWorkTab('expiring')">
                 Expiring Policies <span class="badge ms-1" [ngClass]="todaysWorkTab === 'expiring' ? 'bg-white' : 'bg-light text-primary'" [style.color]="todaysWorkTab === 'expiring' ? '#0d6efd' : null">{{ todaysExpiring.length }}</span>
              </button>
              <button class="btn shadow-sm" [ngClass]="todaysWorkTab === 'followups' ? 'btn-warning text-dark' : 'btn-outline-warning text-dark bg-white'" (click)="setTodaysWorkTab('followups')">
                 Today's Follow-ups <span class="badge ms-1" [ngClass]="todaysWorkTab === 'followups' ? 'bg-white text-dark' : 'bg-warning text-dark'">{{ todaysFollowUps.length }}</span>
              </button>
            </div>

            <!-- Right Side: Type and Premium Filters -->
            <div class="d-flex flex-wrap gap-3 align-items-center">
              <!-- Premium Filter -->
              <div class="d-flex align-items-center bg-white border rounded shadow-sm overflow-hidden">
                <span class="px-3 py-2 text-muted small fw-bold bg-light border-end d-flex align-items-center h-100">
                  <i class="bi bi-funnel-fill me-1"></i> Premium
                </span>
                <div class="btn-group h-100" role="group">
                  <button class="btn btn-sm rounded-0 border-0 py-2 px-3 fw-bold" [ngClass]="selectedPremiumRange === 'all' ? 'btn-dark text-white' : 'btn-white text-secondary'" (click)="setPremiumRange('all')">All</button>
                  <button class="btn btn-sm rounded-0 border-0 border-start py-2 px-3 fw-bold" [ngClass]="selectedPremiumRange === '0-1' ? 'btn-dark text-white' : 'btn-white text-secondary'" (click)="setPremiumRange('0-1')">0-1L</button>
                  <button class="btn btn-sm rounded-0 border-0 border-start py-2 px-3 fw-bold" [ngClass]="selectedPremiumRange === '1-3' ? 'btn-dark text-white' : 'btn-white text-secondary'" (click)="setPremiumRange('1-3')">1L-3L</button>
                  <button class="btn btn-sm rounded-0 border-0 border-start py-2 px-3 fw-bold" [ngClass]="selectedPremiumRange === '3-5' ? 'btn-dark text-white' : 'btn-white text-secondary'" (click)="setPremiumRange('3-5')">3L-5L</button>
                  <button class="btn btn-sm rounded-0 border-0 border-start py-2 px-3 fw-bold" [ngClass]="selectedPremiumRange === '5+' ? 'btn-dark text-white' : 'btn-white text-secondary'" (click)="setPremiumRange('5+')">>&nbsp;5L</button>
                </div>
              </div>
            </div>
          </div>

          <app-customer-list [policies]="policies" [loading]="loading" [adminViewAs]="adminViewAs" (dataUpdated)="onDataUpdated()"></app-customer-list>
        </div>
        
        <!-- Follow-ups List (Only visible for upcoming days, i.e., selectedDay >= 0) -->
        <div class="col-12" *ngIf="showFollowUps()">
          <h3 class="section-title text-warning">
            <i class="bi bi-telephone-fill"></i> Scheduled Follow-ups (Due {{ getFollowUpDueText() }})
          </h3>
          <app-customer-list [policies]="followUps" [loading]="loading" [adminViewAs]="adminViewAs" (dataUpdated)="onDataUpdated()"></app-customer-list>
        </div>
      </div>
      
      <div *ngIf="selectedDay === null && !selectedDate" class="text-center mt-5 empty-state">
        <div class="empty-icon"><i class="bi bi-calendar-event"></i></div>
        <h3>{{ showDatePicker() || isManager() ? 'Select a Timeline Bucket or Pick a Date' : 'Select a Timeline Bucket' }}</h3>
        <p class="text-muted">{{ showDatePicker() || isManager() ? 'Click on a day in the timeline above or pick a date to view expiring policies.' : 'Click on a day above to view tasks.' }}</p>
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

    <!-- Add Member Modal -->
    <div class="modal-overlay d-flex align-items-center justify-content-center" *ngIf="showAddMemberModal" (click)="closeAddMemberModal()" style="background: rgba(0,0,0,0.5); position: fixed; inset: 0; z-index: 1060;">
      <div class="bg-white rounded-4 shadow-lg overflow-hidden" style="width: 100%; max-width: 480px; transform: translateY(-20px); animation: slideDown 0.3s forwards;" (click)="$event.stopPropagation()">
        
        <div class="modal-header border-0 bg-primary bg-opacity-10 px-4 py-3 d-flex justify-content-between align-items-center">
          <div class="d-flex align-items-center gap-3">
            <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center" style="width: 40px; height: 40px;">
              <i class="bi bi-person-plus-fill fs-5"></i>
            </div>
            <h4 class="fw-bold mb-0 text-dark">Add Team Member</h4>
          </div>
          <button type="button" class="btn-close shadow-none" (click)="closeAddMemberModal()" aria-label="Close"></button>
        </div>
        
        <div class="modal-body px-4 py-4">
          <div class="mb-4">
            <label class="form-label text-muted fw-semibold mb-2 fs-7 text-uppercase tracking-wider">Username</label>
            <div class="input-group input-group-lg border rounded-3 overflow-hidden shadow-sm" style="background: var(--bs-gray-100)">
              <span class="input-group-text bg-transparent border-0 text-primary px-3"><i class="bi bi-person-badge"></i></span>
              <input type="text" class="form-control bg-transparent border-0 shadow-none px-2" [(ngModel)]="newMemberUsername" placeholder="e.g. john.doe">
            </div>
          </div>
          
          <div class="mb-4">
            <label class="form-label text-muted fw-semibold mb-2 fs-7 text-uppercase tracking-wider">Password</label>
            <div class="input-group input-group-lg border rounded-3 overflow-hidden shadow-sm" style="background: var(--bs-gray-100)">
              <span class="input-group-text bg-transparent border-0 text-primary px-3"><i class="bi bi-key"></i></span>
              <input type="password" class="form-control bg-transparent border-0 shadow-none px-2" [(ngModel)]="newMemberPassword" placeholder="Enter secure password">
            </div>
          </div>
          
          <div class="mb-4">
            <label class="form-label text-muted fw-semibold mb-2 fs-7 text-uppercase tracking-wider">Confirm Password</label>
            <div class="input-group input-group-lg border rounded-3 overflow-hidden shadow-sm" style="background: var(--bs-gray-100)">
              <span class="input-group-text bg-transparent border-0 text-primary px-3"><i class="bi bi-shield-check"></i></span>
              <input type="password" class="form-control bg-transparent border-0 shadow-none px-2" [(ngModel)]="newMemberConfirmPassword" placeholder="Re-enter password">
            </div>
          </div>
        </div>
        
        <div class="modal-footer border-top px-4 py-3 bg-light d-flex justify-content-end gap-2">
          <button class="btn btn-light border px-4 fw-medium text-muted rounded-pill shadow-sm" (click)="closeAddMemberModal()">Cancel</button>
          <button class="btn btn-primary px-4 fw-medium rounded-pill shadow d-flex align-items-center gap-2" (click)="submitAddMember()">
            <i class="bi bi-check2-circle"></i> Create Member
          </button>
        </div>
        
      </div>
    </div>
  `,
  styles: [`
    .mt-4 { margin-top: 1.5rem; }
    .mb-4 { margin-bottom: 1.5rem; }
    
    .header-section { 
      margin-bottom: 2rem; 
      padding-bottom: 1.5rem; 
      border-bottom: 1px solid var(--border-color);
    }
    .header-section h2 { 
      margin-bottom: 0; 
      color: var(--primary-dark); 
      font-weight: 800;
      font-size: 2rem;
      letter-spacing: -0.02em;
    }
    .header-section p {
      font-size: 1.1rem;
      color: var(--text-secondary);
      margin: 0;
    }
    
    .section-title { 
      border-bottom: 2px solid var(--border-color, #e9ecef); 
      padding-bottom: 0.75rem; 
      margin-bottom: 1.5rem;
      display: flex;
      align-items: center;
      gap: 0.75rem;
      color: #2c3e50;
      font-weight: 700;
    }
    
    .empty-state {
      padding: 3rem;
      background: var(--surface-white);
      border-radius: var(--border-radius-lg);
      box-shadow: var(--shadow-sm);
      text-align: center;
      border: 1px dashed var(--border-color);
    }
    .empty-icon { font-size: 3.5rem; margin-bottom: 1.5rem; color: var(--text-secondary); opacity: 0.5; }

    /* Renewal Modal Styles */
    .modal-overlay {
      position: fixed; top: 0; left: 0; right: 0; bottom: 0;
      background: rgba(15, 23, 42, 0.6); backdrop-filter: blur(4px);
      display: flex; align-items: center; justify-content: center; z-index: 1050;
      animation: fadeIn 0.2s ease-out;
    }
    
    .custom-modal-content {
      background: var(--surface-white);
      border-radius: var(--border-radius-lg);
      box-shadow: var(--shadow-floating);
      overflow: hidden;
      display: flex; flex-direction: column; max-height: 90vh;
      border: 1px solid rgba(255,255,255,0.2);
    }
    
    .modal-header {
      padding: 1.5rem 2rem;
      border-bottom: 1px solid var(--border-color);
      display: flex; justify-content: space-between; align-items: center;
      background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-light) 100%);
      color: white;
      box-shadow: var(--shadow-md);
    }
    .modal-header h3 { margin: 0; font-weight: 700; color: white; }
    .modal-header .btn-close { filter: invert(1) brightness(200%); opacity: 0.8; }
    .modal-header .btn-close:hover { opacity: 1; transform: scale(1.1); }
    
    .modal-body { padding: 2rem; overflow-y: auto; background: var(--bg-main); }
    .modal-footer {
      padding: 1.25rem 2rem; border-top: 1px solid var(--border-color);
      display: flex; justify-content: flex-end; background-color: var(--surface-white); gap: 1rem;
    }

    .renewal-modal { width: 850px; max-width: 95%; }
    
    .search-results {
      position: absolute; top: 100%; left: 0; right: 0;
      background: var(--surface-white);
      border: 1px solid var(--border-color);
      border-radius: 0 0 var(--border-radius-sm) var(--border-radius-sm);
      max-height: 250px; overflow-y: auto; z-index: 1000;
      box-shadow: var(--shadow-md);
    }
    .search-item {
      padding: 0.75rem 1rem; cursor: pointer; border-bottom: 1px solid var(--border-color);
      color: var(--text-primary); transition: background-color 0.2s;
    }
    .search-item:hover { background-color: var(--surface-hover); color: var(--primary-color); }
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
  `]
})
export class RenewalComponent implements OnInit {
  @ViewChild(CustomerListComponent) customerListComponent?: CustomerListComponent;
  policies: any[] = [];
  followUps: any[] = [];
  loading: boolean = false;
  selectedDay: number | string | null = null;
  selectedSourceTeam: string = '';

  selectedDate: string = '';
  minSelectableDate: string = '';
  maxSelectableDate: string = '';

  timelineCounts: { [key: number]: number } = {};

  availableBranches: string[] = [];
  selectedBranch: string = '';

  // POSP Filter (Sales)
  availablePospNames: string[] = [];
  selectedPospFilter: string = '';

  // RM Filter (Claims, Sales, Underwriting Managers)
  availableRmNames: string[] = [];
  selectedRmFilter: string = '';

  @ViewChild(WorkProgressComponent) workProgressComponent!: WorkProgressComponent;

  adminViewAs: string = '';

  constructor(
    private apiService: ApiService,
    public authService: AuthService,
    private cdr: ChangeDetectorRef,
    private route: ActivatedRoute,
    private notificationService: NotificationService
  ) {}



  getEffectiveRole(): string {
    if (this.adminViewAs === 'claims') return 'CLAIMS_MANAGER';
    if (this.adminViewAs === 'sales') return 'SALES_MANAGER';
    if (this.adminViewAs === 'underwriting') return 'UNDERWRITING_MANAGER';
    return this.authService.getCurrentUser()?.role || '';
  }

  isManager(): boolean {
    const role = this.getEffectiveRole();
    return role === 'CLAIMS_MANAGER' || role === 'SALES_MANAGER' || role === 'UNDERWRITING_MANAGER';
  }

  isClaimsUser(): boolean {
    return this.getEffectiveRole() === 'CLAIMS';
  }

  isUnderwritingUser(): boolean {
    return this.getEffectiveRole() === 'UNDERWRITING';
  }

  isSalesUser(): boolean {
    return this.getEffectiveRole() === 'SALES';
  }

  isSalesManager(): boolean {
    return this.getEffectiveRole() === 'SALES_MANAGER';
  }

  loadPospNames() {
    this.apiService.getPospNames(this.selectedBranch).subscribe({
      next: (names) => {
        this.availablePospNames = (names || []).filter(n => n && n.trim() !== '' && n.trim() !== '-');
      },
      error: (err) => console.error('Error fetching POSP names:', err)
    });
  }

  onPospFilterChange() {
    if (this.selectedPospFilter && !this.selectedDay && !this.selectedDate) {
      this.loading = true;
      this.apiService.getPoliciesByPosp(this.selectedPospFilter, this.selectedBranch)
        .pipe(finalize(() => this.loading = false))
        .subscribe({
          next: (policies: any[]) => {
            this.basePolicies = policies || [];
            this.baseFollowUps = [];
            this.applyFilters();
          },
          error: (err) => {
            console.error('Error fetching policies by POSP:', err);
            this.basePolicies = [];
            this.applyFilters();
          }
        });
    } else {
      this.applyFilters();
    }
  }

  clearPospFilter() {
    this.selectedPospFilter = '';
    this.applyFilters();
  }

  onRmFilterChange() {
    this.applyFilters();
  }

  clearRmFilter() {
    this.selectedRmFilter = '';
    this.applyFilters();
  }

  updateAvailableRmNames() {
    if (!this.isManager()) {
      this.availableRmNames = [];
      return;
    }

    const rmSet = new Set<string>();

    const source = this.selectedDay === 'todays-work' 
      ? [...this.allTodaysExpiring, ...this.allTodaysFollowUps] 
      : [...this.basePolicies, ...this.baseFollowUps];

    source.forEach(p => {
      if (this.isPolicyMatchingManagerScope(p)) {
        if (p.rmName && typeof p.rmName === 'string') {
          const trimmed = p.rmName.trim();
          if (trimmed !== '' && trimmed !== '-' && trimmed.toLowerCase() !== 'null') {
            rmSet.add(trimmed);
          }
        }
      }
    });

    this.availableRmNames = Array.from(rmSet).sort((a, b) => a.localeCompare(b));

    if (this.selectedRmFilter && !rmSet.has(this.selectedRmFilter)) {
      this.selectedRmFilter = '';
    }
  }

  isPolicyMatchingManagerScope(p: any): boolean {
    if (!this.isManager()) return true;

    if (this.selectedDate) {
      return true;
    }

    if (this.selectedSourceTeam && this.selectedSourceTeam.trim() !== '' && this.selectedSourceTeam !== 'null') {
      return true;
    }

    if (this.selectedDay === 'returned-to-renewer') return true;

    // In 60 Days View, managers can view all policies in that 60-day period
    if (this.selectedDay !== 600) {
      const role = this.getEffectiveRole();
      if (this.adminViewAs === 'claims' || role === 'CLAIMS_MANAGER') {
        if (!((p.targetTeam === 'CLAIMS' || (p.isHotSale && p.hotSaleSource === 'SALES')) && p.targetTeam !== 'RENEWER')) {
          return false;
        }
      } else if (this.adminViewAs === 'sales' || role === 'SALES_MANAGER') {
        if (!(p.targetTeam === 'SALES' && p.targetTeam !== 'RENEWER')) {
          return false;
        }
      } else if (this.adminViewAs === 'underwriting' || role === 'UNDERWRITING_MANAGER') {
        if (!((p.targetTeam === 'UNDERWRITING' || (p.isHotSale && p.hotSaleSource === 'SALES')) && p.targetTeam !== 'RENEWER')) {
          return false;
        }
      }
    }

    const user = this.authService.getCurrentUser();
    if (user) {
      const normalizedRole = (user.role || '').replace('ROLE_', '');
      if (normalizedRole === 'CLAIMS_MANAGER' || normalizedRole === 'UNDERWRITING_MANAGER') {
        if (user.assignedProductType && user.assignedProductType.trim() !== '' && user.assignedProductType !== 'null') {
          if (!p.type) return false;
          const allowedTypes = user.assignedProductType.split(',').map((s: string) => s.trim().toLowerCase());
          if (!allowedTypes.includes(p.type.trim().toLowerCase())) return false;
        }
        if (user.assignedBranch && user.assignedBranch.trim() !== '' && user.assignedBranch !== 'null') {
          if (!p.branch) return false;
          const allowedBranches = user.assignedBranch.split(',').map((s: string) => s.trim().toLowerCase());
          if (!allowedBranches.includes(p.branch.trim().toLowerCase())) return false;
        }
      }
    }

    return true;
  }



  showAddMemberModal = false;
  newMemberUsername = '';
  newMemberPassword = '';
  newMemberConfirmPassword = '';

  openAddMemberModal() {
    this.showAddMemberModal = true;
  }

  closeAddMemberModal() {
    this.showAddMemberModal = false;
    this.newMemberUsername = '';
    this.newMemberPassword = '';
    this.newMemberConfirmPassword = '';
  }

  submitAddMember() {
    if (!this.newMemberUsername || !this.newMemberPassword) return;
    if (this.newMemberPassword !== this.newMemberConfirmPassword) {
        this.notificationService.showErrorModal('Passwords do not match!');
        return;
    }

    this.apiService.createTeamUser(this.newMemberUsername, this.newMemberPassword).subscribe({
        next: (res) => {
            this.notificationService.showSuccessToast(`Team member ${res.username} created successfully!`);
            this.closeAddMemberModal();
        },
        error: (err) => {
            const msg = err.error?.message || err.error || 'Error creating user';
            this.notificationService.showErrorModal('Error creating team member: ' + msg);
        }
    });
  }

  ngOnInit() {
    this.calculateDateRange();
    this.loadPospNames();

    const user = this.authService.getCurrentUser();
    if (user && user.assignedBranch && user.assignedBranch !== 'null') {
      this.availableBranches = user.assignedBranch.split(',').map((b: string) => b.trim());
      if (this.availableBranches.length > 0) {
        this.selectedBranch = this.availableBranches[0]; // Default to first branch
      }
    }

    this.apiService.selectedSourceTeam$.subscribe(team => {
      if (this.selectedSourceTeam !== team) {
        this.selectedSourceTeam = team;
        this.selectedDate = '';
        this.refreshTimelineCounts();
        if (team && team.trim() !== '') {
          this.onDaySelected(0);
        } else {
          this.openTodaysWork();
        }
      }
    });

    this.route.paramMap.subscribe(params => {
      this.adminViewAs = params.get('managerRole') || '';
      this.apiService.adminViewAs = this.adminViewAs;
      
      this.applyFilters();
      this.refreshTimelineCounts();
      this.fetchTopHighValuePolicies();

      // Ensure API Service has selectedBranch if needed
      // (Most API calls will now take this.selectedBranch as parameter)

      // If a day is selected or it's today's work, we need to refresh that too
      if (this.selectedDay === 600) {
        this.onDaySelected(600, true);
      } else if (this.selectedDate) {
        this.onDateChange();
      } else if (this.selectedDay !== 'todays-work' && this.selectedDay !== 'high-value' && this.selectedDay !== null) {
        this.onDaySelected(this.selectedDay as number, true);
      } else if (this.selectedDay === 'todays-work') {
        this.setTodaysWorkTab(this.todaysWorkTab);
      }
    });
  }

  onBranchChange() {
    this.loadPospNames();
    this.refreshTimelineCounts();
    this.fetchTopHighValuePolicies();
    if (this.selectedDay === 600) {
      this.onDaySelected(600, true);
    } else if (this.selectedDate) {
      this.onDateChange();
    } else if (this.selectedDay !== null && this.selectedDay !== 'todays-work' && this.selectedDay !== 'high-value') {
      this.onDaySelected(this.selectedDay as number, true);
    } else if (this.selectedDay === 'todays-work') {
      this.setTodaysWorkTab(this.todaysWorkTab);
    }
  }

  refreshTimelineCounts() {
    this.apiService.getTimelineCounts(this.selectedBranch, this.selectedSourceTeam).subscribe({
      next: (counts) => {
        this.timelineCounts = counts;
      },
      error: (err) => console.error('Error fetching timeline counts', err)
    });
  }

  onDaySelected(day: number, keepSearch: boolean = false) {
    if (!keepSearch) {
      this.listSearchTerm = '';
      this.searchBy = 'customer';
    }
    
    this.selectedDay = day;
    this.loading = true;

    if (day !== 600 && this.showDatePicker()) {
      const targetDate = new Date();
      targetDate.setDate(targetDate.getDate() + day);
      const yyyy = targetDate.getFullYear();
      const mm = String(targetDate.getMonth() + 1).padStart(2, '0');
      const dd = String(targetDate.getDate()).padStart(2, '0');
      const dateStr = `${yyyy}-${mm}-${dd}`;

      if (dateStr >= this.minSelectableDate && dateStr <= this.maxSelectableDate) {
        this.selectedDate = dateStr;
      } else {
        this.selectedDate = '';
      }
    } else {
      this.selectedDate = '';
    }

    if (day === 600) {
      this.apiService.getRecordsForNext60Days().subscribe({
        next: (data) => {
          this.basePolicies = data.expiringPolicies || [];
          this.baseFollowUps = data.scheduledFollowUps || [];

          // Extract available types for dropdown
          const typesSet = new Set<string>();
          [...this.basePolicies, ...this.baseFollowUps].forEach(p => {
            if (p.type) typesSet.add(p.type);
          });
          this.availablePolicyTypes = Array.from(typesSet).sort();

          this.updateAvailableRmNames();
          this.applyFilters();
          this.loading = false;
        },
        error: (err) => {
          console.error(err);
          this.loading = false;
        }
      });
      return;
      } else {
        forkJoin({
          policies: this.apiService.getPoliciesForTimeline(day, this.selectedBranch, this.selectedSourceTeam),
          followUps: this.apiService.getFollowUpsForTimeline(day, this.selectedBranch, this.selectedSourceTeam)
        }).subscribe({
      next: (data) => {
        this.basePolicies = data.policies;
        this.baseFollowUps = data.followUps;

        // Extract available types for dropdown
        const typesSet = new Set<string>();
        [...this.basePolicies, ...this.baseFollowUps].forEach(p => {
          if (p.type) typesSet.add(p.type);
        });
        this.availablePolicyTypes = Array.from(typesSet).sort();

        this.updateAvailableRmNames();
        this.applyFilters();
        this.loading = false;
      },
      error: (err) => {
        console.error(err);
        this.loading = false;
      }
    });
    }
  }

  todaysWorkTab: 'expiring' | 'followups' = 'expiring';
  todaysExpiring: any[] = [];
  todaysFollowUps: any[] = [];
  allTodaysExpiring: any[] = [];
  allTodaysFollowUps: any[] = [];
  listSearchTerm: string = '';
  searchBy: 'customer' | 'rm' | 'posp' = 'customer';
  basePolicies: any[] = [];
  baseFollowUps: any[] = [];
  selectedPremiumRange: string = 'all';
  selectedPolicyTypes: string[] = [];
  availablePolicyTypes: string[] = [];
  dayFilter: string | number | null = null;
  isDropdownOpen: boolean = false;

  @ViewChild('typeDropdown') typeDropdownRef!: ElementRef;

  @HostListener('document:click', ['$event'])
  onClickOutside(event: Event) {
    if (this.isDropdownOpen && this.typeDropdownRef && !this.typeDropdownRef.nativeElement.contains(event.target)) {
      this.isDropdownOpen = false;
    }
  }

  showHighValuePopup: boolean = false;
  topHighValuePolicies: any[] = [];

  getSelectedTypesText(): string {
    if (this.selectedPolicyTypes.length === 0) return 'All Types';
    if (this.selectedPolicyTypes.length === 1) return this.selectedPolicyTypes[0];
    return `${this.selectedPolicyTypes.length} Types Selected`;
  }

  togglePolicyType(type: string) {
    if (type === 'all') {
      this.selectedPolicyTypes = [];
    } else {
      const idx = this.selectedPolicyTypes.indexOf(type);
      if (idx > -1) {
        this.selectedPolicyTypes.splice(idx, 1);
      } else {
        this.selectedPolicyTypes.push(type);
      }
    }
    this.applyFilters();
  }

  fetchTopHighValuePolicies() {
    this.apiService.getHighValueDeals(this.selectedBranch).subscribe({
      next: (policies) => {
        if (!policies) {
          this.topHighValuePolicies = [];
          return;
        }

        const customerMap = new Map<string, any>();

        policies.forEach(p => {
          if (!p.customer) return;

          let fullName = `${p.customer.firstName || ''} ${p.customer.lastName || ''}`.trim();
          let baseName = fullName;

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
              insuranceName: p.insuranceName || p.type,
              policyNumber: p.policyNumber,
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
    this.listSearchTerm = policy.policyNumber;
    this.searchBy = 'customer';
    
    // Ensure we are on a view that shows these records (Next 60 Days view)
    // The HTTP call inside onDaySelected will automatically call applyFilters() 
    // after it finishes, picking up the listSearchTerm we just set!
    if (this.selectedDay !== 600) {
        this.onDaySelected(600, true);
    } else {
        this.applyFilters();
    }
    
    window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
  }

  applyFilters() {
    const term = this.listSearchTerm.toLowerCase().trim();

    const searchFilterFn = (p: any) => {
      if (!term) return true;
      if (this.searchBy === 'rm') {
        return p.rmName && p.rmName.toLowerCase().includes(term);
      } else if (this.searchBy === 'posp') {
        return p.associateName && p.associateName.toLowerCase().includes(term);
      } else {
        const policyMatch = p.policyNumber && p.policyNumber.toLowerCase().includes(term);
        const codeMatch = (p.customerCode && p.customerCode.toLowerCase().includes(term)) ||
                          (p.customer?.customerCode && p.customer.customerCode.toLowerCase().includes(term));
        const firstMatch = p.customer && p.customer.firstName && p.customer.firstName.toLowerCase().includes(term);
        const lastMatch = p.customer && p.customer.lastName && p.customer.lastName.toLowerCase().includes(term);
        const fullNameMatch = p.customer && ((p.customer.firstName || '') + ' ' + (p.customer.lastName || '')).toLowerCase().includes(term);
        const pospMatch = p.associateName && p.associateName.toLowerCase().includes(term);
        return policyMatch || codeMatch || firstMatch || lastMatch || fullNameMatch || pospMatch;
      }
    };

    const pospFilterFn = (p: any) => {
      if (!this.selectedPospFilter || this.selectedPospFilter.trim() === '') return true;
      return p.associateName && p.associateName.trim().toLowerCase() === this.selectedPospFilter.trim().toLowerCase();
    };

    const rmFilterFn = (p: any) => {
      if (!this.selectedRmFilter || this.selectedRmFilter.trim() === '') return true;
      return p.rmName && p.rmName.trim().toLowerCase() === this.selectedRmFilter.trim().toLowerCase();
    };

    const assignmentFilterFn = (p: any) => {
      const user = this.authService.getCurrentUser();
      if (!user) return true;
      if (['CLAIMS', 'SALES', 'UNDERWRITING', 'CLAIMS_MEMBER', 'SALES_MEMBER', 'UNDERWRITING_MEMBER'].includes(user.role)) {
         return p.currentAssignee === user.username;
      }
      if (user.role === 'RM' && user.assignedRm && user.assignedRm.trim() !== '' && user.assignedRm !== 'null') {
        if (!p.rmName) return false;
        const allowedRms = user.assignedRm.split(',').map((s: string) => s.trim().toLowerCase());
        return allowedRms.includes(p.rmName.trim().toLowerCase());
      }
      const normalizedRole = (user.role || '').replace('ROLE_', '');
      if (normalizedRole === 'CLAIMS_MANAGER' || normalizedRole === 'UNDERWRITING_MANAGER') {
        if (user.assignedProductType && user.assignedProductType.trim() !== '' && user.assignedProductType !== 'null') {
          if (!p.type) return false;
          const allowedTypes = user.assignedProductType.split(',').map((s: string) => s.trim().toLowerCase());
          if (!allowedTypes.includes(p.type.trim().toLowerCase())) return false;
        }
        if (user.assignedBranch && user.assignedBranch.trim() !== '' && user.assignedBranch !== 'null') {
          if (!p.branch) return false;
          const allowedBranches = user.assignedBranch.split(',').map((s: string) => s.trim().toLowerCase());
          if (!allowedBranches.includes(p.branch.trim().toLowerCase())) return false;
        }
      }
      return true;
    };

    const premiumFilterFn = (p: any) => {
      if (this.selectedDay !== 'todays-work') return true;
      if (this.selectedPremiumRange === 'all') return true;
      const amt = p.amount || 0;
      if (this.selectedPremiumRange === '0-1') return amt >= 0 && amt <= 100000;
      if (this.selectedPremiumRange === '1-3') return amt > 100000 && amt <= 300000;
      if (this.selectedPremiumRange === '3-5') return amt > 300000 && amt <= 500000;
      if (this.selectedPremiumRange === '5+') return amt > 500000;
      return true;
    };

    const typeFilterFn = (p: any) => {
      if (this.selectedPolicyTypes.length === 0) return true;
      return this.selectedPolicyTypes.includes(p.type);
    };

    const dayFilterFn = (p: any, isFollowUp: boolean) => {
      if (this.selectedDay !== 600 || this.dayFilter === null || this.dayFilter === '') return true;

      const targetDate = isFollowUp ? p?.reminder?.followUpDate : p?.expiryDate;
      if (!targetDate) return false;

      let dateObj: Date;
      if (Array.isArray(targetDate)) {
        dateObj = new Date(targetDate[0], targetDate[1] - 1, targetDate[2]);
      } else {
        dateObj = new Date(targetDate);
      }

      const today = new Date();
      today.setHours(0, 0, 0, 0);
      dateObj.setHours(0, 0, 0, 0);

      const diffTime = dateObj.getTime() - today.getTime();
      const diffDays = Math.round(diffTime / (1000 * 60 * 60 * 24));

      return diffDays === Number(this.dayFilter);
    };

    const targetTeamFilterFn = (p: any) => {
        if (this.selectedSourceTeam && this.selectedSourceTeam.trim() !== '' && this.selectedSourceTeam !== 'null') { return true; }
        if (this.selectedDate) {
            // When filtering by policy expiry date, team managers can view
            // all policies expiring on that date (routed or not routed)
            if (this.isManager()) {
                return true;
            }
        }
        if (this.selectedDay === 600) {
            // When viewing next 60 days, show all policies expiring in that period
            return true;
        }

        if (!this.adminViewAs) {
            const role = this.getEffectiveRole();
            if (role === 'CLAIMS_MANAGER' || role === 'CLAIMS') {
                return (p.targetTeam === 'CLAIMS' || (p.isHotSale && p.hotSaleSource === 'SALES')) && p.targetTeam !== 'RENEWER';
            }
            if (role === 'UNDERWRITING_MANAGER' || role === 'UNDERWRITING') {
                return (p.targetTeam === 'UNDERWRITING' || (p.isHotSale && p.hotSaleSource === 'SALES')) && p.targetTeam !== 'RENEWER';
            }
            if (role === 'SALES_MANAGER' || role === 'SALES') {
                return p.targetTeam === 'SALES' && p.targetTeam !== 'RENEWER';
            }
            return true;
        }
        if (this.selectedDay === 'returned-to-renewer') return true;
        if (this.adminViewAs === 'claims') return (p.targetTeam === 'CLAIMS' || (p.isHotSale && p.hotSaleSource === 'SALES')) && p.targetTeam !== 'RENEWER';
        if (this.adminViewAs === 'sales') return p.targetTeam === 'SALES' && p.targetTeam !== 'RENEWER';
        if (this.adminViewAs === 'underwriting') return (p.targetTeam === 'UNDERWRITING' || (p.isHotSale && p.hotSaleSource === 'SALES')) && p.targetTeam !== 'RENEWER';
        return true;
    };

    if (this.selectedDay === 'todays-work') {
      const filterFn = (p: any) => searchFilterFn(p) && premiumFilterFn(p) && typeFilterFn(p) && targetTeamFilterFn(p) && assignmentFilterFn(p) && pospFilterFn(p) && rmFilterFn(p);
      this.todaysExpiring = this.allTodaysExpiring.filter(filterFn);
      this.todaysFollowUps = this.allTodaysFollowUps.filter(filterFn);
      this.policies = this.todaysWorkTab === 'expiring' ? this.todaysExpiring : this.todaysFollowUps;
    } else {
      this.policies = this.basePolicies.filter(p => searchFilterFn(p) && premiumFilterFn(p) && typeFilterFn(p) && dayFilterFn(p, false) && targetTeamFilterFn(p) && assignmentFilterFn(p) && pospFilterFn(p) && rmFilterFn(p));
      this.followUps = this.baseFollowUps.filter(p => searchFilterFn(p) && premiumFilterFn(p) && typeFilterFn(p) && dayFilterFn(p, true) && targetTeamFilterFn(p) && assignmentFilterFn(p) && pospFilterFn(p) && rmFilterFn(p));
    }
  }

  setPremiumRange(range: string) {
    this.selectedPremiumRange = range;
    this.applyFilters();
  }

  setTodaysWorkTab(tab: 'expiring' | 'followups') {
    this.todaysWorkTab = tab;
    this.policies = tab === 'expiring' ? this.todaysExpiring : this.todaysFollowUps;
  }

  openReturnedToRenewer() {
    this.selectedDate = '';
    this.listSearchTerm = '';
    this.searchBy = 'customer';
    this.selectedDay = 'returned-to-renewer';
    this.loading = true;
    this.apiService.getReturnedToRenewerPolicies().subscribe({
      next: (policies) => {
        this.basePolicies = policies;
        this.baseFollowUps = [];
        
        const typesSet = new Set<string>();
        this.basePolicies.forEach(p => {
          if (p.type) typesSet.add(p.type);
        });
        this.availablePolicyTypes = Array.from(typesSet).sort();

        this.updateAvailableRmNames();
        this.applyFilters();
        this.loading = false;
      },
      error: (err) => {
        console.error('Error fetching returned to renewer policies', err);
        this.loading = false;
      }
    });
  }

  openTodaysWork() {
    this.selectedDate = '';
    this.listSearchTerm = '';
    this.searchBy = 'customer';
    this.selectedDay = 'todays-work';
    this.loading = true;
    this.apiService.getTodaysWork(this.selectedBranch, this.selectedSourceTeam).subscribe({
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

        this.updateAvailableRmNames();
        // Apply filter initially
        this.applyFilters();

        this.followUps = [];
        this.loading = false;

        if (this.workProgressComponent) {
          this.workProgressComponent.refreshProgress();
        }
      },
      error: (err) => {
        console.error(err);
        this.loading = false;
      }
    });
  }

  calculateDateRange() {
    const now = new Date();
    const currentYear = now.getFullYear();
    const currentMonth = now.getMonth();

    // 3 months only: Last month, current month, next month
    // Min: 1st day of last month (currentMonth - 1)
    const minDateObj = new Date(currentYear, currentMonth - 1, 1);
    const minY = minDateObj.getFullYear();
    const minM = String(minDateObj.getMonth() + 1).padStart(2, '0');
    this.minSelectableDate = `${minY}-${minM}-01`;

    // Max: Last day of next month (currentMonth + 1)
    const maxDateObj = new Date(currentYear, currentMonth + 2, 0);
    const maxY = maxDateObj.getFullYear();
    const maxM = String(maxDateObj.getMonth() + 1).padStart(2, '0');
    const maxD = String(maxDateObj.getDate()).padStart(2, '0');
    this.maxSelectableDate = `${maxY}-${maxM}-${maxD}`;
  }

  onTimelineDateSelected(date: string) {
    if (date && (date < this.minSelectableDate || date > this.maxSelectableDate)) {
      this.notificationService.showErrorModal(
        `Selection restricted: Please pick a date between ${this.minSelectableDate} and ${this.maxSelectableDate} (3 months only: Last month, current month, or next month).`
      );
      this.selectedDate = '';
      this.selectedDay = null;
      return;
    }
    this.selectedDate = date;
    if (date) {
      this.selectedDay = 'custom-date';
      this.onDateChange();
    } else {
      this.clearDateSelection();
    }
  }

  onDateChange() {
    if (!this.selectedDate) {
      this.clearDateSelection();
      return;
    }

    if (this.selectedDate < this.minSelectableDate || this.selectedDate > this.maxSelectableDate) {
      this.notificationService.showErrorModal(
        `Selection restricted: Please pick a date between ${this.minSelectableDate} and ${this.maxSelectableDate} (3 months only: Last month, current month, or next month).`
      );
      this.selectedDate = '';
      return;
    }

    this.listSearchTerm = '';
    this.searchBy = 'customer';

    const selected = new Date(this.selectedDate + 'T00:00:00');
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const diffTime = selected.getTime() - today.getTime();
    const diffDays = Math.round(diffTime / (1000 * 60 * 60 * 24));

    const validBuckets = [75, 60, 45, 30, 15, 7, 3, 2, 1, 0, -1, -2, -3, -7, -15, -30, -45, -60, -75];
    if (!this.isTeamRole() && validBuckets.includes(diffDays)) {
      this.selectedDay = diffDays;
    } else {
      this.selectedDay = 'custom-date';
    }

    this.loading = true;
    this.apiService.getRecordsForDate(this.selectedDate, this.selectedBranch).subscribe({
      next: (data) => {
        this.basePolicies = data.expiringPolicies || [];
        this.baseFollowUps = data.scheduledFollowUps || [];

        const typesSet = new Set<string>();
        [...this.basePolicies, ...this.baseFollowUps].forEach(p => {
          if (p.type) typesSet.add(p.type);
        });
        this.availablePolicyTypes = Array.from(typesSet).sort();

        this.updateAvailableRmNames();
        this.applyFilters();
        this.loading = false;
      },
      error: (err) => {
        console.error('Error fetching records for date:', err);
        this.basePolicies = [];
        this.baseFollowUps = [];
        this.applyFilters();
        this.loading = false;
      }
    });
  }

  clearDateSelection() {
    this.selectedDate = '';
    this.selectedDay = null;
    this.basePolicies = [];
    this.baseFollowUps = [];
    this.policies = [];
    this.followUps = [];
    this.availablePolicyTypes = [];
    this.selectedPolicyTypes = [];
    this.availableRmNames = [];
    this.selectedRmFilter = '';
    this.listSearchTerm = '';
  }

  onDataUpdated() {
    this.refreshTimelineCounts();
    if (this.selectedDay === 'todays-work') {
      this.openTodaysWork();
    } else if (this.selectedDay === 'returned-to-renewer') {
      this.openReturnedToRenewer();
    } else if (this.selectedDate) {
      this.onDateChange();
    } else if (this.selectedDay !== null && typeof this.selectedDay === 'number') {
      this.onDaySelected(this.selectedDay);
    }
  }

  isUpcoming(): boolean {
    if (this.selectedDay === 'todays-work') return true;
    if (this.selectedDay === 'returned-to-renewer') return true;
    if (this.selectedDate) {
      const today = new Date();
      today.setHours(0, 0, 0, 0);
      const sel = new Date(this.selectedDate + 'T00:00:00');
      return sel.getTime() >= today.getTime();
    }
    return typeof this.selectedDay === 'number' && this.selectedDay >= 0;
  }

  isTeamRole(): boolean {
    const role = this.getEffectiveRole();
    if (!role) return false;
    const teamRoles = ['CLAIMS_MANAGER', 'SALES_MANAGER', 'UNDERWRITING_MANAGER', 'CLAIMS_USER', 'SALES_USER', 'UNDERWRITING_USER', 'CLAIMS_MEMBER', 'SALES_MEMBER', 'UNDERWRITING_MEMBER', 'CLAIMS', 'SALES', 'UNDERWRITING'];
    return teamRoles.includes(role);
  }

  showDatePicker(): boolean {
    if (this.isTeamRole()) return false;
    if (this.selectedSourceTeam && this.selectedSourceTeam.trim() !== '' && this.selectedSourceTeam !== 'null') return false;
    return true;
  }

  showFollowUps(): boolean {
    if (this.isTeamRole()) return false;
    if (this.selectedSourceTeam != null && this.selectedSourceTeam.trim() !== '' && this.selectedSourceTeam !== 'null') return false;
    if (this.selectedDay === 600) return false;
    if (this.showDatePicker() && this.selectedDate) return this.followUps.length > 0;
    return typeof this.selectedDay === 'number';
  }

  getSectionTitle(): string {
    if (this.listSearchTerm && this.listSearchTerm.trim() !== '') {
      return `Search Results for "${this.listSearchTerm}"`;
    }
    
    if (this.selectedDay === null && !this.selectedDate) return '';
    if (this.selectedDay === 'todays-work') return "Today's Work ";
    if (this.selectedDay === 'returned-to-renewer') return "Policies Returned to Renewer (75 Days)";

    const isTeam = this.isTeamRole();
    const isReturnsView = this.selectedSourceTeam != null && this.selectedSourceTeam.trim() !== '' && this.selectedSourceTeam !== 'null';

    if (this.selectedDay === 600) {
        return (isTeam || isReturnsView) ? 'All Tasks' : 'All Policies in Next 60 Days';
    }

    if (this.selectedDate && (this.selectedDay === 'custom-date' || typeof this.selectedDay !== 'number')) {
      const d = new Date(this.selectedDate + 'T00:00:00');
      const formatted = d.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
      return this.isUpcoming() ? `Policies Expiring on ${formatted}` : `Policies Expired on ${formatted}`;
    }

    const day = this.selectedDay as number;
    if (isTeam) {
        if (day === 0) return 'Tasks Assigned Today';
        if (day < 0) return `Tasks Assigned ${Math.abs(day)} Days Ago`;
        return `Tasks Assigned in ${day} days`;
    } else if (isReturnsView) {
        let teamName = this.selectedSourceTeam.charAt(0).toUpperCase() + this.selectedSourceTeam.slice(1).toLowerCase();
        if (day === 0) return `Returned by ${teamName} Today`;
        if (day < 0) return `Returned by ${teamName} ${Math.abs(day)} Days Ago`;
        return `Returned by ${teamName} in ${day} days`;
    } else {
        if (day === 0) return 'Upcoming Renewals (Expiring Today)';
        if (day > 0) {
          return `Upcoming Renewals (Expiring in ${day} days)`;
        } else {
          return `Post-Expiry (Expired ${Math.abs(day)} days ago)`;
        }
    }
  }

  getFollowUpDueText(): string {
    if (this.selectedDay === null && !this.selectedDate) return '';
    if (this.selectedDay === 'todays-work') return '';
    if (this.selectedDay === 600) return 'in Next 60 Days';

    if (this.selectedDate && (this.selectedDay === 'custom-date' || typeof this.selectedDay !== 'number')) {
      const d = new Date(this.selectedDate + 'T00:00:00');
      return d.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
    }

    const day = this.selectedDay as number;
    if (day === 0) return 'Today';
    return day > 0 ? `in ${day} days` : `${Math.abs(day)} days ago`;
  }

  // Add / Edit Policy Multi-Step Modal Logic
  showRenewalModal: boolean = false;
  renewalModalStep: 'section' | 'renewal-search' | 'type' | 'form' = 'section';
  selectedSection: 'Fresh' | 'Renewal' | 'Endorsement' | null = null;
  selectedInsuranceType: string | null = null;
  customerFullName: string = '';
  renewalSearchTerm: string = '';
  renewalSearchResults: any[] = [];
  renewalSearchQuery: string = '';
  searchingCustomers: boolean = false;
  hasSearchedCustomer: boolean = false;
  selectedRenewalCustomer: any = null;
  selectedRenewalPolicy: any = null;
  renewalForm: any = {
    customer: {}
  };
  newPolicyEndDate: string = '';

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
        this.renewalForm.branch = basePolicy.branch;
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
      if (this.selectedBranch) {
        this.renewalForm.branch = this.selectedBranch;
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
    this.apiService.searchPolicies(this.renewalSearchTerm).subscribe(results => {
      this.renewalSearchResults = results;
    });
  }

  selectPolicyForRenewal(policy: any) {
    this.selectedRenewalPolicy = policy;
    const safePolicy = { ...policy };
    delete safePolicy.reminder; // Prevent circular JSON error
    this.renewalForm = JSON.parse(JSON.stringify(safePolicy)); // Deep copy
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
      delete payload.reminder; // Remove reminder to avoid backend deserialization issues

      this.apiService.updatePolicy(this.selectedRenewalPolicy.id, payload).subscribe({
        next: (updatedPolicy: any) => {
          this.notificationService.showSuccessToast('Policy updated successfully!');
          this.closeRenewalModal();
          const target = updatedPolicy || payload;
          if (target && (target.id || this.selectedRenewalPolicy.id)) {
            const targetId = target.id || this.selectedRenewalPolicy.id;
            const idx = this.policies.findIndex(p => p.id === targetId);
            if (idx !== -1) {
              this.policies[idx] = target;
            }
            const baseIdx = this.basePolicies.findIndex(p => p.id === targetId);
            if (baseIdx !== -1) {
              this.basePolicies[baseIdx] = target;
            }
          }
          if (this.selectedDay === null && !this.selectedDate) {
            this.selectedDay = 0;
          }
          setTimeout(() => {
            if (this.customerListComponent) {
              this.customerListComponent.openDetailsModal(target);
            }
          }, 200);
        },
        error: (err: any) => this.notificationService.showErrorModal('Error updating policy: ' + (err.error?.message || err.message))
      });
    } else {
      // Create new policy
      this.apiService.createPolicy(this.renewalForm).subscribe({
        next: (createdPolicy: any) => {
          this.notificationService.showSuccessToast('Policy created successfully!');
          this.closeRenewalModal();
          
          if (createdPolicy) {
            this.basePolicies = [createdPolicy, ...(this.basePolicies || [])];
            this.policies = [createdPolicy, ...(this.policies || [])];

            if (this.selectedDay === null && !this.selectedDate) {
              this.selectedDay = 0;
            }

            setTimeout(() => {
              if (this.customerListComponent) {
                this.customerListComponent.openDetailsModal(createdPolicy);
              }
            }, 200);
          }
        },
        error: (err: any) => this.notificationService.showErrorModal('Error creating policy: ' + (err.error?.message || err.message))
      });
    }
  }

  getDashboardTitle(): string {
    const role = this.getEffectiveRole();
    if (role === 'CLAIMS_MANAGER') return 'Claims Manager Dashboard';
    if (role === 'CLAIMS') return 'Claims Team Dashboard';
    if (role === 'SALES_MANAGER') return 'Sales Work Dashboard';
    if (role === 'SALES') return 'Sales Team Dashboard';
    if (role === 'UNDERWRITING_MANAGER') return 'Underwriting Manager Dashboard';
    if (role === 'UNDERWRITING') return 'Underwriting Team Dashboard';
    if (role === 'RM') return 'RM Dashboard';
    return 'Policy Renewals & Follow-ups';
  }

  getDashboardSubtitle(): string {
    const role = this.getEffectiveRole();
    if (role === 'RM') return 'Manage your relationship data and follow-ups.';
    if (role === 'SALES_MANAGER') return 'Process your sales tasks and customer interactions.';
    if (this.isManager()) return 'Manage team assignments, monitor performance, and oversee policy routing.';
    if (this.isClaimsUser() || this.isUnderwritingUser() || this.isSalesUser()) return 'Process pending documents, contact customers, and complete assigned tasks.';
    return 'Manage expiring policies, track follow-ups, and process renewals efficiently.';
  }
}
