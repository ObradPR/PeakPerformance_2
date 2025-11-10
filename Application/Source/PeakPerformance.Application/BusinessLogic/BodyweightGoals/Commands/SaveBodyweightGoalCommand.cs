using PeakPerformance.Application.Dtos.BodyweightGoals;

namespace PeakPerformance.Application.BusinessLogic.BodyweightGoals.Commands;

public class SaveBodyweightGoalCommand(BodyweightGoalDto data) : IRequest<BaseResponseWrapper>
{
    public BodyweightGoalDto Data { get; set; } = data;

    public class SaveBodyweightGoalCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<SaveBodyweightGoalCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(SaveBodyweightGoalCommand request, CancellationToken cancellationToken)
        {
            if (request.Data == null)
                return new(new Error(nameof(BodyweightGoal), ResourceValidation.Required.FormatWith(nameof(BodyweightGoal))));

            var existingModel = request.Data.Id.IsNotEmpty()
                ? await db.BodyweightGoals.GetSingleAsync(request.Data.Id)
                : null;

            var model = existingModel ?? new();
            request.Data.ToModel(model, identityUser.Id);

            if (model.IsNew)
                db.BodyweightGoals.Add(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}