import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, tap } from 'rxjs';
import { Router } from '@angular/router';

@Injectable({
    providedIn: 'root'
})
export class AuthService {
    private baseUrl = 'http://localhost:8080/api';
    private currentUserKey = 'currentUser';

    constructor(private http: HttpClient, private router: Router) { }

    login(credentials: any): Observable<any> {
        const headers = new HttpHeaders({
            'Authorization': 'Basic ' + btoa(credentials.username + ':' + credentials.password)
        });

        return this.http.get<any>(`${this.baseUrl}/auth/login`, { headers }).pipe(
            tap(user => {
                // Store user details and basic auth header for future requests - SESSION ONLY
                user.authHeader = 'Basic ' + btoa(credentials.username + ':' + credentials.password);
                sessionStorage.setItem(this.currentUserKey, JSON.stringify(user));
            })
        );
    }

    logout() {
        sessionStorage.removeItem(this.currentUserKey);
        this.router.navigate(['/login']);
    }

    getCurrentUser() {
        const userStr = sessionStorage.getItem(this.currentUserKey);
        return userStr ? JSON.parse(userStr) : null;
    }

    isLoggedIn(): boolean {
        return !!this.getCurrentUser();
    }

    isAdmin(): boolean {
        const user = this.getCurrentUser();
        return user && user.role === 'ADMIN';
    }

    hasRole(role: string): boolean {
        const user = this.getCurrentUser();
        return user && user.role === role;
    }

    getAuthHeaders(): HttpHeaders {
        const user = this.getCurrentUser();
        return user ? new HttpHeaders({ 'Authorization': user.authHeader }) : new HttpHeaders();
    }

    createUser(user: any): Observable<any> {
        return this.http.post<any>(`${this.baseUrl}/admin/users`, user, { headers: this.getAuthHeaders() });
    }
    getUsers(): Observable<any[]> {
        return this.http.get<any[]>(`${this.baseUrl}/admin/users`, { headers: this.getAuthHeaders() });
    }
    deleteUser(id: number): Observable<any> {
        return this.http.delete(`${this.baseUrl}/admin/users/${id}`, { headers: this.getAuthHeaders() });
    }
}
