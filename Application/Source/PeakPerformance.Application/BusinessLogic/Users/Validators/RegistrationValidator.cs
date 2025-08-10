using PeakPerformance.Application.BusinessLogic.Users.Commands;

namespace PeakPerformance.Application.BusinessLogic.Users.Validators;

public class RegistrationValidator : AbstractValidator<RegistrationCommand>
{
    public RegistrationValidator()
    {
        RuleFor(_ => _.User.FullName)
            .Required()
            .MaximumLengthAuto(30);

        RuleFor(_ => _.User.Username)
            .Required()
            .MaximumLengthAuto(30);

        RuleFor(_ => _.User.Email)
            .Required()
            .EmailAddressAuto()
            .MaximumLengthAuto(100);

        RuleFor(_ => _.User.Password)
            .Required()
            .MatchesPassword();

        RuleFor(_ => _.User.ConfirmPassword)
             .Required()
             .EqualAuto(_ => _.User.Password);

        RuleFor(_ => _.User.DateOfBirth)
            .Required();
    }
}