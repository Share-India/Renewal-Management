import { Injectable } from '@angular/core';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { Observable, BehaviorSubject } from 'rxjs';
import { AuthService } from './auth.service';
import { environment } from '../../environments/environment';

@Injectable({
    providedIn: 'root'
})
export class ApiService {
    private baseUrl = environment.apiUrl;

    constructor(private http: HttpClient, private authService: AuthService) { }

    public adminViewAs: string = '';
    public selectedSourceTeamSubject = new BehaviorSubject<string>('');
    public selectedSourceTeam$ = this.selectedSourceTeamSubject.asObservable();

    private getHeaders(isFileUpload: boolean = false) {
        let headers = this.authService.getAuthHeaders();
        if (isFileUpload) {
            headers = headers.delete('Content-Type');
        }
        if (this.adminViewAs) {
            headers = headers.set('X-Admin-View-As', this.adminViewAs);
        }
        return headers;
    }

    logout() {
        this.authService.logout();
    }

    getPoliciesForTimeline(days: number, branch?: string, sourceTeam?: string): Observable<any[]> {
        let params = new HttpParams();
        if (branch) params = params.set('branch', branch);
        if (sourceTeam) params = params.set('sourceTeam', sourceTeam);
        return this.http.get<any[]>(`${this.baseUrl}/renewals/timeline/${days}`, { headers: this.getHeaders(), params });
    }

    getFollowUpsForTimeline(days: number): Observable<any[]> {
        return this.http.get<any[]>(`${this.baseUrl}/renewals/follow-ups/${days}`, { headers: this.getHeaders() });
    }

    getAdminStats(branch?: string): Observable<any> {
        let url = `${this.baseUrl}/renewals/admin/stats`;
        if (branch) url += `?branch=${encodeURIComponent(branch)}`;
        return this.http.get<any>(url, { headers: this.getHeaders() });
    }

    getTimelineCounts(branch?: string, sourceTeam?: string): Observable<{ [key: number]: number }> {
        let params = new HttpParams();
        if (branch) params = params.set('branch', branch);
        if (sourceTeam) params = params.set('sourceTeam', sourceTeam);
        return this.http.get<{ [key: number]: number }>(`${this.baseUrl}/renewals/timeline-counts`, { headers: this.getHeaders(), params });
    }

    getTodaysWork(branch?: string): Observable<any[]> {
        let params = new HttpParams();
        if (branch && branch.trim() !== '') {
            params = params.set('branch', branch.trim());
        }
        return this.http.get<any[]>(`${this.baseUrl}/renewals/todays-work`, { headers: this.getHeaders(), params });
    }

    getHighValueDeals(branch?: string): Observable<any[]> {
        let params = new HttpParams();
        if (branch && branch.trim() !== '') {
            params = params.set('branch', branch.trim());
        }
        return this.http.get<any[]>(`${this.baseUrl}/renewals/high-value-deals`, { headers: this.getHeaders(), params });
    }

    getTodaysWorkProgress(branch?: string): Observable<{total: number, completed: number}> {
        let params = new HttpParams();
        if (branch && branch.trim() !== '') {
            params = params.set('branch', branch.trim());
        }
        return this.http.get<{total: number, completed: number}>(`${this.baseUrl}/renewals/todays-work-progress`, { headers: this.getHeaders(), params });
    }

    logCall(policyId: number, data: any): Observable<any> {
        return this.http.post<any>(`${this.baseUrl}/renewals/${policyId}/log-call`, data, { headers: this.getHeaders() });
    }

    getRecordsForDate(date: string, branch?: string): Observable<any> {
        let url = `${this.baseUrl}/renewals/admin/records?date=${date}`;
        if (branch) url += `&branch=${encodeURIComponent(branch)}`;
        return this.http.get<any>(url, { headers: this.getHeaders() });
    }

    getRecordsForNext60Days(branch?: string): Observable<any> {
        let url = `${this.baseUrl}/renewals/admin/records/next-60-days`;
        if (branch) url += `?branch=${encodeURIComponent(branch)}`;
        return this.http.get<any>(url, { headers: this.getHeaders() });
    }

    getAllCallRecords(branch?: string): Observable<any[]> {
        let url = `${this.baseUrl}/renewals/admin/call-records`;
        if (branch) url += `?branch=${encodeURIComponent(branch)}`;
        return this.http.get<any[]>(url, { headers: this.getHeaders() });
    }

    searchPolicies(query: string, branch?: string): Observable<any[]> {
        let url = `${this.baseUrl}/renewals/search?query=${encodeURIComponent(query)}`;
        if (branch && branch.trim() !== '') {
            url += `&branch=${encodeURIComponent(branch.trim())}`;
        }
        return this.http.get<any[]>(url, { headers: this.getHeaders() });
    }

