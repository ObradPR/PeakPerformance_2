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

            var data = await db.Workouts
                .Include(_ => _.WorkoutExercises)
                    .ThenInclude(_ => _.WorkoutExerciseSets)
                .FirstOrDefaultAsync(_ => _.Id == request.Id, cancellationToken);

            return new(mapper.Map<WorkoutDto>(data));
        }
    }
}