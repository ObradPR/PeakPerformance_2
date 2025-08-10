using PeakPerformance.Application.Dtos.Users;

namespace PeakPerformance.Application.BusinessLogic.Users.Commands;

public class LoginCommand(LoginDto user) : IRequest<ResponseWrapper<AuthorizationDto>>
{
    public LoginDto User { get; set; } = user;

    public class LoginCommandHandler(IUnitOfWork unitOfWork, ITokenService tokenService, IUserManager userManager) : IRequestHandler<LoginCommand, ResponseWrapper<AuthorizationDto>>
    {
        public async Task<ResponseWrapper<AuthorizationDto>> Handle(LoginCommand request, CancellationToken cancellationToken)
        {
            var model = await unitOfWork.GetSingleAsync<User>(_ => _.Username.ToLower() == request.User.Username.ToLower(), includeProperties: [
                _ => _.UserRoles
            ]);

            var verifyError = new Error(nameof(request.User), ResourceValidation.Wrong_Credentials);

            if (model == null)
                return new(verifyError);

            if (!userManager.VerifyPassword(request.User.Password, model.Password))
                return new(verifyError);

            // TODO: maybe some kind of activity log , but let this be extra at the end

            return new(new AuthorizationDto
            {
                Token = tokenService.GenerateJwtToken(
                model.Id,
                model.UserRoles.Select(_ => _.RoleId.GetDescription()).ToArray(),
                model.FullName,
                model.Email,
                model.Username)
            });
        }
    }
}