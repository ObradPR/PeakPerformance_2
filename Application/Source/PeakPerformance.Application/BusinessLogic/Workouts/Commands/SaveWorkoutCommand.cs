using PeakPerformance.Application.Dtos.Workouts;

namespace PeakPerformance.Application.BusinessLogic.Workouts.Commands;

public class SaveWorkoutCommand(WorkoutDto data) : IRequest<ResponseWrapper<long>>
{
    public WorkoutDto Data { get; set; } = data;

    public class SaveWorkoutCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<SaveWorkoutCommand, ResponseWrapper<long>>
    {
        public async Task<ResponseWrapper<long>> Handle(SaveWorkoutCommand request, CancellationToken cancellationToken)
        {
            if (request.Data == null)
                return new(new Error(nameof(Workout), ResourceValidation.Required.FormatWith(nameof(Workout))));

            var existingModel = request.Data.Id.IsNotEmpty()
                ? await db.Workouts.GetSingleAsync(request.Data.Id)
                : null;

            var model = existingModel ?? new();
            request.Data.ToModel(model, identityUser.Id);

            // Copy logic
            if (model.IsNew && model.CopiedFromId != null)
            {
                var copyWorkout = await db.Workouts
                    .Include(_ => _.WorkoutExercises)
                        .ThenInclude(_ => _.WorkoutExerciseSets)
                    .Where(_ => _.Id == model.CopiedFromId)
                    .FirstOrDefaultAsync(cancellationToken);

                if (copyWorkout != null)
                {
                    model.WorkoutExercises = copyWorkout.WorkoutExercises.Select(_ => new WorkoutExercise
                    {
                        ExerciseId = _.ExerciseId,
                        // #TODO: Order of exericse will be added later
                        Notes = _.Notes,
                        WorkoutExerciseSets = _.WorkoutExerciseSets.Select(_ => new WorkoutExerciseSet
                        {
                            Weight = _.Weight,
                            WeightMeasurementUnitId = _.WeightMeasurementUnitId,
                            Reps = _.Reps,
                            RpeTypeId = _.RpeTypeId,
                            TypeId = _.TypeId,
                            Rest = _.Rest,
                            Notes = _.Notes
                            // #TODO: Order of sets will be added later
                        }).ToList()
                    }).ToList();
                }
            }

            // Populate bodyweight
            if (model.Bodyweight == null)
            {
                var latestBodyweightLog = await db.Bodyweights
                    .Where(_ => _.UserId == identityUser.Id)
                    .OrderByDescending(_ => _.LogDate)
                    .Select(_ => new { _.Value, _.WeightUnitId })
                    .FirstOrDefaultAsync(cancellationToken);

                model.Bodyweight = latestBodyweightLog?.Value;
                model.BodyweightMeasurementUnitId = latestBodyweightLog?.WeightUnitId;
            }

            if (model.IsNew)
                db.Workouts.Add(model);

            await db.SaveChangesAsync(cancellationToken);

            return new(model.Id);
        }
    }
}