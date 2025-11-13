using PeakPerformance.Application.BusinessLogic.Measurements.Commands;

namespace PeakPerformance.Application.BusinessLogic.Measurements.Validators;

public class CreateMeasurementValidator : AbstractValidator<CreateMeasurementCommand>
{
    public CreateMeasurementValidator()
    {
        RuleFor(_ => _.Data.Waist)
            .GreaterThanAuto(10, _ => _.Data.Waist.HasValue)
            .LessThanAuto(1000, _ => _.Data.Waist.HasValue);

        RuleFor(_ => _.Data.Hips)
            .GreaterThanAuto(10, _ => _.Data.Hips.HasValue)
            .LessThanAuto(1000, _ => _.Data.Hips.HasValue);

        RuleFor(_ => _.Data.Neck)
            .GreaterThanAuto(10, _ => _.Data.Neck.HasValue)
            .LessThanAuto(1000, _ => _.Data.Neck.HasValue);

        RuleFor(_ => _.Data.Chest)
            .GreaterThanAuto(10, _ => _.Data.Chest.HasValue)
            .LessThanAuto(1000, _ => _.Data.Chest.HasValue);

        RuleFor(_ => _.Data.Shoulders)
            .GreaterThanAuto(10, _ => _.Data.Shoulders.HasValue)
            .LessThanAuto(1000, _ => _.Data.Shoulders.HasValue);

        RuleFor(_ => _.Data.RightBicep)
            .GreaterThanAuto(10, _ => _.Data.RightBicep.HasValue)
            .LessThanAuto(1000, _ => _.Data.RightBicep.HasValue);

        RuleFor(_ => _.Data.LeftBicep)
            .GreaterThanAuto(10, _ => _.Data.LeftBicep.HasValue)
            .LessThanAuto(1000, _ => _.Data.LeftBicep.HasValue);

        RuleFor(_ => _.Data.RightForearm)
            .GreaterThanAuto(10, _ => _.Data.RightForearm.HasValue)
            .LessThanAuto(1000, _ => _.Data.RightForearm.HasValue);

        RuleFor(_ => _.Data.LeftForearm)
            .GreaterThanAuto(10, _ => _.Data.LeftForearm.HasValue)
            .LessThanAuto(1000, _ => _.Data.LeftForearm.HasValue);

        RuleFor(_ => _.Data.RightThigh)
            .GreaterThanAuto(10, _ => _.Data.RightThigh.HasValue)
            .LessThanAuto(1000, _ => _.Data.RightThigh.HasValue);

        RuleFor(_ => _.Data.LeftThigh)
            .GreaterThanAuto(10, _ => _.Data.LeftThigh.HasValue)
            .LessThanAuto(1000, _ => _.Data.LeftThigh.HasValue);

        RuleFor(_ => _.Data.RightCalf)
            .GreaterThanAuto(10, _ => _.Data.RightCalf.HasValue)
            .LessThanAuto(1000, _ => _.Data.RightCalf.HasValue);

        RuleFor(_ => _.Data.LeftCalf)
            .GreaterThanAuto(10, _ => _.Data.LeftCalf.HasValue)
            .LessThanAuto(1000, _ => _.Data.LeftCalf.HasValue);

        RuleFor(_ => _.Data.MeasurementUnitId)
            .Required()
            .IsInEnumAuto();
    }
}