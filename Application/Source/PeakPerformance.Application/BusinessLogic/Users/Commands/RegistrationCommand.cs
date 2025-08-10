using PeakPerformance.Application.Dtos.Users;
using PeakPerformance.Common.Resources;

namespace PeakPerformance.Application.BusinessLogic.Users.Commands;

public class RegistrationCommand(RegistrationDto user) : IRequest<ResponseWrapper<AuthorizationDto>>
{
    public RegistrationDto User { get; set; } = user;

    public class SignupCommandHandler(IUnitOfWork unitOfWork, ITokenService tokenService, IUserManager userManager)
        : IRequestHandler<RegistrationCommand, ResponseWrapper<AuthorizationDto>>
    {
        public async Task<ResponseWrapper<AuthorizationDto>> Handle(RegistrationCommand request, CancellationToken cancellationToken)
        {
            if (await unitOfWork.Users.ExistsAsync(request.User.Username, request.User.Email))
                return new(new Error(nameof(User), ResourceValidation.In_Use.FormatWith("Email or Username")));

            var user = new User();

            request.User.ToModel(user, userManager);

            unitOfWork.Create(user);

            await unitOfWork.SaveAsync();

            return new(new AuthorizationDto
            {
                Token = tokenService.GenerateJwtToken(
                user.Id,
                (new[] { eSystemRole.User }).GetNames(),
                user.FullName,
                user.Email,
                user.Username)
            });
        }
    }
}