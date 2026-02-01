using PeakPerformance.Application.Dtos.Workouts;
using PeakPerformance.Domain.Exceptions;

namespace PeakPerformance.Application.BusinessLogic.Workouts.Queries;

public class GetAllWorkoutLogsQuery(long userId) : IRequest<ResponseWrapper<IEnumerable<WorkoutLogDto>>>
{
    public long UserId { get; set; } = userId;

    public class GetAllWorkoutLogsQueryHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<GetAllWorkoutLogsQuery, ResponseWrapper<IEnumerable<WorkoutLogDto>>>
    {
        public async Task<ResponseWrapper<IEnumerable<WorkoutLogDto>>> Handle(GetAllWorkoutLogsQuery request, CancellationToken cancellationToken)
        {
            if (!await db.Users.AnyAsync(_ => _.Id == request.UserId && (request.UserId == identityUser.Id || _.IsPrivate != true), cancellationToken))
            {
                throw new ForbiddenException();
            }


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