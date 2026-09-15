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
          this.loading = false;
        },
        error: (err) => {
          console.error(err);
          this.loading = false;
        }
      });
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
