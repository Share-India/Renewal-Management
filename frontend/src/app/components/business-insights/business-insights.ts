import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../services/auth.service';
import { ApiService } from '../../services/api.service';
import { environment } from '../../../environments/environment';

export interface CustomerInsightDTO {
  customerName: string;
  totalPolicies: number;
  policyDueStatuses: string[];
  premium: number;
  amount: number;
}

export interface ProductInsightDTO {
  productName: string;
  totalPolicies: number;
  premium: number;
}

export interface BusinessInsightsResponseDTO {
  customerInsights: CustomerInsightDTO[];
  productInsights: ProductInsightDTO[];
}

@Component({
  selector: 'app-business-insights',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './business-insights.html',
  styleUrl: './business-insights.css',
})
export class BusinessInsights implements OnInit {
  customerInsights: CustomerInsightDTO[] = [];
  productInsights: ProductInsightDTO[] = [];
  
  availableMonths: string[] = [];
  selectedMonth: string = '';
  
  branches: string[] = [];
  selectedBranch: string = 'All Branches Globally';
  
  teams: string[] = ['All Teams', 'Claims Team', 'Sales Team', 'Underwriting Team', 'RENEWER'];
  selectedTeam: string = 'All Teams';
  
  customerSearchQuery: string = '';
  customerSortOrder: 'none' | 'asc' | 'desc' = 'none';
  
  loading: boolean = true;
  
  constructor(private http: HttpClient, private authService: AuthService, private apiService: ApiService) {}

  ngOnInit(): void {
    this.generateMonths();
    const today = new Date();
    this.selectedMonth = today.toLocaleString('default', { month: 'long', year: 'numeric' });
    this.fetchBranches();
  }
  
  get filteredCustomerInsights(): CustomerInsightDTO[] {
    let filtered = [...this.customerInsights];
    
    if (this.customerSearchQuery && this.customerSearchQuery.trim() !== '') {
      const q = this.customerSearchQuery.toLowerCase().trim();
      filtered = filtered.filter(c => c.customerName.toLowerCase().includes(q));
    }
    
    if (this.customerSortOrder !== 'none') {
      filtered.sort((a, b) => {
        if (this.customerSortOrder === 'desc') {
          return b.premium - a.premium;
        } else {
          return a.premium - b.premium;
        }
      });
    }
    
    return filtered;
  }

  fetchBranches() {
    this.apiService.getBranches().subscribe({
      next: (branches) => {
        this.branches = ['All Branches Globally', ...branches];
        if (!this.branches.includes(this.selectedBranch)) {
            this.selectedBranch = 'All Branches Globally';
        }
        this.fetchInsights();
      },
      error: (err) => {
        console.error('Error fetching branches:', err);
        this.branches = ['All Branches Globally'];
        this.fetchInsights();
      }
    });
  }

  generateMonths() {
    const today = new Date();
    for (let i = -6; i <= 6; i++) {
      let d = new Date(today.getFullYear(), today.getMonth() + i, 1);
      this.availableMonths.push(d.toLocaleString('default', { month: 'long', year: 'numeric' }));
    }
  }

  onMonthChange() {
    this.fetchInsights();
  }

  onBranchChange() {
    this.fetchInsights();
  }
  
  onTeamChange() {
    this.fetchInsights();
  }

  fetchInsights() {
    this.loading = true;
    const [monthName, yearStr] = this.selectedMonth.split(' ');
    const year = parseInt(yearStr);
    const month = new Date(Date.parse(monthName + " 1, 2012")).getMonth() + 1;

    const headers = this.authService.getAuthHeaders();
    let url = `${environment.apiUrl}/admin/insights?year=${year}&month=${month}`;
    if (this.selectedBranch !== 'All Branches Globally') {
      url += `&branch=${encodeURIComponent(this.selectedBranch)}`;
    }
    if (this.selectedTeam !== 'All Teams') {
      url += `&team=${encodeURIComponent(this.selectedTeam)}`;
    }

    this.http.get<BusinessInsightsResponseDTO>(url, { headers }).subscribe({
      next: (data) => {
        this.customerInsights = data.customerInsights;
        this.productInsights = data.productInsights;
        this.loading = false;
      },
      error: (err) => {
        console.error('Error fetching insights:', err);
        this.loading = false;
      }
    });
  }

  onFilterChange() {
    this.fetchInsights();
  }

  getStatusClass(status: string): string {
    if (status.includes('-')) return 'status-badge red';
    if (status.toLowerCase().includes('today')) return 'status-badge green';
    return 'status-badge blue';
  }
}
