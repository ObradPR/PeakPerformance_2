using PeakPerformance.Application.Dtos.Workouts;

namespace PeakPerformance.Application.BusinessLogic.Workouts.Queries;

public class GetAllWorkoutLogsQuery(long userId) : IRequest<ResponseWrapper<IEnumerable<WorkoutLogDto>>>
{
    public long UserId { get; set; } = userId;

    public class GetAllWorkoutLogsQueryHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<GetAllWorkoutLogsQuery, ResponseWrapper<IEnumerable<WorkoutLogDto>>>
    {
        public async Task<ResponseWrapper<IEnumerable<WorkoutLogDto>>> Handle(GetAllWorkoutLogsQuery request, CancellationToken cancellationToken)
        {
            var data = await db.Workouts
                .Where(_ => _.UserId == request.UserId)
                .Select(_ => new WorkoutLogDto
                {
                    Id = _.Id,
                    LogDate = _.LogDate,
                    Name = _.Name,
                })
                .ToListAsync(cancellationToken);

            return new(data);
        }
    }
}