    updatePolicy(id: number, policy: any): Observable<any> {
        return this.http.put<any>(`${this.baseUrl}/renewals/policies/${id}`, policy, { headers: this.getHeaders() });
    }

    getPolicyById(id: number): Observable<any> {
        return this.http.get<any>(`${this.baseUrl}/renewals/policies/${id}`, { headers: this.getHeaders() });
    }

    renewPolicy(id: number, newEndDate: string | null, newStartDate?: string | null, agentName?: string, lateRenewalReason?: string, paymentDetails?: any, file?: File | null): Observable<any> {
        const formData = new FormData();
        const payload = {
            newEndDate,
            newStartDate,
            agentName,
            lateRenewalReason,
            ...paymentDetails
        };
        formData.append('data', JSON.stringify(payload));
        if (file) {
            formData.append('file', file);
        }
        return this.http.post<any>(`${this.baseUrl}/renewals/renew/${id}`, formData, { headers: this.getHeaders(true) });
    }

    createPolicy(policy: any): Observable<any> {
        return this.http.post<any>(`${this.baseUrl}/renewals/policies`, policy, { headers: this.getHeaders() });
    }

    getCallHistory(policyId: number): Observable<any[]> {
        return this.http.get<any[]>(`${this.baseUrl}/renewals/call-history/${policyId}`, { headers: this.getHeaders() });
    }

    getPendingIssuancePolicies(branch?: string): Observable<any[]> {
        let url = `${this.baseUrl}/renewals/servicing/pending`;
        if (branch) url += `?branch=${encodeURIComponent(branch)}`;
        return this.http.get<any[]>(url, { headers: this.getHeaders() });
    }

    getServicedHistory(branch?: string): Observable<any[]> {
        let url = `${this.baseUrl}/renewals/servicing/history`;
        if (branch) url += `?branch=${encodeURIComponent(branch)}`;
        return this.http.get<any[]>(url, { headers: this.getHeaders() });
    }

    issuePolicy(id: number, formData: FormData): Observable<any> {
        return this.http.post<any>(`${this.baseUrl}/renewals/servicing/issue/${id}`, formData, { headers: this.getHeaders(true) });
    }

    getLateRenewals(): Observable<any[]> {
        return this.http.get<any[]>(`${this.baseUrl}/renewals/late-renewals`, { headers: this.getHeaders() });
    }

    deletePolicy(id: number): Observable<void> {
        return this.http.delete<void>(`${this.baseUrl}/renewals/policies/${id}`, { headers: this.getHeaders() });
    }

    downloadPaymentProof(id: number): Observable<Blob> {
        return this.http.get(`${this.baseUrl}/renewals/${id}/payment-proof`, {
            headers: this.getHeaders(),
            responseType: 'blob'
        });
    }

    downloadPolicyDocument(id: number): Observable<Blob> {
        return this.http.get(`${this.baseUrl}/renewals/${id}/policy-document`, {
            headers: this.getHeaders(),
            responseType: 'blob'
        });
    }

    downloadClaimsExcel(id: number): Observable<Blob> {
        return this.http.get(`${this.baseUrl}/routing/${id}/claims-excel`, {
            headers: this.getHeaders(),
            responseType: 'blob'
        });
    }

    downloadClaimsPdf(id: number): Observable<Blob> {
        return this.http.get(`${this.baseUrl}/routing/${id}/claims-pdf`, {
            headers: this.getHeaders(),
            responseType: 'blob'
        });
    }

    downloadUnderwritingDoc(id: number): Observable<Blob> {
        return this.http.get(`${this.baseUrl}/routing/${id}/underwriting-doc`, {
            headers: this.getHeaders(),
            responseType: 'blob'
        });
    }

    uploadTeamDocuments(policyId: number, formData: FormData): Observable<any> {
        return this.http.post(`${this.baseUrl}/routing/${policyId}/upload-team-documents`, formData, { headers: this.getHeaders(true) });
    }

    downloadTeamDocument(documentId: number): Observable<Blob> {
        return this.http.get(`${this.baseUrl}/routing/document/${documentId}/download`, {
            headers: this.getHeaders(),
            responseType: 'blob'
        });
    }

    deleteTeamDocument(documentId: number): Observable<any> {
        return this.http.delete(`${this.baseUrl}/routing/document/${documentId}`, { headers: this.getHeaders() });
    }

    getAuditLogs(id: number): Observable<any[]> {
        return this.http.get<any[]>(`${this.baseUrl}/renewals/${id}/audit-logs`, { headers: this.getHeaders() });
    }

    changePassword(data: any): Observable<any> {
        return this.http.post<any>(`${this.baseUrl}/auth/change-password`, data, { headers: this.getHeaders(), responseType: 'text' as 'json' });
    }

