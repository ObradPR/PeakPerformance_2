using PeakPerformance.Application.BusinessLogic.Users.Commands;

namespace PeakPerformance.Application.BusinessLogic.Users.Validators;

public class ChangePasswordValidator : AbstractValidator<ChangePasswordCommand>
{
    public ChangePasswordValidator()
    {
        RuleFor(_ => _.Data.OldPassword)
            .Required();

        RuleFor(_ => _.Data.NewPassword)
            .Required()
            .MatchesPassword();

        RuleFor(_ => _.Data.RepeatPassword)
             .Required()
             .EqualAuto(_ => _.Data.NewPassword);
    }
}