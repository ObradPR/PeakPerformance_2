using PeakPerformance.Application.Dtos.Users;

namespace PeakPerformance.Application.BusinessLogic.Users.Commands;

public class LoginCommand(LoginDto user) : IRequest<AuthorizationDto>
{
    public LoginDto User { get; set; } = user;

    public class LoginCommandHandler : IRequestHandler<LoginCommand, AuthorizationDto>
    {
        public async Task<AuthorizationDto> Handle(LoginCommand request, CancellationToken cancellationToken)
        {
            return new AuthorizationDto();
        }
    }
}