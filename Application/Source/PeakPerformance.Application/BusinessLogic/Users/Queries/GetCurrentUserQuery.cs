using PeakPerformance.Application.Dtos.Users;

namespace PeakPerformance.Application.BusinessLogic.Users.Queries;

public class GetCurrentUserQuery : IRequest<ResponseWrapper<UserDto>>
{
    public class GetCurrentUserQueryHandler(IUnitOfWork unitOfWork, IIdentityUser identityUser, IMapper mapper) : IRequestHandler<GetCurrentUserQuery, ResponseWrapper<UserDto>>
    {
        public async Task<ResponseWrapper<UserDto>> Handle(GetCurrentUserQuery request, CancellationToken cancellationToken)
        {
            var model = await unitOfWork.GetSingleAsync<User>(_ => _.Id == identityUser.Id, [_ => _.UserMeasurementPreferences]);

            return model == null ? new() : new(mapper.Map<UserDto>(model));
        }
    }
}