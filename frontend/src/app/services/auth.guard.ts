import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { AuthService } from './auth.service';

@Injectable({
    providedIn: 'root'
})
export class AuthGuard implements CanActivate {
    constructor(private authService: AuthService, private router: Router) { }

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
        const currentUser = this.authService.getCurrentUser();

        if (currentUser) {
            // Check if route is restricted by role
            if (route.data['roles'] && route.data['roles'].indexOf(currentUser.role) === -1) {
                // Role not authorised. Prevent infinite loop if redirecting to home '/' which might also be restricted.
                if (currentUser.role === 'SERVICING') {
                    this.router.navigate(['/servicing']);
                } else if (currentUser.role === 'ADMIN') {
                    this.router.navigate(['/admin']);
                } else {
                    this.router.navigate(['/login']);
                }
                return false;
            }

            // Authorised so return true
            return true;
        }

        // Not logged in so redirect to login page
        this.router.navigate(['/login']);
        return false;
    }
}
