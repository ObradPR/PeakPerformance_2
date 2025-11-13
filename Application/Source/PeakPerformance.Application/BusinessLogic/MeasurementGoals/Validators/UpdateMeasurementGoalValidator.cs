using PeakPerformance.Application.BusinessLogic.MeasurementGoals.Commands;

namespace PeakPerformance.Application.BusinessLogic.MeasurementGoals.Validators;

public class UpdateMeasurementGoalValidator : AbstractValidator<UpdateMeasurementGoalCommand>
{
    public UpdateMeasurementGoalValidator()
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

        RuleFor(_ => _.Data.MeasurementUnitId)
            .Required()
            .IsInEnumAuto();

        RuleFor(_ => _.Data.StartDate)
           .Required()
           .InValidRangeOfDate(null, Functions.GOAL_START_DATE_LATEST);

        RuleFor(_ => _.Data.EndDate)
            .Required()
            .InValidRangeOfDate(fromDateFunc: _ => _.Data.StartDate);
    }
}