import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { ApiService } from '../../services/api.service';
import { HttpClient } from '@angular/common/http';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-mis-dashboard',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './mis-dashboard.component.html',
  styleUrl: './mis-dashboard.component.css'
})
export class MisDashboardComponent implements OnInit {
  policies: any[] = [];
  pendingPolicies: any[] = [];
  updatedPolicies: any[] = [];
  filteredPolicies: any[] = [];
  searchTerm: string = '';
  loading: boolean = false;
  errorMessage: string = '';

  viewMode: 'pending' | 'updated' | 'pendingIssuance' = 'pending';
  pendingIssuancePolicies: any[] = [];
  selectedBranch: string = '';
  availableBranches: string[] = [];

  selectedPolicy: any = null; // For modal

  constructor(private apiService: ApiService, private router: Router, private http: HttpClient, public authService: AuthService) { }

  ngOnInit(): void {
    this.apiService.getBranches().subscribe(branches => {
      this.availableBranches = branches;
    });
    this.loadPolicies();
  }

  get canViewSensitiveInfo(): boolean {
    if (this.authService.hasRole('RENEWER')) {
      return false;
    }
    return this.authService.hasRole('ADMIN') ||
      this.authService.hasRole('MIS') ||
      this.authService.hasRole('POLICY_ISSUANCE') ||
      this.authService.hasRole('POLICY ISSUANCE');
  }

  loadPolicies(): void {
    this.loading = true;
    
    // Fetch both serviced history and pending issuance concurrently
    import('rxjs').then(({ forkJoin }) => {
      forkJoin({
        history: this.apiService.getServicedHistory(this.selectedBranch),
        issuance: this.apiService.getPendingIssuancePolicies(this.selectedBranch)
      }).subscribe({
        next: (data) => {
          this.policies = data.history;
          
          // Split history data based on businessType presence
          this.pendingPolicies = data.history.filter((p: any) => !p.businessType);
          this.updatedPolicies = data.history.filter((p: any) => p.businessType);
          
          // Pending issuance policies
          this.pendingIssuancePolicies = data.issuance;

          this.applyFilter();
          this.loading = false;
        },
        error: (err) => {
          console.error('Error loading MIS data', err);
          this.errorMessage = 'Failed to load MIS data.';
          this.loading = false;
        }
      });
    });
  }

  toggleView(mode: 'pending' | 'updated' | 'pendingIssuance'): void {
    this.viewMode = mode;
    this.searchTerm = ''; // Clear search on toggle? Or keep it? Let's clear for clarity.
    this.applyFilter();
  }

  filterPolicies(): void {
    this.applyFilter();
  }

  applyFilter(): void {
    let source = this.pendingPolicies;
    if (this.viewMode === 'updated') source = this.updatedPolicies;
    if (this.viewMode === 'pendingIssuance') source = this.pendingIssuancePolicies;

    if (!this.searchTerm) {
      this.filteredPolicies = source;
      return;
    }
    const lowerTerm = this.searchTerm.toLowerCase();
    this.filteredPolicies = source.filter(policy =>
      policy.policyNumber?.toLowerCase().includes(lowerTerm) ||
      policy.customer?.firstName?.toLowerCase().includes(lowerTerm) ||
      policy.customer?.lastName?.toLowerCase().includes(lowerTerm) ||
      policy.insuranceName?.toLowerCase().includes(lowerTerm) ||
      policy.vehicleRegNo?.toLowerCase().includes(lowerTerm)
    );
  }

  logout(): void {
    this.apiService.logout();
    this.router.navigate(['/login']);
  }

  // Edit Mode Logic
  isEditing: boolean = false;

  toggleEditMode(): void {
    if (this.isEditing) {
      // Cancel edit - reset selectedPolicy to original state?
      // Since we bound directly, we might need to reload or keep it simple.
      // For now, simple toggle. Ideally we would clone.
      this.isEditing = false;
    } else {
      this.isEditing = true;
    }
  }

  savePolicyChanges(): void {
    if (!this.selectedPolicy) return;

    this.apiService.updatePolicy(this.selectedPolicy.id, this.selectedPolicy).subscribe({
      next: (updatedPolicy) => {
        alert('Policy details updated successfully!');
        this.selectedPolicy = updatedPolicy; // Update view
        this.isEditing = false;
        this.loadPolicies(); // Refresh list to show updates in grid if any
      },
      error: (err) => {
        console.error('Error updating policy:', err);
        alert('Failed to update policy details.');
      }
    });
  }

  // Document Viewing Logic
  viewDetails(policy: any): void {
    this.selectedPolicy = policy;
    this.isEditing = false; // Reset edit mode on open

    // Fetch fresh data
    this.apiService.getPolicyById(policy.id).subscribe({
      next: (freshPolicy) => {
        this.selectedPolicy = freshPolicy;
        console.log('MIS Dashboard: Policy refreshed from server');
      },
      error: (err) => console.error('Error refreshing policy in MIS Dashboard:', err)
    });
  }

  downloadPaymentProof(policyId: number): void {
    this.apiService.downloadPaymentProof(policyId).subscribe({
      next: (blob: Blob) => {
        const url = window.URL.createObjectURL(blob);
        window.open(url, '_blank');
      },
      error: (err) => alert('Could not load payment proof or no document exists.')
    });
  }

  downloadPolicyDocument(policyId: number): void {
    this.apiService.downloadPolicyDocument(policyId).subscribe({
      next: (blob: Blob) => {
        const url = window.URL.createObjectURL(blob);
        window.open(url, '_blank');
      },
      error: (err) => alert('Could not load policy document or no document exists.')
    });
  }
}
