import { Component, ViewChild, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TimelineComponent } from '../timeline/timeline.component';
import { CustomerListComponent } from '../customer-list/customer-list.component';
import { WorkProgressComponent } from '../work-progress/work-progress.component';
import { ApiService } from '../../services/api.service';
import { forkJoin, of } from 'rxjs';

@Component({
  selector: 'app-renewal',
  standalone: true,
  imports: [CommonModule, FormsModule, TimelineComponent, CustomerListComponent, WorkProgressComponent],
  template: `
    <div class="container mt-4">
      <div class="header-section d-flex justify-content-between align-items-center mb-4">
        <div>
          <h2>Renewal Management Console</h2>
          <p class="text-muted">Centralized hub for tracking policy expiries and managing client follow-ups</p>
        </div>
        <div class="d-flex gap-2">
          <button class="btn btn-success" (click)="openTodaysWork()">
            <i class="bi bi-briefcase"></i> Today's Work
          </button>
          <button class="btn btn-primary" (click)="openRenewalModal()">
            <i class="bi bi-plus-circle"></i> Add / Edit Policy
          </button>
        </div>
      </div>

      <app-timeline [counts]="timelineCounts" (daySelected)="onDaySelected($event)"></app-timeline>
      
      <app-work-progress *ngIf="selectedDay === 'todays-work'"></app-work-progress>

      <div class="row" *ngIf="selectedDay !== null">
        <!-- Main List: Renewals OR Post-Expiry -->
        <div class="col-12 mb-4">
          <h3 class="section-title" [ngClass]="isUpcoming() ? 'text-primary' : 'text-danger'">
            <span *ngIf="selectedDay === 'todays-work' && todaysWorkTab === 'expiring'">Today's Work <span class="badge bg-primary ms-2 fs-6 fw-normal">Calls To be made Today: {{ todaysExpiring.length }}</span></span>
            <span *ngIf="selectedDay === 'todays-work' && todaysWorkTab === 'followups'" class="text-warning">Today's Follow-ups <span class="badge bg-warning text-dark ms-2 fs-6 fw-normal">Total: {{ todaysFollowUps.length }}</span></span>
            <span *ngIf="selectedDay !== 'todays-work'">{{ getSectionTitle() }}</span>
          </h3>

          <div *ngIf="selectedDay === 'todays-work'" class="mb-4 d-flex gap-2">
            <button class="btn" [ngClass]="todaysWorkTab === 'expiring' ? 'btn-primary' : 'btn-outline-primary'" (click)="setTodaysWorkTab('expiring')">
               Expiring Policies <span class="badge bg-light text-primary ms-1">{{ todaysExpiring.length }}</span>
            </button>
            <button class="btn" [ngClass]="todaysWorkTab === 'followups' ? 'btn-warning text-dark' : 'btn-outline-warning text-dark'" (click)="setTodaysWorkTab('followups')">
               Today's Follow-ups <span class="badge ms-1" [ngClass]="todaysWorkTab === 'followups' ? 'bg-white text-dark' : 'bg-warning text-dark'">{{ todaysFollowUps.length }}</span>
            </button>
          </div>

          <app-customer-list [policies]="policies" [loading]="loading" (dataUpdated)="onDataUpdated()"></app-customer-list>
        </div>
        
        <!-- Follow-ups List (Only visible for upcoming days, i.e., selectedDay >= 0) -->
        <div class="col-12" *ngIf="showFollowUps()">
          <h3 class="section-title text-warning">
            <i class="bi bi-telephone-fill"></i> Scheduled Follow-ups (Due {{ getFollowUpDueText() }})
          </h3>
          <app-customer-list [policies]="followUps" [loading]="loading" (dataUpdated)="onDataUpdated()"></app-customer-list>
        </div>
      </div>
      
      <div *ngIf="selectedDay === null" class="text-center mt-5 empty-state">
        <div class="empty-icon">📅</div>
        <h3>Select a Timeline Bucket</h3>
        <p class="text-muted">Click on a day above to view expiring policies and scheduled calls.</p>
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
                  <small class="d-block text-muted">{{ result.policyNumber }} - {{ result.insuranceName }}</small>
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
                <label class="form-label">POSP Name</label>
                <input type="text" class="form-control" [(ngModel)]="renewalForm.associateName" placeholder="Enter POSP name">
              </div>
              <div class="col-md-6">
                <label class="form-label">POSP Code</label>
                <input type="text" class="form-control" [(ngModel)]="renewalForm.associateCode" placeholder="Enter POSP code">
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
  `,
  styles: [`
    .mt-4 { margin-top: 1.5rem; }
    .mb-4 { margin-bottom: 1.5rem; }
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
    .section-title { 
      border-bottom: 2px solid #dee2e6; 
      padding-bottom: 10px; 
      margin-bottom: 15px;
      display: flex;
      align-items: center;
      gap: 10px;
    }
    .text-primary { color: #0d6efd; }
    .text-danger { color: #dc3545; }
    .text-warning { color: #4d3900ff; text-shadow: 0px 0px 1px #997404; }
    
    .empty-state {
      padding: 40px;
      background: white;
      border-radius: 12px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }
    .empty-icon { font-size: 3rem; margin-bottom: 1rem; }

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
  `]
})
export class RenewalComponent implements OnInit {
  policies: any[] = [];
  followUps: any[] = [];
  loading: boolean = false;
  selectedDay: number | string | null = null;
  timelineCounts: { [key: number]: number } = {};

