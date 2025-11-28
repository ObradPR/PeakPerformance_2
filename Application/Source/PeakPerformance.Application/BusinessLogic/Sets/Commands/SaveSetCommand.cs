using PeakPerformance.Application.Dtos.Sets;

namespace PeakPerformance.Application.BusinessLogic.Sets.Commands;

public class SaveSetCommand(WorkoutExerciseSetDto data) : IRequest<BaseResponseWrapper>
{
    public WorkoutExerciseSetDto Data { get; set; } = data;

    public class SaveSetCommandHandler(IDatabaseContext db) : IRequestHandler<SaveSetCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(SaveSetCommand request, CancellationToken cancellationToken)
        {
            if (request.Data == null)
                return new(new Error("Set", ResourceValidation.Required.FormatWith("Set")));

            var existingModel = request.Data.Id.IsNotEmpty()
                ? await db.WorkoutExerciseSets.GetSingleAsync(request.Data.Id)
                : null;

            // Validation

            var exercise = await db.WorkoutExercises
                    .Where(_ => _.Id == request.Data.WorkoutExerciseId)
                    .Select(_ => _.Exercise)
                    .FirstOrDefaultAsync(cancellationToken);

            if (exercise?.IsCardio == true)
            {
                request.Data.Reps = null;
                request.Data.Weight = null;
                request.Data.WeightUnitId = null;
                request.Data.RpeTypeId = null;
                request.Data.TypeId = null;

                if (request.Data.DurationMinutes == null)
                    return new(new Error("Duration", ResourceValidation.Required.FormatWith("Duration")));
            }
            else if (exercise?.IsBodyweight == true)
            {
                request.Data.Weight = null;
                request.Data.WeightUnitId = null;
                request.Data.DurationMinutes = null;

                if (request.Data.Reps == null)
                    return new(new Error("Reps", ResourceValidation.Required.FormatWith("Reps")));
            }
            else if (exercise?.IsStrength == true)
            {
                request.Data.DurationMinutes = null;

                var errors = new List<Error>();

                if (request.Data.Reps == null)
                    errors.Add(new Error("Reps", ResourceValidation.Required.FormatWith("Reps")));
                if (request.Data.Weight == null)
                    errors.Add(new Error("Weight", ResourceValidation.Required.FormatWith("Weight")));

                if (errors.Count > 0)
                    return new(errors);
            }

            // Creation

            if (existingModel != null)
            {
                var oldOrder = existingModel.Order;
                request.Data.ToModel(existingModel, request.Data.Order);
                var newOrder = existingModel.Order;

                if (oldOrder != newOrder)
                {
                    var allSets = await db.WorkoutExerciseSets
                        .Where(_ => _.WorkoutExerciseId == request.Data.WorkoutExerciseId && _.Id != existingModel.Id)
                        .OrderBy(_ => _.Order)
                        .ToListAsync(cancellationToken);

                    if (newOrder < oldOrder)
                    {
                        foreach (var s in allSets.Where(_ => _.Order >= newOrder && _.Order < oldOrder))
                            s.Order++;
                    }
                    else
                    {
                        foreach (var s in allSets.Where(_ => _.Order <= newOrder && _.Order > oldOrder))
                            s.Order--;
                    }
                }
            }
            else
            {
                for (var i = 0; i < request.Data.Sets; i++)
                {
                    var model = new WorkoutExerciseSet();
                    request.Data.ToModel(model, order: request.Data.Order + i);
                    db.WorkoutExerciseSets.Add(model);
                }
            }

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}