using PeakPerformance.Application.Dtos.Measurements;

namespace PeakPerformance.Application.BusinessLogic.Measurements.Commands;

public class SaveMeasurementCommand(MeasurementDto data) : IRequest<BaseResponseWrapper>
{
    public MeasurementDto Data { get; set; } = data;

    public class SaveMeasurementCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<SaveMeasurementCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(SaveMeasurementCommand request, CancellationToken cancellationToken)
        {
            if (request.Data == null)
                return new(new Error(nameof(Measurement), ResourceValidation.Required.FormatWith(nameof(Measurement))));

            var existingModel = request.Data.Id.IsNotEmpty()
                ? await db.Measurements.GetSingleAsync(request.Data.Id)
                : null;

            var model = existingModel ?? new();
            request.Data.ToModel(model, identityUser.Id);

            if (model.IsNew)
                db.Measurements.Add(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}