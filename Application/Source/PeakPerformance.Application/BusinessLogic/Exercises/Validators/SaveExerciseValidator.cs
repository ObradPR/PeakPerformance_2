using PeakPerformance.Application.BusinessLogic.Exercises.Commands;

namespace PeakPerformance.Application.BusinessLogic.Exercises.Validators;

public class SaveExerciseValidator : AbstractValidator<SaveExerciseCommand>
{
    public SaveExerciseValidator()
    {
        RuleFor(_ => _.Data.ExerciseId)
            .Required();

        RuleFor(_ => _.Data.WorkoutId)
           .Required();
    }
}