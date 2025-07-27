using PeakPerformance.Application.Dtos.User;

namespace PeakPerformance.Application.BusinessLogic.User.Commands;

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