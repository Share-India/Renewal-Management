import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { environment } from '../../../environments/environment';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-policy-progress',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './policy-progress.html',
  styleUrls: ['./policy-progress.css']
})
export class PolicyProgress implements OnInit {
  activeTab: 'RETAIL' | 'COMMERCIAL' = 'RETAIL';
  progressData: any[] = [];
  loading: boolean = false;
  
  milestones = [
    { day: 75, label: 'first notice' },
    { day: 60, label: 'rm warning' },
    { day: 45, label: 'warm follow-up' },
    { day: 30, label: 'offer window' },
    { day: 15, label: 'escalation' },
    { day: 7, label: 'urgent call' },
    { day: 3, label: 'pre-lapse' },
    { day: 2, label: 'final sms' },
    { day: 1, label: 'lapse eve' }
  ];
  
  currentPage: number = 1;
  pageSize: number = 10;
  
  searchTerm: string = '';
  branchFilter: string = 'All Branches (Global)';
  statusFilter: string = 'All';
  rmFilter: string = 'All Agents';

  uniqueBranches: string[] = [];
  uniqueStatuses: string[] = [];
  uniqueRMs: string[] = [];

  constructor(private http: HttpClient, private authService: AuthService) {}

  ngOnInit() {
    this.fetchData();
  }

  setTab(tab: 'RETAIL' | 'COMMERCIAL') {
    this.activeTab = tab;
    this.currentPage = 1;
    this.fetchData();
  }

  fetchData() {
    this.loading = true;
    this.http.get<any[]>(environment.apiUrl + '/progress/tracking?tab=' + this.activeTab, { headers: this.authService.getAuthHeaders() })
      .subscribe({
        next: (data) => {
          this.progressData = data || [];
          this.extractDropdowns();
          this.loading = false;
        },
        error: (err) => {
          console.error(err);
          this.loading = false;
        }
      });
  }
  
  extractDropdowns() {
    const branches = new Set<string>();
    const statuses = new Set<string>();
    const rms = new Set<string>();
    
    this.progressData.forEach(p => {
      if (p.branch) branches.add(p.branch);
      if (p.status) statuses.add(p.status);
      if (p.rmName) rms.add(p.rmName);
    });
    
    this.uniqueBranches = Array.from(branches).sort();
    this.uniqueStatuses = Array.from(statuses).sort();
    this.uniqueRMs = Array.from(rms).sort();
  }
  
  get filteredData() {
    return this.progressData.filter(p => {
      if (this.searchTerm) {
        const term = this.searchTerm.toLowerCase();
        const matchPol = p.policyNumber?.toLowerCase().includes(term);
        const matchCust = p.customerName?.toLowerCase().includes(term);
        const matchRm = p.rmName?.toLowerCase().includes(term);
        if (!matchPol && !matchCust && !matchRm) return false;
      }
      
      if (this.branchFilter !== 'All Branches (Global)' && p.branch !== this.branchFilter) return false;
      
      const stFilter = this.statusFilter.replace('Renewal Status: ', '');
      if (stFilter !== 'All' && p.status !== stFilter) return false;
      
      const rmFilt = this.rmFilter.replace('Assigned RM: ', '');
      if (rmFilt !== 'All Agents' && p.rmName !== rmFilt) return false;
      
      return true;
    });
  }
  
  get paginatedData() {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    return this.filteredData.slice(startIndex, startIndex + this.pageSize);
  }
  
  get totalPages() {
    return Math.ceil(this.filteredData.length / this.pageSize);
  }

  nextPage() {
    if (this.currentPage < this.totalPages) this.currentPage++;
  }

  prevPage() {
    if (this.currentPage > 1) this.currentPage--;
  }

  hasCheck(checks: any, key: string): boolean {
    if (!checks) return false;
    if (key === 'Contacted') return checks[key] !== null;
    return !!checks[key];
  }

  getContactData(checks: any): any {
    return checks && checks['Contacted'] ? checks['Contacted'] : null;
  }
}
