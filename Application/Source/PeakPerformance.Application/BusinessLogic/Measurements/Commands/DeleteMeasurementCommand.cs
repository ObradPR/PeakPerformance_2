namespace PeakPerformance.Application.BusinessLogic.Measurements.Commands;

public class DeleteMeasurementCommand(long id) : IRequest<BaseResponseWrapper>
{
    public long Id { get; set; } = id;

    public class DeleteMeasurementCommandHandler(IDatabaseContext db) : IRequestHandler<DeleteMeasurementCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(DeleteMeasurementCommand request, CancellationToken cancellationToken)
        {
            var model = await db.Measurements.GetSingleAsync(request.Id);

            if (model == null)
                return new(new Error(nameof(Measurement), ResourceValidation.Not_Found));

            db.Measurements.Remove(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}