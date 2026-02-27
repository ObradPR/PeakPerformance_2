using PeakPerformance.Application.BusinessLogic.Exercises.Commands;

namespace PeakPerformance.Application.BusinessLogic.Exercises.Validators;

public class AdminSaveExerciseValidator : AbstractValidator<AdminSaveExerciseCommand>
{
    public AdminSaveExerciseValidator()
    {
        RuleFor(_ => _.Data.Name)
            .Required();

        RuleFor(_ => _.Data.EquipmentName)
            .Required();

        RuleFor(_ => _.Data.BodyPart)
            .Required();

        RuleFor(_ => _.Data.PrimaryMuscleGroupIds)
            .Must(ids => ids != null)
            .WithMessageAuto(ResourceValidation.Required);

        RuleFor(_ => _.Data.ExerciseTypeId)
            .Required();

        RuleFor(_ => _.Data.Instructions)
            .Required();
    }
}