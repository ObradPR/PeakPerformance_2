﻿using PeakPerformance.Application.Dtos.Users;

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

            var model = new User();

            request.User.ToModel(model, userManager);

            unitOfWork.Create(model);

            await unitOfWork.SaveAsync();

            return new(new AuthorizationDto
            {
                Token = tokenService.GenerateJwtToken(
                model.Id,
                (new[] { eSystemRole.User }).GetNames(),
                model.FullName,
                model.Email,
                model.Username)
            });
        }
    }
}