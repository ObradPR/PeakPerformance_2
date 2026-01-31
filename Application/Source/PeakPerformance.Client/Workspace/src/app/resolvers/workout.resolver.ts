import { inject } from '@angular/core';
import { ResolveFn } from '@angular/router';
import { IResponseWrapper, IWorkoutDto, IWorkoutSearchOptions } from '../_generated/interfaces';
import { WorkoutController } from '../_generated/services';

export const workoutResolver: ResolveFn<IResponseWrapper<IWorkoutDto> | null> = (route, state) => {
  const workoutController = inject(WorkoutController);

  const userId = Number(route.paramMap.get('userId'));
  const id = Number(route.paramMap.get('id'));
  console.log(route.paramMap);
  const options = {
    id: id,
    userId: userId
  } as IWorkoutSearchOptions;
  return workoutController.GetSingle(options);
};