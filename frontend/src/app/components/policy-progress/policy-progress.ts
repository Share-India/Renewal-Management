import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-policy-progress',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './policy-progress.html',
  styleUrls: ['./policy-progress.css']
})
export class PolicyProgress implements OnInit {
  activeTab: 'RETAIL' | 'COMMERCIAL' = 'RETAIL';
  progressData: any[] = [];
  loading: boolean = false;
  milestones = [75, 60, 45, 30, 15, 7, 3, 2, 1];
  
  currentPage: number = 1;
  pageSize: number = 50;

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
  
  get paginatedData() {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    return this.progressData.slice(startIndex, startIndex + this.pageSize);
  }
  
  get totalPages() {
    return Math.ceil(this.progressData.length / this.pageSize);
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