    getBranches(): Observable<string[]> {
        return this.http.get<string[]>(`${this.baseUrl}/renewals/branches`, { headers: this.getHeaders() });
    }

    createBranch(branch: {name: string}): Observable<any> {
        return this.http.post<any>(`${this.baseUrl}/renewals/branches`, branch, { headers: this.getHeaders() });
    }

    getCustomersByBranch(branch: string): Observable<string[]> {
        return this.http.get<string[]>(`${this.baseUrl}/admin/customers-by-branch?branch=${encodeURIComponent(branch)}`, { headers: this.getHeaders() });
    }

    getRmNames(branch?: string): Observable<string[]> {
        let url = `${this.baseUrl}/admin/rm-names`;
        if (branch) url += `?branch=${encodeURIComponent(branch)}`;
        return this.http.get<string[]>(url, { headers: this.getHeaders() });
    }

  sendCustomerEmail(policyId: number): Observable<any> {
    return this.http.post(`${this.baseUrl}/renewals/${policyId}/send-email`, {}, { headers: this.getHeaders() });
  }

  sendRmEmail(policyId: number): Observable<any> {
    return this.http.post(`${this.baseUrl}/renewals/${policyId}/email-rm`, {}, { headers: this.getHeaders() });
  }

  saveRmUpdate(policyId: number, rmUpdate: string): Observable<any> {
    return this.http.post(`${this.baseUrl}/renewals/${policyId}/rm-update`, { rmUpdate }, { headers: this.getHeaders() });
  }
  getRenewerMonthlyStats(date?: string, agentName?: string): Observable<any[]> {
    let url = `${this.baseUrl}/renewals/admin/renewer-stats`;
    const params: string[] = [];
    if (date) params.push(`date=${encodeURIComponent(date)}`);
    if (agentName) params.push(`agentName=${encodeURIComponent(agentName)}`);
    if (params.length > 0) {
      url += '?' + params.join('&');
    }
    return this.http.get<any[]>(url, { headers: this.getHeaders() });
  }

  // Cross-Team Routing
  routePolicy(policyId: number, targetTeam: string | null, assignedUser?: string | null, sourceTeam?: string | null): Observable<any> {
    const payload: any = { targetTeam };
    if (assignedUser !== undefined && assignedUser !== null) {
      payload.assignedUser = assignedUser;
    }
    if (sourceTeam) {
      payload.sourceTeam = sourceTeam;
    }
    return this.http.post(`${this.baseUrl}/routing/${policyId}/route`, payload, { headers: this.getHeaders() });
  }

  uploadClaimsFiles(policyId: number, excelFiles?: File | null, pdfFiles?: File | null, note?: string): Observable<any> {
    const formData = new FormData();
    if (excelFiles) formData.append('excelFiles', excelFiles);
    if (pdfFiles) formData.append('pdfFiles', pdfFiles);
    if (note) formData.append('note', note);
    
    return this.http.post(`${this.baseUrl}/routing/${policyId}/upload-claims`, formData, { headers: this.getHeaders(true) });
  }

  uploadUnderwriting(policyId: number, docFile?: File, note?: string): Observable<any> {
    const formData = new FormData();
    if (docFile) formData.append('docFile', docFile);
    if (note) formData.append('note', note);
    
    return this.http.post(`${this.baseUrl}/routing/${policyId}/upload-underwriting`, formData, { headers: this.getHeaders(true) });
  }

  addSalesNote(policyId: number, note: string): Observable<any> {
    return this.http.post(`${this.baseUrl}/routing/${policyId}/sales-note`, { note }, { headers: this.getHeaders() });
  }

  deleteDocument(policyId: number, docType: string): Observable<any> {
    return this.http.delete(`${this.baseUrl}/routing/${policyId}/document/${docType}`, { headers: this.getHeaders() });
  }

  getUsers(): Observable<any[]> {
    return this.http.get<any[]>(`${this.baseUrl}/routing/users`, { headers: this.getHeaders() });
  }

  createTeamUser(username: string, password: string): Observable<any> {
    return this.http.post(`${this.baseUrl}/routing/team/create-user`, { username, password }, { headers: this.getHeaders() });
  }
}

export interface Customer {
    id: number;
    firstName: string;
    lastName: string;
    email: string;
    phone: string;
    billingFrequency?: string;
}

export interface Policy {
    id: number;
    policyNumber: string;
    customer: Customer;
    type: string;
    amount: number;
    expiryDate: string;
    status: string;
    reminder?: any;

    // New Fields
    insuranceName?: string;
    policyStartDate?: string;
    policyEndDate?: string;
    productName?: string;
    duePremium?: number;
    rmName?: string;
    rmEmail?: string;
    associateName?: string;
    associateCode?: string;
    vehicleRegNo?: string;
    vehicleModel?: string;
}
