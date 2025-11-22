using PeakPerformance.Application.Dtos.Sets;

namespace PeakPerformance.Application.BusinessLogic.Sets.Commands;

public class SaveSetCommand(WorkoutExerciseSetDto data) : IRequest<BaseResponseWrapper>
{
    public WorkoutExerciseSetDto Data { get; set; } = data;

    public class SaveSetCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<SaveSetCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(SaveSetCommand request, CancellationToken cancellationToken)
        {
            if (request.Data == null)
                return new(new Error("Set", ResourceValidation.Required.FormatWith("Set")));

            var existingModel = request.Data.Id.IsNotEmpty()
                ? await db.WorkoutExerciseSets.GetSingleAsync(request.Data.Id)
                : null;

            var model = existingModel ?? new();
            request.Data.ToModel(model, identityUser.Id);

            if (model.IsNew)
                db.WorkoutExerciseSets.Add(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}