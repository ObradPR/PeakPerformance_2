using PeakPerformance.Application.Dtos.User;

namespace PeakPerformance.Application.BusinessLogic.User.Queries;

public class GetCurrentUserQuery : IRequest<UserDto>
{
    public class GetCurrentUserQueryHandler : IRequestHandler<GetCurrentUserQuery, UserDto>
    {
        public async Task<UserDto> Handle(GetCurrentUserQuery request, CancellationToken cancellationToken)
        {
            return new UserDto();
        }
    }
}