import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

export const activeAccountGuard: CanActivateFn = () => {
  const authService = inject(AuthService);
  const router = inject(Router);

  const user = authService.currentUserSource();

  // If user exists but account is NOT active → redirect
  if (user && user.isActive !== true) {
    router.navigateByUrl('/settings');
    return false;
  }

  return true;
};