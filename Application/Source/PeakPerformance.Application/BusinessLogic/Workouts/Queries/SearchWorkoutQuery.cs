using PeakPerformance.Application.Dtos.Workouts;

namespace PeakPerformance.Application.BusinessLogic.Workouts.Queries;

public class SearchWorkoutQuery(WorkoutSearchOptions options) : IRequest<ResponseWrapper<PagingResult<WorkoutDto>>>
{
    public WorkoutSearchOptions Options { get; set; } = options;

    public class SearchWorkoutQueryHandler(IDatabaseContext db, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<SearchWorkoutQuery, ResponseWrapper<PagingResult<WorkoutDto>>>
    {
        public async Task<ResponseWrapper<PagingResult<WorkoutDto>>> Handle(SearchWorkoutQuery request, CancellationToken cancellationToken)
        {
            var options = request.Options;

            var userId = options.UserId ?? identityUser.Id;

            var predicates = new List<Expression<Func<Workout, bool>>>();

            if (userId.IsNotEmpty())
                predicates.Add(_ => _.UserId == userId);

            var result = await db.Workouts.SearchAsync(options, _ => _.LogDate, true, predicates,
                includeProperties: [
                    _ => _.WorkoutExercises.Select(_ => _.WorkoutExerciseSets),
                    _ => _.WorkoutExercises.Select(_ => _.Exercise)
                ]);

            var data = mapper.Map<IEnumerable<WorkoutDto>>(result.Data);

            var userMeasurementUnitId = (await db.UserMeasurementPreferences
                 .FirstOrDefaultAsync(_ => _.UserId == identityUser.Id, cancellationToken))
                 .WeightUnitId;

            foreach (var workout in data)
            {
                var allSets = workout.Exercises.SelectMany(e => e.Sets).ToList();
                var workingSets = allSets.Where(s => s.TypeId != eSetType.Warmup).ToList();

                var strengthSets = workout.Exercises
                    .Where(_ => _.IsStrength == true)
                    .SelectMany(_ => _.Sets)
                    .Where(_ => _.TypeId != eSetType.Warmup);

                var bodyweightSets = workout.Exercises
                    .Where(_ => _.IsBodyweight == true)
                    .SelectMany(_ => _.Sets)
                    .Where(_ => _.TypeId != eSetType.Warmup);

                var cardioSets = workout.Exercises
                    .Where(_ => _.IsCardio == true)
                    .SelectMany(_ => _.Sets)
                    .Where(_ => _.TypeId != eSetType.Warmup);

                var totalReps = workingSets.Sum(s => s.Reps);
                var totalSets = workingSets.Count;

                var strengthVolume = strengthSets.Sum(_ => _.Reps * _.Weight.Value.ConvertUnitValue(_.WeightUnitId.Value, userMeasurementUnitId));

                var bodyweightVolume = (workout.Bodyweight != null)
                    ? bodyweightSets.Sum(_ =>
                        _.Reps * workout.Bodyweight.Value.ConvertUnitValue(workout.BodyweightMeasurementUnitId.Value, userMeasurementUnitId))
                    : 0;

                var cardioTime = cardioSets.Sum(s => s.DurationMinutes ?? 0);

                workout.Total = new()
                {
                    Reps = totalReps,
                    Sets = totalSets,
                    Volume = strengthVolume + bodyweightVolume,
                    CardioTime = cardioTime
                };
            }

            return new(new()
            {
                Data = data,
                Total = result.Total
            });
        }
    }
}