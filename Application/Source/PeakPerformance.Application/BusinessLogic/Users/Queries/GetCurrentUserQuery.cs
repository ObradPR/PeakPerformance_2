using PeakPerformance.Application.Dtos.Users;

namespace PeakPerformance.Application.BusinessLogic.Users.Queries;

public class GetCurrentUserQuery : IRequest<ResponseWrapper<UserDto>>
{
    public class GetCurrentUserQueryHandler(IDatabaseContext db, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<GetCurrentUserQuery, ResponseWrapper<UserDto>>
    {
        public async Task<ResponseWrapper<UserDto>> Handle(GetCurrentUserQuery request, CancellationToken cancellationToken)
        {
            var model = await db.Users.GetSingleAsync(_ => _.Id == identityUser.Id, [_ => _.UserMeasurementPreferences]);

            return model == null ? new() : new(mapper.Map<UserDto>(model));
        }
    }
}