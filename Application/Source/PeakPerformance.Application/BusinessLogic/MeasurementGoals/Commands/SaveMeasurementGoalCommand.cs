using PeakPerformance.Application.Dtos.MeasurementGoals;

namespace PeakPerformance.Application.BusinessLogic.MeasurementGoals.Commands;

public class SaveMeasurementGoalCommand(MeasurementGoalCreateDto data) : IRequest<BaseResponseWrapper>
{
    public MeasurementGoalCreateDto Data { get; set; } = data;

    public class SaveMeasurementGoalCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<SaveMeasurementGoalCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(SaveMeasurementGoalCommand request, CancellationToken cancellationToken)
        {
            if (request.Data == null)
                return new(new Error(nameof(MeasurementGoal), ResourceValidation.Required.FormatWith(nameof(MeasurementGoal))));

            var existingModel = request.Data.Id.IsNotEmpty()
                ? await db.MeasurementGoals.GetSingleAsync(request.Data.Id)
                : null;

            var model = existingModel ?? new();
            //request.Data.ToModel(model, identityUser.Id);

            //if (model.IsNew)
            //    db.MeasurementGoals.Add(model);

            //await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}