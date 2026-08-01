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
    <div class="login-wrapper">
      <header class="app-header">
        <div class="header-logo-container">
          <img src="assets/logo.png" alt="Share India Logo" class="header-logo" />
          <div class="header-title">Share <span style="color: #dc3545;">India</span> Insurance</div>
        </div>
      </header>
      
      <div class="glass-panel main-container" *ngIf="!selectedRole">
        <div class="header-section text-center">
          <h1 class="headline-title">Welcome back. Select your workspace.</h1>
          <p class="headline-subtitle">Choose your specialized role portal to access dedicated tools, secure records, and workflow management for the insurance renewal lifecycle.</p>
        </div>

        <div class="role-grid">
          <button class="glass-card" (click)="selectRole('RENEWER')">
            <div class="icon-wrapper"><i class="bi bi-arrow-repeat"></i></div>
            <div>
              <h3 class="role-title">Renewer</h3>
              <p class="role-desc">Manage active renewals</p>
            </div>
          </button>
          
          <button class="glass-card" (click)="selectRole('SERVICING')">
            <div class="icon-wrapper"><i class="bi bi-file-earmark-text"></i></div>
            <div>
              <h3 class="role-title">Policy Servicing</h3>
              <p class="role-desc">Updates & endorsements</p>
            </div>
          </button>
          
          <button class="glass-card" (click)="selectRole('MIS')">
            <div class="icon-wrapper"><i class="bi bi-graph-up"></i></div>
            <div>
              <h3 class="role-title">MIS Dashboard</h3>
              <p class="role-desc">Analytics & reporting</p>
            </div>
          </button>
          
          <button class="glass-card" (click)="selectRole('RM')">
            <div class="icon-wrapper"><i class="bi bi-people"></i></div>
            <div>
              <h3 class="role-title">Relationship Manager</h3>
              <p class="role-desc">Client relations</p>
            </div>
          </button>
          
          <button class="glass-card" (click)="selectRole('CLAIMS')">
            <div class="icon-wrapper"><i class="bi bi-shield-plus"></i></div>
            <div>
              <h3 class="role-title">Claims Team</h3>
              <p class="role-desc">Process resolutions</p>
            </div>
          </button>
          
          <button class="glass-card" (click)="selectRole('SALES')">
            <div class="icon-wrapper"><i class="bi bi-briefcase"></i></div>
            <div>
              <h3 class="role-title">Sales Team</h3>
              <p class="role-desc">New business</p>
            </div>
          </button>
          
          <button class="glass-card" (click)="selectRole('UNDERWRITING')">
            <div class="icon-wrapper"><i class="bi bi-clipboard-check"></i></div>
            <div>
              <h3 class="role-title">Underwriting Team</h3>
              <p class="role-desc">Risk assessment</p>
            </div>
          </button>
          
          <button class="glass-card" (click)="selectRole('ADMIN')">
            <div class="icon-wrapper"><i class="bi bi-person-badge"></i></div>
            <div>
              <h3 class="role-title">System Admin</h3>
              <p class="role-desc">Platform config</p>
            </div>
          </button>
        </div>
      </div>

      <div class="glass-panel login-form-container" *ngIf="selectedRole">
        <div class="form-ambient-highlight"></div>
        
        <header class="form-header">
          <h1 class="welcome-text">Welcome Back</h1>
          <p class="role-text">
            <i class="bi bi-person-gear"></i> Signing in as <strong>{{ getRoleName() }}</strong>
          </p>
        </header>

        <form class="login-form">
          <div class="input-field">
            <label for="username">Username / Email ID</label>
            <div class="input-wrapper">
              <i class="bi bi-person input-icon"></i>
              <input type="text" id="username" [(ngModel)]="username" name="username" placeholder="Enter your credentials" (keyup.enter)="focusPassword()" />
            </div>
          </div>
          
          <div class="input-field">
            <div class="password-label-row">
              <label for="password">Password</label>
              <a href="#" class="forgot-link">Forgot Password?</a>
            </div>
            <div class="input-wrapper">
              <i class="bi bi-lock input-icon"></i>
              <input type="password" id="password" [(ngModel)]="password" name="password" placeholder="••••••••" (keyup.enter)="login()" />
            </div>
          </div>

          <div *ngIf="error" class="error-alert">
            <i class="bi bi-exclamation-circle"></i> {{ error }}
          </div>

          <div class="form-actions">
            <button class="btn-primary-glow" type="button" (click)="login()" [disabled]="loading">
              <div class="btn-highlight"></div>
              <span *ngIf="!loading">Secure Sign In</span>
              <span *ngIf="loading" class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
              <i *ngIf="!loading" class="bi bi-arrow-right icon-arrow"></i>
            </button>
            
            <button type="button" class="btn-secondary-glass" (click)="selectedRole = null">
              <i class="bi bi-arrow-left"></i> Return to Role Selection
            </button>
          </div>
        </form>
        
        <div class="security-note">
          <i class="bi bi-shield-check"></i> End-to-end encrypted connection
        </div>
      </div>
    </div>
  `,
  styles: [`
    :host {
      display: block;
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", sans-serif;
    }
    
    .login-wrapper {
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      position: relative;
      background-image: url('https://lh3.googleusercontent.com/aida/AP1WRLtPLQONRfDbNbecUVn_wY5pUQOtlmkyzWic3bgk2mWfQgNw11t97Ctwvv7lmBU93lot5WJSxo2MuE9iGDe3gy0DTGeLtNObQNwz5eTYGPDF4CZ3PE9EjRHf3JyO5KKq8SJWneP46q6cJTxDuY0hPZU9ExvxFd-zV30ECEYfwPd6n36unDxqmOw8R8jmOHuCab7ZbHT946dPleyF4eWewjswurHD-HUUcqb9uGaCYkWcVmahq2ZGreaGRL0m');
      background-size: cover;
      background-position: center;
      padding: 1.5rem 1rem;
    }

    .app-header {
      width: 100%;
      max-width: 1152px;
      display: flex;
      justify-content: center;
      align-items: center;
      margin-bottom: 1.5rem;
      position: relative;
      z-index: 10;
    }

    .header-logo-container {
      display: flex;
      align-items: center;
      gap: 1.25rem;
    }

    .header-logo {
      height: 4rem;
      width: auto;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    .header-title {
      font-size: 3.5rem;
      font-weight: 900;
      color: #003c90;
      letter-spacing: -0.02em;
    }

    .login-wrapper::before {
      content: '';
      position: absolute;
      inset: 0;
      background: rgba(249, 249, 252, 0.7);
      backdrop-filter: blur(4px);
      -webkit-backdrop-filter: blur(4px);
    }

    .glass-panel {
      position: relative;
      z-index: 10;
      background: rgba(255, 255, 255, 0.6);
      backdrop-filter: blur(20px);
      -webkit-backdrop-filter: blur(20px);
      border-top: 1px solid rgba(255, 255, 255, 0.4);
      border-left: 1px solid rgba(255, 255, 255, 0.4);
      box-shadow: 0 8px 32px 0 rgba(0, 60, 144, 0.1);
      border-radius: 12px;
      animation: fadeIn 0.4s ease forwards;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(10px); }
      to { opacity: 1; transform: translateY(0); }
    }

    /* --- Role Selection Specifics --- */
    .main-container {
      width: 100%;
      max-width: 1152px;
      padding: 2rem;
    }

    .header-section {
      margin-bottom: 2rem;
    }

    .headline-title {
      font-size: 2rem;
      font-weight: 700;
      color: #1a1c1e;
      letter-spacing: -0.02em;
      margin-bottom: 1rem;
      line-height: 1.1;
    }

    .headline-subtitle {
      font-size: 1rem;
      color: #434653;
      max-width: 42rem;
      margin: 0 auto;
    }

    .role-grid {
      display: grid;
      grid-template-columns: repeat(1, 1fr);
      gap: 1rem;
    }
    @media (min-width: 640px) { .role-grid { grid-template-columns: repeat(2, 1fr); } }
    @media (min-width: 1024px) { .role-grid { grid-template-columns: repeat(4, 1fr); } }

    .glass-card {
      background: rgba(255, 255, 255, 0.7);
      backdrop-filter: blur(12px);
      border: 1px solid rgba(255, 255, 255, 0.5);
      border-radius: 8px;
      padding: 1rem;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
      text-align: center;
      cursor: pointer;
      transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
      width: 100%;
    }

    .glass-card:hover {
      transform: scale(1.02) translateY(-4px);
      background: rgba(255, 255, 255, 0.9);
      box-shadow: 0 12px 40px 0 rgba(0, 60, 144, 0.15);
      border-color: rgba(255, 255, 255, 0.8);
    }

    .icon-wrapper {
      width: 3rem;
      height: 3rem;
      border-radius: 50%;
      background-color: #eeeef0;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #003c90;
      font-size: 1.25rem;
      transition: background-color 0.3s, color 0.3s;
    }

    .glass-card:hover .icon-wrapper {
      background-color: #0f52ba;
      color: white;
    }

    .role-title {
      font-size: 1.125rem;
      font-weight: 600;
      color: #1a1c1e;
      transition: color 0.3s;
    }

    .glass-card:hover .role-title {
      color: #003c90;
    }

    .role-desc {
      font-size: 0.875rem;
      color: #434653;
      margin-top: 0.25rem;
    }

    /* --- Login Form Specifics --- */
    .login-form-container {
      width: 100%;
      max-width: 480px;
      padding: 2.5rem;
      display: flex;
      flex-direction: column;
      gap: 1.5rem;
      background: rgba(255, 255, 255, 0.4);
      box-shadow: 0 4px 30px rgba(0, 60, 144, 0.1);
      overflow: hidden;
    }

    .form-ambient-highlight {
      position: absolute;
      top: 0; left: 0; width: 100%; height: 50%;
      background: linear-gradient(180deg, rgba(255,255,255,0.3) 0%, rgba(255,255,255,0) 100%);
      pointer-events: none;
    }

    .brand-logo {
      display: flex;
      justify-content: center;
      margin-bottom: 0.5rem;
      position: relative;
      z-index: 10;
    }

    .brand-logo img {
      height: 4rem;
      object-fit: contain;
      border-radius: 8px;
    }

    .form-header {
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      gap: 0.5rem;
      position: relative;
      z-index: 10;
    }

    .welcome-text {
      font-size: 2rem;
      font-weight: 600;
      color: #003c90;
      letter-spacing: -0.01em;
      margin: 0;
    }

    .role-text {
      font-size: 1rem;
      color: #434653;
      display: flex;
      align-items: center;
      gap: 0.5rem;
      margin: 0;
    }

    .role-text strong {
      color: #003c90;
      font-weight: 600;
    }

    .login-form {
      display: flex;
      flex-direction: column;
      gap: 1.25rem;
      position: relative;
      z-index: 10;
    }

    .input-field {
      display: flex;
      flex-direction: column;
      gap: 0.375rem;
    }

    .input-field label {
      font-size: 0.75rem;
      font-weight: 600;
      color: #434653;
      margin-left: 0.25rem;
    }

    .password-label-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-left: 0.25rem;
    }

    .forgot-link {
      font-size: 0.75rem;
      color: #003c90;
      text-decoration: none;
      transition: color 0.2s;
    }
    .forgot-link:hover {
      color: #0f52ba;
      text-decoration: underline;
    }

    .input-wrapper {
      position: relative;
    }

    .input-icon {
      position: absolute;
      left: 0.75rem;
      top: 50%;
      transform: translateY(-50%);
      color: #c3c6d5;
      font-size: 1.25rem;
      transition: color 0.2s;
    }

    .input-wrapper input {
      width: 100%;
      background: rgba(226, 226, 229, 0.3);
      border: none;
      border-bottom: 2px solid rgba(195, 198, 213, 0.3);
      border-radius: 4px 4px 0 0;
      padding: 0.75rem 1rem 0.75rem 2.5rem;
      color: #1a1c1e;
      font-size: 1rem;
      transition: all 0.3s;
    }
    .input-wrapper input::placeholder {
      color: rgba(195, 198, 213, 0.8);
    }

    .input-wrapper:focus-within .input-icon {
      color: #003c90;
    }
    .input-wrapper:focus-within input {
      border-bottom-color: #003c90;
      background: rgba(255, 255, 255, 0.6);
      outline: none;
    }

    .form-actions {
      display: flex;
      flex-direction: column;
      gap: 1rem;
      margin-top: 1rem;
    }

    .btn-primary-glow {
      position: relative;
      width: 100%;
      background: #003c90;
      color: white;
      font-size: 1.125rem;
      font-weight: 600;
      padding: 0.875rem 1.5rem;
      border-radius: 8px;
      border: none;
      box-shadow: 0 4px 14px rgba(0,60,144,0.3);
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
      overflow: hidden;
      transition: all 0.3s;
    }
    .btn-primary-glow:hover:not(:disabled) {
      background: #00327a;
      box-shadow: 0 6px 20px rgba(0,60,144,0.4);
    }
    .btn-primary-glow:hover:not(:disabled) .icon-arrow {
      transform: translateX(4px);
    }
    .icon-arrow {
      transition: transform 0.3s;
    }

    .btn-highlight {
      position: absolute;
      top: 0; left: 0; width: 100%; height: 50%;
      background: linear-gradient(180deg, rgba(255,255,255,0.2) 0%, rgba(255,255,255,0) 100%);
      pointer-events: none;
    }

    .btn-secondary-glass {
      width: 100%;
      background: rgba(255, 255, 255, 0.2);
      border: 1px solid rgba(195, 198, 213, 0.5);
      color: #1a1c1e;
      font-size: 0.875rem;
      padding: 0.75rem 1.5rem;
      border-radius: 8px;
      backdrop-filter: blur(4px);
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
      transition: all 0.3s;
    }
    .btn-secondary-glass:hover {
      background: rgba(255, 255, 255, 0.4);
      border-color: #c3c6d5;
    }

    .security-note {
      text-align: center;
      margin-top: 0.5rem;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
      opacity: 0.7;
      font-size: 0.75rem;
      color: #434653;
      position: relative;
      z-index: 10;
    }
    .security-note i {
      color: #006d37;
    }

    .error-alert {
      background: rgba(255, 218, 214, 0.5);
      border: 1px solid rgba(186, 26, 26, 0.2);
      color: #93000a;
      padding: 0.75rem;
      border-radius: 8px;
      font-size: 0.875rem;
      font-weight: 500;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }
  `]

})
export class LoginComponent {
  username = '';
  password = '';
  loading = false;
  error = '';
  selectedRole: 'ADMIN' | 'RENEWER' | 'SERVICING' | 'MIS' | 'RM' | 'CLAIMS' | 'SALES' | 'UNDERWRITING' | null = null;

  constructor(private authService: AuthService, private router: Router) { }

  getRoleName(): string {
    switch (this.selectedRole) {
      case 'ADMIN': return 'System Admin';
      case 'RM': return 'Relationship Manager';
      case 'SERVICING': return 'Policy Servicing';
      case 'MIS': return 'MIS Dashboard';
      case 'CLAIMS': return 'Claims Team';
      case 'SALES': return 'Sales Team';
      case 'UNDERWRITING': return 'Underwriting Team';
      default: return 'Renewer';
    }
  }

  selectRole(role: 'ADMIN' | 'RENEWER' | 'SERVICING' | 'MIS' | 'RM' | 'CLAIMS' | 'SALES' | 'UNDERWRITING') {
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
          if (this.selectedRole === 'RM' && user.role !== 'RM' && user.role !== 'ADMIN') {
            this.error = 'Access Denied: You are not a Relationship Manager.';
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
          if (this.selectedRole === 'CLAIMS' && user.role !== 'CLAIMS' && user.role !== 'CLAIMS_MANAGER' && user.role !== 'ADMIN') {
            this.error = 'Access Denied: You are not authorized for the Claims Team.';
            this.authService.logout();
            this.loading = false;
            return;
          }
          if (this.selectedRole === 'SALES' && user.role !== 'SALES' && user.role !== 'SALES_MANAGER' && user.role !== 'ADMIN') {
            this.error = 'Access Denied: You are not authorized for the Sales Team.';
            this.authService.logout();
            this.loading = false;
            return;
          }
          if (this.selectedRole === 'UNDERWRITING' && user.role !== 'UNDERWRITING' && user.role !== 'UNDERWRITING_MANAGER' && user.role !== 'ADMIN') {
            this.error = 'Access Denied: You are not authorized for the Underwriting Team.';
            this.authService.logout();
            this.loading = false;
            return;
          }

          if (user.role === 'ADMIN' || user.role === 'RM') {
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
          this.error = 'Invalid username or password';
          this.loading = false;
        }
      });
  }
}
