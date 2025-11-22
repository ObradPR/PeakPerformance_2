using PeakPerformance.Application.BusinessLogic.Workouts.Commands;

namespace PeakPerformance.Application.BusinessLogic.Workouts.Validators;

public class SaveWorkoutValidator : AbstractValidator<SaveWorkoutCommand>
{
    public SaveWorkoutValidator()
    {
        RuleFor(_ => _.Data.Name)
            .Required();

        RuleFor(_ => _.Data.LogDate)
            .Required();
    }
}