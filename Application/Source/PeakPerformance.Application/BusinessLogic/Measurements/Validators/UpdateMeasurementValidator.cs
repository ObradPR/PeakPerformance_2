using PeakPerformance.Application.BusinessLogic.Measurements.Commands;

namespace PeakPerformance.Application.BusinessLogic.Measurements.Validators;

public class UpdateMeasurementValidator : AbstractValidator<UpdateMeasurementCommand>
{
    public UpdateMeasurementValidator()
    {
        RuleFor(_ => _.Data.Size)
            .Required()
            .GreaterThanAuto(10)
            .LessThanAuto(1000);

        RuleFor(_ => _.Data.BodyPartId)
            .Required()
            .IsInEnumAuto();

        RuleFor(_ => _.Data.MeasurementUnitId)
            .Required()
            .IsInEnumAuto();
    }
}