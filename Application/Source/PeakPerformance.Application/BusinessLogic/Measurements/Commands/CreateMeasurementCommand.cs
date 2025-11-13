using PeakPerformance.Application.Dtos.Measurements;

namespace PeakPerformance.Application.BusinessLogic.Measurements.Commands;

public class CreateMeasurementCommand(MeasurementCreateDto data) : IRequest<BaseResponseWrapper>
{
    public MeasurementCreateDto Data { get; set; } = data;

    public class SaveMeasurementCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<CreateMeasurementCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(CreateMeasurementCommand request, CancellationToken cancellationToken)
        {
            if (request.Data == null)
                return new(new Error(nameof(Measurement), ResourceValidation.Required.FormatWith(nameof(Measurement))));

            var models = request.Data.ToModels(identityUser.Id);

            db.Measurements.AddRange(models);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}