using PeakPerformance.Application.Dtos.Users;

namespace PeakPerformance.Application.BusinessLogic.Users.Queries;

public class GetSingleUserQuery(long? id) : IRequest<ResponseWrapper<UserDto>>
{
    public long? Id { get; set; } = id;

    public class GetCurrentUserQueryHandler(IDatabaseContext db, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<GetSingleUserQuery, ResponseWrapper<UserDto>>
    {
        public async Task<ResponseWrapper<UserDto>> Handle(GetSingleUserQuery request, CancellationToken cancellationToken)
        {
            var userId = request.Id ?? identityUser.Id;

            var model = await db.Users.GetSingleAsync(_ => _.Id == userId, [_ => _.UserMeasurementPreferences]);

            if (model == null)
                return new();

            var result = mapper.Map<UserDto>(model);
            result.WorkoutsCount = await db.Workouts.CountAsync(_ => _.UserId == userId && _.IsCompleted == true, cancellationToken);

            return new(result);
        }
    }
}