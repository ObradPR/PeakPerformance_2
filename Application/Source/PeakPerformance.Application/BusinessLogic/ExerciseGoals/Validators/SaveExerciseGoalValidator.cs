using PeakPerformance.Application.BusinessLogic.ExerciseGoals.Commands;

namespace PeakPerformance.Application.BusinessLogic.ExerciseGoals.Validators;

public class SaveExerciseGoalValidator : AbstractValidator<SaveExerciseGoalCommand>
{
    public SaveExerciseGoalValidator()
    {
        RuleFor(_ => _.Data.Weight)
            .GreaterThanAuto(20, _ => _.Data.IsStrength == true)
            .LessThanAuto(1000, _ => _.Data.IsStrength == true);

        RuleFor(_ => _.Data.Reps)
            .Required()
            .GreaterThanAuto(0);

        RuleFor(_ => _.Data.StartDate)
            .Required()
            .InValidRangeOfDate(null, Functions.GOAL_START_DATE_LATEST);

        RuleFor(_ => _.Data.EndDate)
            .Required()
            .InValidRangeOfDate(fromDateFunc: _ => _.Data.StartDate);
    }
}