import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="login-container">
      <div class="login-card">
        <div class="mb-4">
          <img src="assets/logo.png" alt="Share India" height="80" class="mb-3">
          <h2 class="fw-bold tracking-wide">Share India</h2>
          <p class="text-muted">Insurance Renewal App</p>
        </div>
        <p class="text-muted">Select your role to sign in</p>

          <!-- Role Selection -->
        <div *ngIf="!selectedRole" class="role-selection">
          <button class="btn btn-outline-primary role-btn" (click)="selectRole('RENEWER')">
            <div class="icon">🎧</div>
            Renewer
          </button>
          <button class="btn btn-outline-success role-btn" (click)="selectRole('SERVICING')">
            <div class="icon">📝</div>
            Policy Servicing
          </button>
          <button class="btn btn-outline-info role-btn" (click)="selectRole('MIS')">
            <div class="icon">📊</div>
            MIS 
          </button>
          <button class="btn btn-outline-danger role-btn" (click)="selectRole('ADMIN')">
            <div class="icon">🛡️</div>
            Admin
          </button>
        </div>

        <!-- Login Form -->
        <div *ngIf="selectedRole" class="login-form">
          <h4 class="mb-4">
            {{ selectedRole === 'ADMIN' ? 'Admin Login' : (selectedRole === 'SERVICING' ? 'Policy Servicing Login' : (selectedRole === 'MIS' ? 'MIS Login' : 'Renewer Login')) }}
          </h4>
          
          <div class="form-group">
            <label>Username</label>
            <input type="text" id="username" [(ngModel)]="username" class="form-control" placeholder="Enter username" (keyup.enter)="focusPassword()">
          </div>
          
          <div class="form-group">
            <label>Password</label>
            <input type="password" id="password" [(ngModel)]="password" class="form-control" placeholder="Enter password" (keyup.enter)="login()">
          </div>

          <div *ngIf="error" class="alert alert-danger">{{ error }}</div>

          <button class="btn btn-primary w-100 mb-3" (click)="login()" [disabled]="loading">
            {{ loading ? 'Signing in...' : 'Sign In' }}
          </button>
        
          <button class="btn btn-link text-muted" (click)="selectedRole = null">
            ← Back to Role Selection
          </button>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .login-container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background-color: #f8f9fa;
    }
    .login-card {
      background: white;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.08);
      width: 100%;
      max-width: 450px;
      text-align: center;
    }
    .role-selection {
      display: flex;
      flex-direction: column;
      gap: 15px;
      margin-top: 30px;
    }
    .role-btn {
      padding: 20px;
      text-align: left;
      display: flex;
      align-items: center;
      gap: 20px;
      font-size: 1.1rem;
      border-radius: 10px;
      transition: all 0.2s;
      background: white;
      border: 2px solid;
      cursor: pointer;
      font-weight: 500;
    }
    .btn-outline-primary { border-color: #0d6efd; color: #0d6efd; }
    .btn-outline-danger { border-color: #dc3545; color: #dc3545; }
    .btn-outline-success { border-color: #198754; color: #198754; }
    .btn-outline-info { border-color: #045161ff; color: #000000ff; }
    
    .role-btn:hover { transform: translateY(-2px); box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
    .role-btn .icon { font-size: 1.5rem; }
    
    .form-group { margin-bottom: 20px; text-align: left; }
    .form-group label { display: block; margin-bottom: 5px; font-weight: 500; color: #495057; }
    .form-control {
      width: 100%;
      padding: 12px;
      border: 1px solid #ced4da;
      border-radius: 8px;
      box-sizing: border-box;
      font-size: 1rem;
    }
    .btn-primary {
      background-color: #0d6efd;
      color: white;
      border: none;
      padding: 12px;
      border-radius: 8px;
      cursor: pointer;
      font-size: 1rem;
      width: 100%;
      font-weight: 500;
    }
    .btn-primary:disabled { background-color: #6c757d; }
    .alert-danger { color: #dc3545; margin-bottom: 15px; font-size: 0.9rem; background: #fff5f5; padding: 10px; border-radius: 6px; }
    .text-muted { color: #6c757d; }
    .mb-4 { margin-bottom: 1.5rem; }
    .mb-3 { margin-bottom: 1rem; }
    .btn-link { background: none; border: none; cursor: pointer; text-decoration: underline; }
  `]
})
export class LoginComponent {
  username = '';
  password = '';
  loading = false;
  error = '';
  selectedRole: 'ADMIN' | 'RENEWER' | 'SERVICING' | 'MIS' | null = null;

  constructor(private authService: AuthService, private router: Router) { }

  selectRole(role: 'ADMIN' | 'RENEWER' | 'SERVICING' | 'MIS') {
    this.selectedRole = role;
    this.error = '';
    this.username = '';
    this.password = '';
    setTimeout(() => {
      const usernameInput = document.getElementById('username');
      if (usernameInput) usernameInput.focus();
    }, 100);
  }

  focusPassword() {
    const passwordInput = document.getElementById('password');
    if (passwordInput) passwordInput.focus();
  }

  login() {
    this.loading = true;
    this.error = '';

    this.authService.login({ username: this.username, password: this.password })
      .subscribe({
        next: (user) => {
          if (this.selectedRole === 'ADMIN' && user.role !== 'ADMIN') {
            this.error = 'Access Denied: You are not an Admin.';
            this.authService.logout();
            this.loading = false;
            return;
          }
          if (this.selectedRole === 'SERVICING' && user.role !== 'SERVICING' && user.role !== 'ADMIN') {
            this.error = 'Access Denied: You are not authorized for Policy Servicing.';
            this.authService.logout();
            this.loading = false;
            return;
          }
          if (this.selectedRole === 'MIS' && user.role !== 'MIS' && user.role !== 'ADMIN') {
            this.error = 'Access Denied: You are not authorized for MIS Dashboard.';
            this.authService.logout();
            this.loading = false;
            return;
          }

          if (user.role === 'ADMIN') {
            this.router.navigate(['/admin']);
          } else if (user.role === 'SERVICING') {
            this.router.navigate(['/servicing']);
          } else if (user.role === 'MIS') {
            this.router.navigate(['/mis-dashboard']);
          } else {
            this.router.navigate(['/']);
          }
        },
        error: (err) => {
          console.error(err);
          this.error = 'Login Failed: HTTP ' + err.status + ' (' + err.message + '). Check if password is exactly ShareIndia@123';
          this.loading = false;
        }
      });
  }
}
