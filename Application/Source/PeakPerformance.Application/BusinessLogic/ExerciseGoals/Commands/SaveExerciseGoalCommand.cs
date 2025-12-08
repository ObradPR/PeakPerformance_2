using PeakPerformance.Application.Dtos.ExerciseGoals;

namespace PeakPerformance.Application.BusinessLogic.ExerciseGoals.Commands;

public class SaveExerciseGoalCommand(ExerciseGoalDto data) : IRequest<BaseResponseWrapper>
{
    public ExerciseGoalDto Data { get; set; } = data;

    public class SaveExerciseGoalCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<SaveExerciseGoalCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(SaveExerciseGoalCommand request, CancellationToken cancellationToken)
        {
            if (request.Data == null)
                return new(new Error(nameof(ExerciseGoal), ResourceValidation.Required.FormatWith(nameof(ExerciseGoal))));

            var existingModel = request.Data.Id.IsNotEmpty()
                ? await db.ExerciseGoals.GetSingleAsync(request.Data.Id)
                : null;

            var model = existingModel ?? new();
            request.Data.ToModel(model, identityUser.Id);

            if (model.IsNew)
                db.ExerciseGoals.Add(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}