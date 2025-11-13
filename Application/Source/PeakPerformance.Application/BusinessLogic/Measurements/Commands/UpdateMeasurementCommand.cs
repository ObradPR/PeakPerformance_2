using PeakPerformance.Application.Dtos.Measurements;

namespace PeakPerformance.Application.BusinessLogic.Measurements.Commands;

public class UpdateMeasurementCommand(MeasurementDto data) : IRequest<BaseResponseWrapper>
{
    public MeasurementDto Data { get; set; } = data;

    public class EditMeasurementCommandHandler(IDatabaseContext db) : IRequestHandler<UpdateMeasurementCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(UpdateMeasurementCommand request, CancellationToken cancellationToken)
        {
            if (request.Data == null)
                return new(new Error(nameof(Measurement), ResourceValidation.Required.FormatWith(nameof(Measurement))));

            var model = request.Data.Id.IsNotEmpty()
                ? await db.Measurements.GetSingleAsync(request.Data.Id)
                : null;

            if (model == null)
                return new(new Error(nameof(Measurement), ResourceValidation.Not_Found.FormatWith(nameof(Measurement))));

            request.Data.ToModel(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}