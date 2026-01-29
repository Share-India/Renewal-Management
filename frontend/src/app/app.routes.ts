import { Routes } from '@angular/router';
import { RenewalComponent } from './components/renewal/renewal.component';
import { AdminDashboardComponent } from './components/admin-dashboard/admin-dashboard.component';
import { LoginComponent } from './components/login/login.component';
import { UserManagementComponent } from './components/user-management/user-management.component';
import { AuthGuard } from './services/auth.guard';

export const routes: Routes = [
    { path: 'login', component: LoginComponent },
    {
        path: '',
        component: RenewalComponent,
        canActivate: [AuthGuard],
        data: { roles: ['RENEWER', 'ADMIN'] }
    },
    {
        path: 'admin',
        component: AdminDashboardComponent,
        canActivate: [AuthGuard],
        data: { roles: ['ADMIN'] }
    },
    {
        path: 'admin/users',
        component: UserManagementComponent,
        canActivate: [AuthGuard],
        data: { roles: ['ADMIN'] }
    },
    {
        path: 'servicing',
        loadComponent: () => import('./components/policy-servicing/policy-servicing.component').then(m => m.PolicyServicingComponent),
        canActivate: [AuthGuard],
        data: { roles: ['SERVICING', 'ADMIN'] }
    },
    {
        path: 'mis-dashboard',
        loadComponent: () => import('./components/mis-dashboard/mis-dashboard.component').then(m => m.MisDashboardComponent),
        canActivate: [AuthGuard],
        data: { roles: ['MIS', 'ADMIN'] }
    },
    { path: '**', redirectTo: '' }
];
