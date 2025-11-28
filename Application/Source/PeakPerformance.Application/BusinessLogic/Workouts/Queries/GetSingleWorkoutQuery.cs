using PeakPerformance.Application.Dtos.Workouts;

namespace PeakPerformance.Application.BusinessLogic.Workouts.Queries;

public class GetSingleWorkoutQuery(long id) : IRequest<ResponseWrapper<WorkoutDto>>
{
    public long Id { get; set; } = id;

    public class GetSingleWorkoutQueryHandler(IDatabaseContext db, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<GetSingleWorkoutQuery, ResponseWrapper<WorkoutDto>>
    {
        public async Task<ResponseWrapper<WorkoutDto>> Handle(GetSingleWorkoutQuery request, CancellationToken cancellationToken)
        {
            //var userId = identityUser.Id;

            var model = await db.Workouts
                .Include(_ => _.WorkoutExercises)
                    .ThenInclude(_ => _.WorkoutExerciseSets)
                 .Include(_ => _.WorkoutExercises)
                    .ThenInclude(_ => _.Exercise)
                .FirstOrDefaultAsync(_ => _.Id == request.Id, cancellationToken);

            var data = mapper.Map<WorkoutDto>(model);

            var userMeasurementUnitId = (await db.UserMeasurementPreferences.FirstOrDefaultAsync(_ => _.UserId == identityUser.Id, cancellationToken)).WeightUnitId;

            var sets = data.Exercises.SelectMany(_ => _.Sets).Where(_ => _.TypeId != eSetType.Warmup).ToList();

            // #TODO: this will need rework after we introduce the non weighted stuff
            // so basically each type of those exercise will have their own method of volume calculation
            // so don't look confused if the line for Volume starts throwing Null Ref exceptions

            data.Total = new()
            {
                Reps = sets.Sum(_ => _.Reps),
                Sets = sets.Count,
                Volume = sets.Sum(_ => _.Reps * _.Weight.Value.ConvertUnitValue(_.WeightUnitId.Value, userMeasurementUnitId)),
            };

            return new(mapper.Map<WorkoutDto>(data));
        }
    }
}