using PeakPerformance.Application.BusinessLogic.User.Commands;

namespace PeakPerformance.Application.BusinessLogic.User.Validators;

public class LoginValidator : AbstractValidator<LoginCommand>
{
    public LoginValidator()
    {
        RuleFor(_ => _.User.Username)
            .Required()
            .MaximumLengthAuto(30)
            .MinimumLengthAuto(2);

        RuleFor(_ => _.User.Password)
            .Required()
            .MatchesPassword();
    }
}