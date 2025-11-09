using PeakPerformance.Application.BusinessLogic.BodyweightGoals.Commands;

namespace PeakPerformance.Application.BusinessLogic.BodyweightGoals.Validators;

public class SaveBodyweightGoalValidator : AbstractValidator<SaveBodyweightGoalCommand>
{
    public SaveBodyweightGoalValidator()
    {
        RuleFor(_ => _.Data.Target)
           .Required()
           .GreaterThanAuto(20)
           .LessThanAuto(1000);

        RuleFor(_ => _.Data.StartDate)
            .Required()
            .InValidRangeOfDate(null, Functions.GOAL_START_DATE_LATEST);

        RuleFor(_ => _.Data.EndDate)
            .Required()
            .InValidRangeOfDate(fromDateFunc: _ => _.Data.StartDate);
    }
}