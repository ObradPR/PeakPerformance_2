import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { RouteConstants } from '../constants';

export const authGuard: CanActivateFn = (route, state) => {
  const router = inject(Router);
  const authService = inject(AuthService);

  const url = state.url;
  const token = authService.getToken();

  if (!token && !url.includes(RouteConstants.ROUTE_AUTH)) {
    router.navigate([RouteConstants.ROUTE_AUTH, RouteConstants.ROUTE_LOG_IN]);
    return false;
  }
  else if (token && url.includes(RouteConstants.ROUTE_AUTH)) {
    router.navigateByUrl(RouteConstants.ROUTE_HOME);
    return false;
  }

  return true;
};
