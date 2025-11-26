using PeakPerformance.Application.Dtos.Exercises;

namespace PeakPerformance.Application.BusinessLogic.Exercises.Commands;

public class SaveExerciseCommand(WorkoutExerciseDto data) : IRequest<BaseResponseWrapper>
{
    public WorkoutExerciseDto Data { get; set; } = data;

    public class SaveExerciseCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<SaveExerciseCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(SaveExerciseCommand request, CancellationToken cancellationToken)
        {
            if (request.Data == null)
                return new(new Error(nameof(Exercise), ResourceValidation.Required.FormatWith(nameof(Exercise))));

            var existingModel = request.Data.Id.IsNotEmpty()
                ? await db.WorkoutExercises.GetSingleAsync(request.Data.Id)
                : null;

            var model = existingModel ?? new();
            request.Data.ToModel(model, identityUser.Id);

            var exercise = await db.Exercises.FirstOrDefaultAsync(_ => _.ApiExerciseId == request.Data.ApiExerciseId, cancellationToken);

            if (exercise != null)
            {
                model.ExerciseId = exercise.Id;
            }
            else
            {
                var newExercise = new Exercise
                {
                    ApiExerciseId = request.Data.ApiExerciseId,
                    Name = request.Data.Name,
                };

                db.Exercises.Add(newExercise);

                model.Exercise = newExercise;
            }

            if (model.IsNew)
                db.WorkoutExercises.Add(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}