  @ViewChild(WorkProgressComponent) workProgressComponent!: WorkProgressComponent;

  constructor(private apiService: ApiService) { }

  ngOnInit() {
    this.refreshTimelineCounts();
  }

  refreshTimelineCounts() {
    this.apiService.getTimelineCounts().subscribe({
      next: (counts) => {
        this.timelineCounts = counts;
      },
      error: (err) => console.error('Error fetching timeline counts', err)
    });
  }

  onDaySelected(day: number) {
    this.selectedDay = day;
    this.loading = true;

    forkJoin({
      policies: this.apiService.getPoliciesForTimeline(day),
      followUps: this.apiService.getFollowUpsForTimeline(day)
    }).subscribe({
      next: (data) => {
        this.policies = data.policies;
        this.followUps = (data.followUps as any[]).map((r: any) => {
          const p = r.policy;
          p.reminder = r;
          return p;
        });
        this.loading = false;
      },
      error: (err) => {
        console.error(err);
        this.loading = false;
      }
    });
  }

  todaysWorkTab: 'expiring' | 'followups' = 'expiring';
  todaysExpiring: any[] = [];
  todaysFollowUps: any[] = [];

  setTodaysWorkTab(tab: 'expiring' | 'followups') {
    this.todaysWorkTab = tab;
    this.policies = tab === 'expiring' ? this.todaysExpiring : this.todaysFollowUps;
  }

