import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';

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

  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.fetchData();
  }

  setTab(tab: 'RETAIL' | 'COMMERCIAL') {
    this.activeTab = tab;
    this.fetchData();
  }

  fetchData() {
    this.loading = true;
    this.http.get<any[]>(environment.apiUrl + '/progress/tracking?tab=' + this.activeTab)
      .subscribe({
        next: (data) => {
          this.progressData = data;
          this.loading = false;
        },
        error: (err) => {
          console.error(err);
          this.loading = false;
        }
      });
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
