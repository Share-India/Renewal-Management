import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-user-management',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="user-mgmt-container">
      <div class="mgmt-card">
        <div class="card-header">
          <h3><i class="bi bi-people-fill"></i> User Management</h3>
          <p class="text-muted">Create and manage system access</p>
        </div>
        
        <div class="card-body">
          <h4 class="form-title">Add New User</h4>
          
          <div class="form-grid">
            <div class="form-group">
              <label>Username</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-person"></i></span>
                <input type="text" [(ngModel)]="newUser.username" class="form-control" placeholder="e.g. john.doe">
              </div>
            </div>
            
            <div class="form-group">
              <label>Password</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-key"></i></span>
                <input type="password" [(ngModel)]="newUser.password" class="form-control" placeholder="••••••••">
              </div>
            </div>

            <div class="form-group">
              <label>Confirm Password</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-key-fill"></i></span>
                <input type="password" [(ngModel)]="confirmPassword" class="form-control" placeholder="••••••••">
              </div>
            </div>
            
            <div class="form-group">
              <label>Role</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-shield-lock"></i></span>
                <select [(ngModel)]="newUser.role" class="form-select">
                  <option value="RENEWER">Renewer (Agent)</option>
                  <option value="SERVICING">Policy Servicing</option>
                  <option value="MIS">MIS</option>
                  <option value="ADMIN">Administrator</option>
                </select>
              </div>
            </div>
          </div>

          <button class="btn btn-primary w-100 mt-4" (click)="createUser()" [disabled]="loading">
            <span *ngIf="!loading"><i class="bi bi-plus-circle"></i> Create User</span>
            <span *ngIf="loading" class="spinner-border spinner-border-sm"></span>
          </button>
          
          <div *ngIf="message" class="alert mt-3" [class.alert-success]="success" [class.alert-danger]="!success">
            <i class="bi" [class.bi-check-circle-fill]="success" [class.bi-exclamation-triangle-fill]="!success"></i>
            {{ message }}
          </div>

          <button class="btn btn-outline-secondary w-100 mt-3" (click)="openUserList()">
            <i class="bi bi-list-ul"></i> View All Users
          </button>
        </div>
      </div>
    </div>

    <!-- Users List Modal -->
    <div class="modal-overlay" *ngIf="showUserList" (click)="closeUserList()">
      <div class="custom-modal-content" (click)="$event.stopPropagation()">
        <div class="modal-header">
          <h3>System Users</h3>
          <button class="btn-close" (click)="closeUserList()"></button>
        </div>
        <div class="modal-body">
          <div *ngIf="loadingUsers" class="text-center py-3">
            <div class="spinner-border text-primary" role="status"></div>
          </div>
          <table *ngIf="!loadingUsers" class="table table-hover">
            <thead>
              <tr>
                <th>Username</th>
                <th>Role</th>
                <th>Status</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr *ngFor="let user of users">
                <td>{{ user.username }}</td>
                <td>
                  <span class="badge" [ngClass]="getRoleBadgeClass(user.role)">
                    {{ getRoleDisplay(user.role) }}
                  </span>
                </td>
                <td>
                  <span class="badge" [class.bg-success]="user.active" [class.bg-danger]="!user.active">
                    {{ user.active ? 'Active' : 'Inactive' }}
                  </span>
                </td>
                <td>
                  <button class="btn btn-sm" [class.btn-outline-danger]="user.active" [class.btn-outline-success]="!user.active" 
                          (click)="toggleUserStatus(user)" [title]="user.active ? 'Deactivate' : 'Activate'">
                    <i class="bi" [class.bi-person-dash-fill]="user.active" [class.bi-person-check-fill]="!user.active"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" (click)="closeUserList()">Close</button>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-mgmt-container {
      padding: 40px 20px;
      background-color: #f8f9fa;
      min-height: calc(100vh - 56px); /* Adjust for navbar */
      display: flex;
      justify-content: center;
      align-items: flex-start;
    }
    
    .mgmt-card {
      background: white;
      border-radius: 16px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.05);
      width: 100%;
      max-width: 600px;
      overflow: hidden;
      border: 1px solid rgba(0,0,0,0.05);
    }
    
    .card-header {
      background: #fff;
      padding: 30px 30px 10px;
      border-bottom: none;
    }
    .card-header h3 { margin: 0; color: #2c3e50; font-weight: 700; display: flex; align-items: center; gap: 10px; }
    .text-muted { color: #6c757d; margin-top: 5px; }
    
    .card-body { padding: 30px; }
    .form-title { font-size: 1.1rem; color: #495057; margin-bottom: 25px; font-weight: 600; border-left: 4px solid #0d6efd; padding-left: 10px; }
    
    .form-grid { display: grid; gap: 20px; }
    .form-group label { display: block; margin-bottom: 8px; font-weight: 500; color: #495057; font-size: 0.95rem; }
    
    .input-group-text { background-color: #f8f9fa; border-color: #ced4da; color: #6c757d; }
    .form-control, .form-select {
      padding: 12px;
      border: 1px solid #ced4da;
      font-size: 1rem;
    }
    .form-control:focus, .form-select:focus {
      border-color: #86b7fe;
      box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
    }
    
    .btn-primary {
      padding: 14px;
      font-weight: 600;
      border-radius: 8px;
      background: linear-gradient(45deg, #0d6efd, #0a58ca);
      border: none;
      transition: all 0.2s;
    }
    .btn-primary:hover { transform: translateY(-1px); box-shadow: 0 4px 12px rgba(13, 110, 253, 0.25); }
    .btn-primary:disabled { opacity: 0.7; transform: none; }
    
    .alert { padding: 15px; border-radius: 8px; display: flex; align-items: center; gap: 10px; font-size: 0.95rem; }
    
    .modal-overlay {
      position: fixed; top: 0; left: 0; width: 100%; height: 100%;
      background: rgba(0,0,0,0.5); z-index: 1000;
      display: flex; justify-content: center; align-items: center;
    }
    .custom-modal-content {
      background: white; width: 90%; max-width: 600px;
      border-radius: 12px; box-shadow: 0 5px 15px rgba(0,0,0,0.3);
      padding: 0; display: flex; flex-direction: column; max-height: 80vh;
    }
    .modal-header { padding: 15px 20px; border-bottom: 1px solid #dee2e6; display: flex; justify-content: space-between; align-items: center; }
    .modal-body { padding: 20px; overflow-y: auto; }
    .modal-footer { padding: 15px 20px; border-top: 1px solid #dee2e6; text-align: right; }
    .btn-close { background: none; border: none; font-size: 1.5rem; cursor: pointer; color: #aaa; }
  `]
})
export class UserManagementComponent {
  newUser = { username: '', password: '', role: 'RENEWER' };
  confirmPassword = '';
  message = '';
  success = false;
  loading = false;

  // User List
  showUserList = false;
  users: any[] = [];
  loadingUsers = false;

  constructor(private authService: AuthService) { }

  openUserList() {
    this.showUserList = true;
    this.loadingUsers = true;
    this.authService.getUsers().subscribe({
      next: (data) => {
        this.users = data;
        this.loadingUsers = false;
      },
      error: (err) => {
        console.error('Error fetching users:', err);
        this.loadingUsers = false;
      }
    });
  }

  closeUserList() {
    this.showUserList = false;
  }

  createUser() {
    this.loading = true;
    this.message = '';

    if (this.newUser.password !== this.confirmPassword) {
      this.message = 'Passwords do not match!';
      this.success = false;
      this.loading = false;
      return;
    }

    if (this.newUser.password.length < 4) {
      this.message = 'Password must be at least 4 characters long.';
      this.success = false;
      this.loading = false;
      return;
    }

    this.authService.createUser(this.newUser).subscribe({
      next: () => {
        this.message = 'User created successfully!';
        this.success = true;
        this.newUser = { username: '', password: '', role: 'RENEWER' };
        this.confirmPassword = '';
        this.loading = false;
      },
      error: (err) => {
        console.error(err);
        this.message = 'Failed to create user. Username might be taken.';
        this.success = false;
        this.loading = false;
      }
    });
  }

  getRoleBadgeClass(role: string): string {
    if (!role) return 'bg-secondary';
    if (role.includes('ADMIN')) return 'bg-primary';
    if (role.includes('MIS')) return 'bg-info text-dark';
    if (role.includes('SERVICING')) return 'bg-warning text-dark';
    if (role.includes('RENEWER')) return 'bg-info';
    return 'bg-secondary';
  }

  getRoleDisplay(role: string): string {
    if (!role) return '-';
    return role.replace('ROLE_', '');
  }

  toggleUserStatus(user: any) {
    const action = user.active ? 'deactivate' : 'activate';
    if (confirm(`Are you sure you want to ${action} user ${user.username}?`)) {
      this.authService.deleteUser(user.id).subscribe({
        next: () => {
          this.openUserList(); // Refresh list
        },
        error: (err) => {
          console.error('Error toggling user status:', err);
          alert('Failed to update user status.');
        }
      });
    }
  }
}

