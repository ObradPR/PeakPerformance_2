import { Routes } from '@angular/router';
import { RouteConstants } from './constants';
import { authGuard } from './guards/auth.guard';
import { workoutResolver } from './resolvers/workout.resolver';

export const routes: Routes = [
    {
        path: RouteConstants.ROUTE_HOME,
        canActivate: [authGuard],
        children: [
            {
                path: '',
                title: RouteConstants.TITLE_HOME,
                loadComponent: () => import('./pages/home/home').then(_ => _.Home),
            },
            {
                path: RouteConstants.ROUTE_BODYWEIGHT,
                title: RouteConstants.TITLE_BODYWEIGHT,
                loadComponent: () => import('./pages/bodyweight/bodyweight').then(_ => _.Bodyweight)
            },
            {
                path: RouteConstants.ROUTE_MEASUREMENT,
                title: RouteConstants.TITLE_MEASUREMENT,
                loadComponent: () => import('./pages/measurement/measurement').then(_ => _.Measurement)
            },
            {
                path: RouteConstants.ROUTE_SETTINGS,
                title: RouteConstants.TITLE_SETTINGS,
                loadComponent: () => import('./pages/settings/settings').then(_ => _.Settings)
            },
            {
                path: RouteConstants.ROUTE_WORKOUTS,
                title: RouteConstants.TITLE_WORKOUTS,
                loadComponent: () => import('./pages/workout/workout').then(_ => _.Workout)
            },
            {
                path: RouteConstants.ROUTE_SINGLE_WORKOUT,
                title: RouteConstants.TITLE_WORKOUTS,
                loadComponent: () => import('./pages/workout/workout-single/workout-single').then(_ => _.WorkoutSingle),
                resolve: {
                    workout: workoutResolver
                }
            },
            {
                path: RouteConstants.ROUTE_EXERCISES,
                title: RouteConstants.TITLE_EXERCISES,
                loadComponent: () => import('./pages/exercise/exercise').then(_ => _.Exercise)
            },
            {
                path: RouteConstants.ROUTE_SINGLE_EXERCISE,
                title: RouteConstants.TITLE_EXERCISES,
                loadComponent: () => import('./pages/exercise/exercise-single/exercise-single').then(_ => _.ExerciseSingle),
            },
        ]
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
    },
    ///
    /// Error Pages
    ///
    {
        path: RouteConstants.ROUTE_NOT_FOUND,
        title: RouteConstants.TITLE_NOT_FOUND,
        loadComponent: () =>
            import('./pages/error/not-found/not-found').then(_ => _.NotFound),
    },
    {
        path: RouteConstants.ROUTE_UNAUTHORIZED,
        title: RouteConstants.TITLE_UNAUTHORIZED,
        loadComponent: () =>
            import('./pages/error/unauthorized/unauthorized').then(_ => _.Unauthorized),
    },
    {
        path: '**',
        redirectTo: RouteConstants.ROUTE_NOT_FOUND,
        pathMatch: 'full',
    },
];
