import { inject } from "@angular/core";
import { ResolveFn } from "@angular/router";
import { IExerciseStatsDto, IResponseWrapper } from "../_generated/interfaces";
import { ExerciseController } from "../_generated/services";

export const exerciseResolver: ResolveFn<IResponseWrapper<IExerciseStatsDto | null>> = (route, state) => {
    const exerciseController = inject(ExerciseController);

    const apiExerciseId = route.paramMap.get('apiExerciseId');
    // return exerciseController.GetSingle(apiExerciseId);
    return { data: null } as IResponseWrapper<null>;
}