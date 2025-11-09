import { HttpErrorResponse, HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { Router } from '@angular/router';
import { ToastService } from '../services/toast.service';
import { catchError } from 'rxjs';
import { Constants, RouteConstants } from '../constants';

export const errorInterceptor: HttpInterceptorFn = (req, next) => {
  const toast = inject(ToastService);
  const router = inject(Router);

  return next(req).pipe(
    catchError((error: HttpErrorResponse) => {
      if (error) {
        const defaultMsg = "There was an error";

        const errorsArr = error?.error?.errors || error?.error?.Errors || [];
        let msg = defaultMsg;

        if (Array.isArray(errorsArr) && errorsArr.length > 0) {
          msg = `You got errors`;
        }

        const statusHeaders: Record<number, string> = {
          400: Constants.ERROR_BAD_REQUEST,
          401: Constants.ERROR_UNAUTHORIZED,
          403: Constants.ERROR_FORBIDDEN,
          404: Constants.ERROR_NOT_FOUND,
          422: Constants.ERROR_VALIDATION
        };

        const header = statusHeaders[error.status];

        if (header) {
          toast.showError(header, msg);

          switch (error.status) {
            case 401:
              router.navigateByUrl(RouteConstants.ROUTE_UNAUTHORIZED);
              break;
            case 403:
              router.navigateByUrl(RouteConstants.ROUTE_HOME);
              break;
            case 404:
              router.navigateByUrl(RouteConstants.ROUTE_NOT_FOUND);
              break;
            default:
              break;
          }
        } else if (error.status === 500) {
          toast.showGeneralError();
          console.error(error);
        }
      }
      throw error;
    })
  );
};


