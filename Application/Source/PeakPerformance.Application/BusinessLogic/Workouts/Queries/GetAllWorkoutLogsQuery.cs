using PeakPerformance.Application.Dtos.Workouts;

namespace PeakPerformance.Application.BusinessLogic.Workouts.Queries;

public class GetAllWorkoutLogsQuery() : IRequest<ResponseWrapper<IEnumerable<WorkoutLogDto>>>
{
    public class GetAllWorkoutLogsQueryHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<GetAllWorkoutLogsQuery, ResponseWrapper<IEnumerable<WorkoutLogDto>>>
    {
        public async Task<ResponseWrapper<IEnumerable<WorkoutLogDto>>> Handle(GetAllWorkoutLogsQuery request, CancellationToken cancellationToken)
        {
            var userId = identityUser.Id;

            var data = await db.Workouts
                .Where(_ => _.UserId == userId)
                .Select(_ => new WorkoutLogDto
                {
                    Id = _.Id,
                    LogDate = _.LogDate,
                })
                .ToListAsync(cancellationToken);

            return new(data);
        }
    }
}