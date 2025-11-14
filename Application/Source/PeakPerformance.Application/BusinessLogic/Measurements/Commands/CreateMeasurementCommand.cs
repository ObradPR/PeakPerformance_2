using PeakPerformance.Application.Attributes;
using PeakPerformance.Application.Dtos.Measurements;
using System.Reflection;

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

            var hasAtLeastOne = typeof(MeasurementCreateDto)
                .GetProperties()
                .Where(_ => _.GetCustomAttribute<BodyPartAttribute>() != null)
                .Any(_ =>
                {
                    var value = _.GetValue(request.Data) as decimal?;
                    return value.HasValue;
                });

            if (!hasAtLeastOne)
            {
                return new(
                    new Error(nameof(Measurement), ResourceValidation.At_Least_One.FormatWith("body part"))
                );
            }

            var models = request.Data.ToModels(identityUser.Id);

            db.Measurements.AddRange(models);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}