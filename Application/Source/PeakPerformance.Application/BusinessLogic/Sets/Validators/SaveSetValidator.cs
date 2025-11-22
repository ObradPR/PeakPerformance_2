using PeakPerformance.Application.BusinessLogic.Sets.Commands;

namespace PeakPerformance.Application.BusinessLogic.Sets.Validators;

public class SaveSetValidator : AbstractValidator<SaveSetCommand>
{
    public SaveSetValidator()
    {
        RuleFor(_ => _.Data.Reps)
            .Required()
            .GreaterThanAuto(0);
    }
}