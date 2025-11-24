using PeakPerformance.Application.Dtos.Workouts;

namespace PeakPerformance.Application.BusinessLogic.Workouts.Queries;

public class GetRecentWorkoutQuery() : IRequest<ResponseWrapper<IEnumerable<WorkoutDto>>>
{
    public class GetRecentWorkoutQueryHandler(IDatabaseContext db, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<GetRecentWorkoutQuery, ResponseWrapper<IEnumerable<WorkoutDto>>>
    {
        public async Task<ResponseWrapper<IEnumerable<WorkoutDto>>> Handle(GetRecentWorkoutQuery request, CancellationToken cancellationToken)
        {
            var userId = identityUser.Id;

            var workouts = await db.Workouts
                .Select(_ => new Workout
                {
                    Id = _.Id,
                    Name = _.Name,
                    LogDate = _.LogDate,
                })
                .OrderByDescending(_ => _.LogDate)
                .Take(15)
                .ToListAsync(cancellationToken);

            return new(mapper.Map<IEnumerable<WorkoutDto>>(workouts));
        }
    }
}