using PeakPerformance.Application.Dtos.MeasurementGoals;

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

            var models = request.Data.ToModels(identityUser.Id);

            db.MeasurementGoals.AddRange(models);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}