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
            var oldOrder = existingModel?.Order ?? 0;
            request.Data.ToModel(model, identityUser.Id);

            if (!model.IsNew)
            {
                var newOrder = model.Order;

                if (oldOrder != newOrder)
                {
                    var allExercises = await db.WorkoutExercises
                        .Where(_ => _.WorkoutId == request.Data.WorkoutId && _.Id != model.Id)
                        .OrderBy(_ => _.Order)
                        .ToListAsync(cancellationToken);

                    if (newOrder < oldOrder)
                    {
                        foreach (var e in allExercises.Where(_ => _.Order >= newOrder && _.Order < oldOrder))
                            e.Order++;
                    }
                    else
                    {
                        foreach (var e in allExercises.Where(_ => _.Order <= newOrder && _.Order > oldOrder))
                            e.Order--;
                    }
                }
            }

            var exercise = await db.Exercises.FirstOrDefaultAsync(_ => _.Id == request.Data.ExerciseId, cancellationToken);

            model.ExerciseId = exercise.Id;

            if (model.IsNew)
                db.WorkoutExercises.Add(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}