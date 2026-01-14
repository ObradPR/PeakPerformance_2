using PeakPerformance.Application.BusinessLogic.Users.Commands;

namespace PeakPerformance.Application.BusinessLogic.Users.Validators;

public class UpdatePersonalDetailsValidator : AbstractValidator<UpdatePersonalDetailsCommand>
{
    public UpdatePersonalDetailsValidator()
    {
        RuleFor(_ => _.Data.FullName)
            .Required()
            .MaximumLengthAuto(30);

        RuleFor(_ => _.Data.Username)
            .Required()
            .MaximumLengthAuto(30);

        RuleFor(_ => _.Data.DateOfBirth)
            .Required();

        RuleFor(_ => _.Data.Height)
            .GreaterThanAuto(0, _ => _.Data.Height.HasValue);

        RuleFor(_ => _.Data.Email)
            .Required()
            .EmailAddressAuto();

        RuleFor(_ => _.Data.Description)
            .MaximumLengthAuto(500);
    }
}