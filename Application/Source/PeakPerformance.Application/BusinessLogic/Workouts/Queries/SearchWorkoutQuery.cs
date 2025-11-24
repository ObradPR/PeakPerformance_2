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
                    _ => _.WorkoutExercises.Select(_ => _.WorkoutExerciseSets)
                ]);

            var data = mapper.Map<IEnumerable<WorkoutDto>>(result.Data);

            var userMeasurementUnitId = (await db.UserMeasurementPreferences.FirstOrDefaultAsync(_ => _.UserId == userId, cancellationToken)).WeightUnitId;

            foreach (var workout in data)
            {
                var sets = workout.Exercises.SelectMany(_ => _.Sets).Where(_ => _.TypeId > eSetType.Warmup).ToList();

                // #TODO: this will need rework after we introduce the non weighted stuff
                // so basically each type of those exercise will have their own method of volume calculation
                // so don't look confused if the line for Volume starts throwing Null Ref exceptions

                workout.Total = new()
                {
                    Reps = sets.Sum(_ => _.Reps),
                    Sets = sets.Count,
                    Volume = sets.Sum(_ => _.Reps * _.Weight.Value.ConvertUnitValue(_.WeightMeasurementUnitId.Value, userMeasurementUnitId)),
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