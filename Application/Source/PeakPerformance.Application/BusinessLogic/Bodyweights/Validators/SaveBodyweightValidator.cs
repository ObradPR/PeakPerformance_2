using PeakPerformance.Application.BusinessLogic.Bodyweights.Commands;

namespace PeakPerformance.Application.BusinessLogic.Bodyweights.Validators;

public class SaveBodyweightValidator : AbstractValidator<SaveBodyweightCommand>
{
    public SaveBodyweightValidator()
    {
        RuleFor(_ => _.Data.Value)
            .Required()
            .GreaterThanAuto(20)
            .LessThanAuto(1000);

        RuleFor(_ => _.Data.WeightUnitId)
            .Required()
            .IsInEnumAuto();

        RuleFor(_ => _.Data.BodyFatPercentage)
            .GreaterThanAuto(1, _ => _.Data.BodyFatPercentage.HasValue)
            .LessThanAuto(100, _ => _.Data.BodyFatPercentage.HasValue);
    }
}