import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AuthService } from './auth.service';
import { environment } from '../../environments/environment';

@Injectable({
    providedIn: 'root'
})
export class ApiService {
    private baseUrl = environment.apiUrl;

    constructor(private http: HttpClient, private authService: AuthService) { }

    private getHeaders() {
        return this.authService.getAuthHeaders();
    }

    logout() {
        this.authService.logout();
    }

    getPoliciesForTimeline(days: number): Observable<any[]> {
        return this.http.get<any[]>(`${this.baseUrl}/renewals/timeline/${days}`, { headers: this.getHeaders() });
    }

    getFollowUpsForTimeline(days: number): Observable<any[]> {
        return this.http.get<any[]>(`${this.baseUrl}/renewals/follow-ups/${days}`, { headers: this.getHeaders() });
    }

    getAdminStats(): Observable<any> {
        return this.http.get<any>(`${this.baseUrl}/renewals/admin/stats`, { headers: this.getHeaders() });
    }

    getTodaysWork(): Observable<any[]> {
        return this.http.get<any[]>(`${this.baseUrl}/renewals/todays-work`, { headers: this.getHeaders() });
    }

    getTodaysWorkProgress(): Observable<{total: number, completed: number}> {
        return this.http.get<{total: number, completed: number}>(`${this.baseUrl}/renewals/todays-work-progress`, { headers: this.getHeaders() });
    }

    logCall(policyId: number, data: any): Observable<any> {
        return this.http.post<any>(`${this.baseUrl}/renewals/${policyId}/log-call`, data, { headers: this.getHeaders() });
    }

    getRecordsForDate(date: string): Observable<any> {
        return this.http.get<any>(`${this.baseUrl}/renewals/admin/records?date=${date}`, { headers: this.getHeaders() });
    }

    getAllCallRecords(): Observable<any[]> {
        return this.http.get<any[]>(`${this.baseUrl}/renewals/admin/call-records`, { headers: this.getHeaders() });
    }

    searchPolicies(query: string): Observable<any[]> {
        return this.http.get<any[]>(`${this.baseUrl}/renewals/search?query=${query}`, { headers: this.getHeaders() });
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
        return this.http.post<any>(`${this.baseUrl}/renewals/renew/${id}`, formData, { headers: this.getHeaders() });
    }

    createPolicy(policy: any): Observable<any> {
        return this.http.post<any>(`${this.baseUrl}/renewals/policies`, policy, { headers: this.getHeaders() });
    }

    getCallHistory(policyId: number): Observable<any[]> {
        return this.http.get<any[]>(`${this.baseUrl}/renewals/call-history/${policyId}`, { headers: this.getHeaders() });
    }

    getPendingIssuancePolicies(): Observable<any[]> {
        return this.http.get<any[]>(`${this.baseUrl}/renewals/servicing/pending`, { headers: this.getHeaders() });
    }

    getServicedHistory(): Observable<any[]> {
        return this.http.get<any[]>(`${this.baseUrl}/renewals/servicing/history`, { headers: this.getHeaders() });
    }

    issuePolicy(id: number, formData: FormData): Observable<any> {
        return this.http.post<any>(`${this.baseUrl}/renewals/servicing/issue/${id}`, formData, { headers: this.getHeaders() });
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

    getAuditLogs(id: number): Observable<any[]> {
        return this.http.get<any[]>(`${this.baseUrl}/renewals/${id}/audit-logs`, { headers: this.getHeaders() });
    }

    changePassword(data: any): Observable<any> {
        return this.http.post<any>(`${this.baseUrl}/auth/change-password`, data, { headers: this.getHeaders(), responseType: 'text' as 'json' });
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
    associateName?: string;
    associateCode?: string;
    vehicleRegNo?: string;
    vehicleModel?: string;
}
