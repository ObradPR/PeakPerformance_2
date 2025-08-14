using PeakPerformance.Application.Dtos.Bodyweights;

namespace PeakPerformance.Application.BusinessLogic.Bodyweights.Commands;

public class SaveBodyweightCommand(BodyweightDto data) : IRequest<BaseResponseWrapper>
{
    public BodyweightDto Data { get; set; } = data;

    public class SaveBodyweightCommandHandler(IUnitOfWork unitOfWork, IIdentityUser identityUser) : IRequestHandler<SaveBodyweightCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(SaveBodyweightCommand request, CancellationToken cancellationToken)
        {
            if (request.Data == null)
                return new(new Error(nameof(Bodyweight), ResourceValidation.Required.FormatWith(nameof(Bodyweight))));

            var existingModel = request.Data.Id.IsNotEmpty()
                ? await unitOfWork.GetSingleAsync<Bodyweight>(request.Data.Id)
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