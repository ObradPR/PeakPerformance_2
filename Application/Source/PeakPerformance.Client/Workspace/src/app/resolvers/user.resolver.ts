import { inject } from '@angular/core';
import { ResolveFn } from '@angular/router';
import { IResponseWrapper, IUserDto } from '../_generated/interfaces';
import { UserController } from '../_generated/services';

export const userResolver: ResolveFn<IResponseWrapper<IUserDto> | null> = (route, state) => {
  const userController = inject(UserController);

  const id = Number(route.paramMap.get('userId'));
  return id ? userController.GetSingle(id) : null;
};