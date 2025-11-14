using PeakPerformance.Application.Attributes;
using PeakPerformance.Application.Dtos.MeasurementGoals;
using System.Reflection;

namespace PeakPerformance.Application.BusinessLogic.MeasurementGoals.Commands;

public class CreateMeasurementGoalCommand(MeasurementGoalCreateDto data) : IRequest<BaseResponseWrapper>
{
    public MeasurementGoalCreateDto Data { get; set; } = data;

    public class SaveMeasurementGoalCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<CreateMeasurementGoalCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(CreateMeasurementGoalCommand request, CancellationToken cancellationToken)
        {
            if (request.Data == null)
                return new(new Error(nameof(MeasurementGoal), ResourceValidation.Required.FormatWith(nameof(MeasurementGoal))));

            var hasAtLeastOne = typeof(MeasurementGoalCreateDto)
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
                    new Error(nameof(MeasurementGoal), ResourceValidation.At_Least_One.FormatWith("body part"))
                );
            }

            var models = request.Data.ToModels(identityUser.Id);

            db.MeasurementGoals.AddRange(models);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}