using PeakPerformance.Application.Dtos.BodyweightGoalDto;

namespace PeakPerformance.Application.BusinessLogic.BodyweightGoals.Commands;

public class SaveBodyweightGoalCommand(BodyweightGoalDto data) : IRequest<BaseResponseWrapper>
{
    public BodyweightGoalDto Data { get; set; } = data;

    public class SaveBodyweightGoalCommandHandler(IUnitOfWork unitOfWork, IIdentityUser identityUser) : IRequestHandler<SaveBodyweightGoalCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(SaveBodyweightGoalCommand request, CancellationToken cancellationToken)
        {
            if (request.Data == null)
                return new(new Error(nameof(BodyweightGoal), ResourceValidation.Required.FormatWith(nameof(BodyweightGoal))));

            var existingModel = request.Data.Id.IsNotEmpty()
                ? await unitOfWork.GetSingleAsync<BodyweightGoal>(request.Data.Id)
                : null;

            var model = existingModel ?? new();
            request.Data.ToModel(model, identityUser.Id);

            if (model.IsNew)
                unitOfWork.Create(model);

            await unitOfWork.SaveAsync();

            return new();
        }
    }
}