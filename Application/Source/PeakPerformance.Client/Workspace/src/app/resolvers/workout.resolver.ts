import { inject } from '@angular/core';
import { ResolveFn } from '@angular/router';
import { IResponseWrapper, IWorkoutDto } from '../_generated/interfaces';
import { WorkoutController } from '../_generated/services';

export const workoutResolver: ResolveFn<IResponseWrapper<IWorkoutDto> | null> = (route, state) => {
  const workoutController = inject(WorkoutController);

  const id = Number(route.paramMap.get('id'));
  return workoutController.GetSingle(id);
};