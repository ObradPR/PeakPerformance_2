using PeakPerformance.Application.Dtos.Exercises;

namespace PeakPerformance.Application.BusinessLogic.Exercises.Queries;

public class SearchExerciseQuery(ExerciseSearchOptions options) : IRequest<ResponseWrapper<PagingResult<ExerciseStatsDto>>>
{
    public ExerciseSearchOptions Options { get; set; } = options;

    public class SearchExerciseQueryHandler(IIdentityUser identityUser, IDatabaseContext db, IMapper mapper) : IRequestHandler<SearchExerciseQuery, ResponseWrapper<PagingResult<ExerciseStatsDto>>>
    {
        public async Task<ResponseWrapper<PagingResult<ExerciseStatsDto>>> Handle(SearchExerciseQuery request, CancellationToken cancellationToken)
        {
            var options = request.Options;

            var userId = options.UserId ?? identityUser.Id;

            var predicates = new List<Expression<Func<WorkoutExercise, bool>>>();

            if (userId.IsNotEmpty())
                predicates.Add(_ => _.Workout.UserId == userId);

            if (options.ChartTimespanId.HasValue)
            {
                var chartTimespanId = options.ChartTimespanId.Value;
                var today = Functions.TODAY;

                predicates.Add(_ => _.Workout.LogDate <= today);

                if (chartTimespanId == eChartTimespan.Last3Months)
                    predicates.Add(_ => _.Workout.LogDate >= today.AddMonths(-3));
                else if (chartTimespanId == eChartTimespan.Last6Months)
                    predicates.Add(_ => _.Workout.LogDate >= today.AddMonths(-6));
                else if (chartTimespanId == eChartTimespan.Last12Months)
                    predicates.Add(_ => _.Workout.LogDate >= today.AddMonths(-12));
            }

            if (options.ExerciseIds.IsNotNullOrEmpty())
                predicates.Add(_ => options.ExerciseIds.Contains(_.Exercise.Id));

            if (options.TakeSelectedExercises.HasValue && options.TakeSelectedExercises == true)
            {
                var exerciseIds = await db.UserSelectedExercises
                    .Take(5)
                    .Where(_ => _.UserId == userId)
                    .Select(_ => _.ExerciseId)
                    .Distinct()
                    .ToListAsync(cancellationToken);

                predicates.Add(_ => exerciseIds.Contains(_.Exercise.Id));
            }

            var result = await db.WorkoutExercises.SearchAsync(options, _ => _.Workout.LogDate, true, predicates, includeProperties: [
                _ => _.Workout,
                _ => _.WorkoutExerciseSets,
                _ => _.Exercise,
            ]);

            var data = new List<ExerciseStatsDto>();

            var userMeasurementUnitId = (await db.UserMeasurementPreferences
                .FirstOrDefaultAsync(_ => _.UserId == identityUser.Id, cancellationToken))
                .WeightUnitId;

            foreach (var exercise in result.Data)
            {
                var maxWeightObj = exercise?.WorkoutExerciseSets?.Where(_ => _.TypeId != eSetType.Warmup)?.MaxBy(_ => _.Weight);
                var maxWeight = maxWeightObj?.Weight?.ConvertUnitValue(maxWeightObj.WeightUnitId.Value, userMeasurementUnitId);

                var maxWeightSetReps = exercise?.WorkoutExerciseSets?.Where(_ => _.Weight == maxWeight)?.OrderByDescending(_ => _.Reps).FirstOrDefault()?.Reps;

                var totalReps = exercise?.WorkoutExerciseSets?.Where(_ => _.TypeId != eSetType.Warmup)?.Sum(_ => _.Reps);

                var maxReps = exercise?.WorkoutExerciseSets?.Where(_ => _.TypeId != eSetType.Warmup)?.Max(_ => _.Reps);

                var volume = (decimal?)null;
                var totalCardio = (int?)null;

                var bodyweight = exercise.Workout?.Bodyweight;
                var bodyweightUnit = exercise.Workout?.BodyweightUnitId;

                if (exercise.Exercise.IsStrength == true)
                {
                    var strengthSets = exercise.WorkoutExerciseSets
                        .Where(_ => _.TypeId != eSetType.Warmup);

                    volume = strengthSets.Sum(_ => _.Reps * _.Weight.Value.ConvertUnitValue(_.WeightUnitId.Value, userMeasurementUnitId));
                }
                else if (exercise.Exercise.IsBodyweight == true)
                {
                    if (bodyweight != null)
                    {
                        var bodyweightSets = exercise.WorkoutExerciseSets
                            .Where(_ => _.TypeId != eSetType.Warmup);

                        volume = (bodyweight != null)
                            ? bodyweightSets.Sum(_ =>
                                _.Reps * bodyweight.Value.ConvertUnitValue(bodyweightUnit.Value, userMeasurementUnitId))
                            : null;
                    }
                }
                else if (exercise.Exercise.IsCardio == true)
                {
                    totalCardio = exercise.WorkoutExerciseSets
                        .Where(_ => _.TypeId != eSetType.Warmup)
                        .Sum(_ => _.DurationMinutes);
                }

                data.Add(new()
                {
                    Id = exercise.ExerciseId,
                    Name = exercise.Exercise.Name.ToTitleCase(),
                    IsCardio = exercise.Exercise.IsCardio,
                    IsBodyweight = exercise.Exercise.IsBodyweight,
                    IsStrength = exercise.Exercise.IsStrength,
                    Bodyweight = bodyweight,
                    BodyweightUnitId = bodyweightUnit,
                    LogDate = exercise.Workout.LogDate,

                    Total = new()
                    {
                        OneRepMax = maxWeight.OneRepMaxByEpley(maxWeightSetReps),
                        MaxWeight = maxWeight,
                        TotalReps = totalReps,
                        MaxReps = maxReps,
                        Volume = volume,
                        TotalCardioTime = totalCardio
                    }
                });
            }

            return new(new()
            {
                Data = data,
                Total = result.Total
            });
        }
    }
}