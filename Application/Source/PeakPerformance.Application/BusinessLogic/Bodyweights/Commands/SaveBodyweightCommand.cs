using PeakPerformance.Application.Dtos.Bodyweights;

namespace PeakPerformance.Application.BusinessLogic.Bodyweights.Commands;

public class SaveBodyweightCommand(BodyweightDto data) : IRequest<BaseResponseWrapper>
{
    public BodyweightDto Data { get; set; } = data;

    public class SaveBodyweightCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<SaveBodyweightCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(SaveBodyweightCommand request, CancellationToken cancellationToken)
        {
            if (request.Data == null)
                return new(new Error(nameof(Bodyweight), ResourceValidation.Required.FormatWith(nameof(Bodyweight))));

            var existingModel = request.Data.Id.IsNotEmpty()
                ? await db.Bodyweights.GetSingleAsync(request.Data.Id)
                : null;

            var model = existingModel ?? new();
            request.Data.ToModel(model, identityUser.Id);

            if (model.IsNew)
                db.Bodyweights.Add(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}