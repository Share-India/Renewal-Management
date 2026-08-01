import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { AuthService } from './services/auth.service';
import { ApiService } from './services/api.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, RouterOutlet, RouterModule, FormsModule],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'insurance-renewal-app';
  selectedSourceTeam: string = '';

  constructor(public authService: AuthService, public apiService: ApiService) { }

  ngOnInit() {
    this.apiService.selectedSourceTeam$.subscribe(team => {
      this.selectedSourceTeam = team;
    });
  }

  setSourceTeam(team: string) {
    const newTeam = this.selectedSourceTeam === team ? '' : team;
    this.apiService.selectedSourceTeamSubject.next(newTeam);
  }

  logout() {
    this.authService.logout();
  }

  // Change Password Modal
  showPasswordModal = false;
  passwordData = { oldPassword: '', newPassword: '', confirmPassword: '' };
  passwordMessage = '';
  passwordSuccess = false;

  openPasswordModal() {
    this.showPasswordModal = true;
    this.passwordData = { oldPassword: '', newPassword: '', confirmPassword: '' };
    this.passwordMessage = '';
  }

  closePasswordModal() {
    this.showPasswordModal = false;
  }

  changePassword() {
    if (this.passwordData.newPassword !== this.passwordData.confirmPassword) {
      this.passwordMessage = 'New passwords do not match';
      this.passwordSuccess = false;
      return;
    }
    if (this.passwordData.newPassword.length < 4) {
      this.passwordMessage = 'Password must be at least 4 characters';
      this.passwordSuccess = false;
      return;
    }

    this.apiService.changePassword(this.passwordData).subscribe({
      next: (msg) => {
        this.passwordMessage = 'Password changed successfully!';
        this.passwordSuccess = true;
        setTimeout(() => this.closePasswordModal(), 1500);
      },
      error: (err) => {
        console.error(err);
        this.passwordMessage = err.error || 'Failed to change password. check old password.';
        this.passwordSuccess = false;
      }
    });
  }
}
