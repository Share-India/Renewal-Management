import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ApiService } from '../../services/api.service';

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
  expiryFilter: string = 'Expiry: All';

  uniqueBranches: string[] = [];
  uniqueStatuses: string[] = [];
  uniqueRMs: string[] = [];
  uniqueExpiries: string[] = [];

  constructor(private apiService: ApiService) {}

  ngOnInit() {
    this.fetchData();
  }

  setTab(tab: 'RETAIL' | 'COMMERCIAL') {
    this.activeTab = tab;
    this.currentPage = 1;
    this.fetchData();
  }

  fetchData(forceReload: boolean = false) {
    this.loading = true;
    this.apiService.getPolicyProgressTracking(this.activeTab, forceReload).subscribe({
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
    const expiries = new Set<string>();
    
    this.progressData.forEach(p => {
      if (p.branch) branches.add(p.branch);
      if (p.status) statuses.add(p.status);
      if (p.rmName) rms.add(p.rmName);
      if (p.expiryDate) {
        const date = new Date(p.expiryDate);
        if (!isNaN(date.getTime())) {
          const q = Math.floor(date.getMonth() / 3) + 1;
          const year = date.getFullYear();
          expiries.add(`Q${q} ${year}`);
          // save formatted for filter matching
          p.formattedExpiryQ = `Q${q} ${year}`;
        }
      }
    });
    
    this.uniqueBranches = Array.from(branches).sort();
    this.uniqueStatuses = Array.from(statuses).sort();
    this.uniqueRMs = Array.from(rms).sort();
    this.uniqueExpiries = Array.from(expiries).sort();
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
      
      const expFilt = this.expiryFilter.replace('Expiry: ', '');
      if (expFilt !== 'All' && p.formattedExpiryQ !== expFilt) return false;
      
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