  openTodaysWork() {
    this.selectedDay = 'todays-work';
    this.loading = true;
    this.apiService.getTodaysWork().subscribe({
      next: (policies) => {
        const todayStr = new Date().toISOString().split('T')[0];
        
        const normalizeDate = (val: any) => {
            if (!val) return '';
            if (Array.isArray(val)) return `${val[0]}-${String(val[1]).padStart(2, '0')}-${String(val[2]).padStart(2, '0')}`;
            return String(val).substring(0, 10);
        };

        this.todaysFollowUps = policies.filter((p: any) => {
           if (!p.reminder || !p.reminder.followUpDate) return false;
           return normalizeDate(p.reminder.followUpDate) <= todayStr;
        });
        
        this.todaysExpiring = policies.filter((p: any) => {
           if (!p.reminder || !p.reminder.followUpDate) return true;
           return normalizeDate(p.reminder.followUpDate) > todayStr;
        });

        this.policies = this.todaysWorkTab === 'expiring' ? this.todaysExpiring : this.todaysFollowUps;
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

  onDataUpdated() {
    this.refreshTimelineCounts();
    if (this.selectedDay === 'todays-work') {
      this.openTodaysWork();
    } else if (this.selectedDay !== null && typeof this.selectedDay === 'number') {
      this.onDaySelected(this.selectedDay);
    }
  }

  isUpcoming(): boolean {
    if (this.selectedDay === 'todays-work') return true;
    return typeof this.selectedDay === 'number' && this.selectedDay >= 0;
  }

  showFollowUps(): boolean {
    return typeof this.selectedDay === 'number' && this.selectedDay >= 0;
  }

  getSectionTitle(): string {
    if (this.selectedDay === null) return '';
    if (this.selectedDay === 'todays-work') return "Today's Work ";

    const day = this.selectedDay as number;
    if (day === 0) return 'Upcoming Renewals (Expiring Today)';
    if (day > 0) {
      return `Upcoming Renewals (Expiring in ${day} days)`;
    } else {
      return `Post-Expiry (Expired ${Math.abs(day)} days ago)`;
    }
  }

  getFollowUpDueText(): string {
    if (this.selectedDay === null) return '';
    if (this.selectedDay === 'todays-work') return '';

    const day = this.selectedDay as number;
    if (day === 0) return 'Today';
    return day > 0 ? `in ${day} days` : `${Math.abs(day)} days ago`;
  }

  // Renewal Modal Logic
  showRenewalModal: boolean = false;
  renewalSearchTerm: string = '';
  renewalSearchResults: any[] = [];
  selectedRenewalPolicy: any = null;
  renewalForm: any = {
    customer: {}
  };
  newPolicyEndDate: string = '';

  openRenewalModal() {
    this.showRenewalModal = true;
    this.resetRenewalForm();
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
    this.renewalForm = JSON.parse(JSON.stringify(policy)); // Deep copy
    this.renewalSearchResults = [];
    this.renewalSearchTerm = ''; // Clear search to hide dropdown
  }

  submitRenewal() {
    // Logic for Start Date based on Policy Type
    if (this.renewalForm.type === 'Life Insurance') {
      // Start date is next day of expiry (backend handles this, but we can pre-fill for UI)
      // Actually, let's let backend handle it or force it here.
      // If it's a new policy, user sets it. If it's renewal (edit), we might want to lock it?
      // But this is "Add / Edit", so user can change it.
    } else if (this.renewalForm.type === 'Health Insurance') {
      // Health: Start date is today if not set
      if (!this.renewalForm.policyStartDate) {
        this.renewalForm.policyStartDate = new Date().toISOString().split('T')[0];
      }
    }

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
      const payload = { ...this.renewalForm };
      delete payload.reminder; // Remove reminder to avoid backend deserialization issues

      this.apiService.updatePolicy(this.selectedRenewalPolicy.id, payload).subscribe({
        next: () => {
          const newExpiryDate = new Date(this.renewalForm.policyEndDate);
          const today = new Date();
          const daysUntilExpiry = Math.floor((newExpiryDate.getTime() - today.getTime()) / (1000 * 60 * 60 * 24));

          alert(`Policy updated successfully!\n\nNew expiry date: ${newExpiryDate.toLocaleDateString()}\nDays until expiry: ${daysUntilExpiry}\n\nThe policy has been moved to the appropriate timeline bucket.`);
          this.closeRenewalModal();
          // Refresh current view
          if (this.selectedDay === 'todays-work') {
            this.openTodaysWork();
          } else if (this.selectedDay !== null) {
            this.onDaySelected(this.selectedDay as number);
          }
          // Also refresh the timeline buckets to update counts
          window.location.reload();
        },
        error: (err: any) => alert('Error updating policy: ' + err.message)
      });
    } else {
      // Create new policy
      this.apiService.createPolicy(this.renewalForm).subscribe({
        next: () => {
          alert('Policy created successfully!');
          this.closeRenewalModal();
          // Refresh the page to update timeline buckets and counts
          window.location.reload();
        },
        error: (err: any) => alert('Error creating policy: ' + err.message)
      });
    }
  }
}
