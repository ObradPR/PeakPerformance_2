using PeakPerformance.Application.Dtos.Users;
using PeakPerformance.Common.Extensions;
using PeakPerformance.Domain.Repositories;

namespace PeakPerformance.Application.BusinessLogic.Users.Commands;

public class RegistrationCommand(RegistrationDto user) : IRequest<AuthorizationDto>
{
    public RegistrationDto User { get; set; } = user;

    public class SignupCommandHandler(IUnitOfWork unitOfWork, ITokenService tokenService, IUserManager userManager)
        : IRequestHandler<RegistrationCommand, AuthorizationDto>
    {
        public async Task<AuthorizationDto> Handle(RegistrationCommand request, CancellationToken cancellationToken)
        {
            //var existingUser = await unitOfWork.Users.GetExistingAsync(request.User.Email, request.User.Username, strict: false);

            //if (existingUser != null)
            //{
            //    if (existingUser.Email == request.User.Email)
            //    {
            //        throw new FluentValidationException(nameof(request.User.Email), ResourceValidation.Already_Exist.AppendArgument(nameof(User)));
            //    }
            //    else if (existingUser.Username == request.User.Username)
            //    {
            //        throw new FluentValidationException(nameof(request.User.Username), ResourceValidation.Already_Exist.AppendArgument(nameof(User)));
            //    }
            //}

            var user = new User();

            request.User.ToModel(user, userManager);

            //await unitOfWork.Users.AddAsync(user);

            await unitOfWork.SaveAsync();

            return new AuthorizationDto
            {
                Token = tokenService.GenerateJwtToken(
                user.Id,
                (new[] { eSystemRole.User }).GetNames(),
                user.FullName,
                user.Email,
                user.Username)
            };
        }
    }
}