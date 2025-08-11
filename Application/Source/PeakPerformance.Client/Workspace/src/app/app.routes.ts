import { Routes } from '@angular/router';
import { RouteConstants } from './constants';
import { authGuard } from './guards/auth.guard';

export const routes: Routes = [
    {
        path: RouteConstants.ROUTE_HOME,
        title: RouteConstants.TITLE_HOME,
        canActivate: [authGuard],
        loadComponent: () => import('./pages/home/home').then(_ => _.Home),
    },
    ///
    /// AUTH
    ///
    {
        path: RouteConstants.ROUTE_AUTH,
        canActivate: [authGuard],
        children: [
            {
                path: '',
                redirectTo: RouteConstants.ROUTE_LOG_IN,
                pathMatch: 'full'
            },
            {
                path: RouteConstants.ROUTE_LOG_IN,
                title: RouteConstants.TITLE_LOG_IN,
                loadComponent: () => import('./pages/auth/log-in/log-in').then(_ => _.LogIn)
            },
            {
                path: RouteConstants.ROUTE_REGISTER,
                title: RouteConstants.TITLE_REGISTER,
                loadComponent: () => import('./pages/auth/register/register').then(_ => _.Register)
            }
        ]
    }
    ///
    /// Error Pages
    ///
    // {
    //     path: RouteConstants.ROUTE_NOT_FOUND,
    //     title: RouteConstants.TITLE_NOT_FOUND,
    //     loadComponent: () =>
    //         import('./pages/errors/not-found/not-found.component').then(_ => _.NotFoundComponent),
    // },
    // {
    //     path: RouteConstants.ROUTE_UNAUTHORIZED,
    //     title: RouteConstants.TITLE_UNAUTHORIZED,
    //     loadComponent: () =>
    //         import('./pages/errors/unauthorized/unauthorized.component').then(_ => _.UnauthorizedComponent),
    // },
    // {
    //     path: '**',
    //     redirectTo: RouteConstants.ROUTE_NOT_FOUND,
    //     pathMatch: 'full',
    // },
];
