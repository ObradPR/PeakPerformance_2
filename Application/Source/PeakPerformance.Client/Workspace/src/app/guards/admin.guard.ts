import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { eSystemRole } from '../_generated/enums';
import { AuthService } from '../services/auth.service';

export const adminGuard: CanActivateFn = async (route, state) => {
  const authService = inject(AuthService);
  const router = inject(Router);

  let user = authService.currentUserSource();
  
  if (!user) {
    user = await authService.loadCurrentUserForGuard();
  }

  if (!user) return router.createUrlTree(['/auth/login']);

  if (!user.roles?.some(_ => _.roleId === eSystemRole.Admin))
    return router.createUrlTree([`/user/${user.id}`]);

  return true;
};
