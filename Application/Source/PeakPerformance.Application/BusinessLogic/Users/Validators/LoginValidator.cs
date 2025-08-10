using PeakPerformance.Application.BusinessLogic.Users.Commands;

namespace PeakPerformance.Application.BusinessLogic.Users.Validators;

public class LoginValidator : AbstractValidator<LoginCommand>
{
    public LoginValidator()
    {
        RuleFor(_ => _.User.Username)
            .Required();

        RuleFor(_ => _.User.Password)
            .Required();
    }
}