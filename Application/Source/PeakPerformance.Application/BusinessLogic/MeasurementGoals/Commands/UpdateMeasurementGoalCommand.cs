using PeakPerformance.Application.Dtos.MeasurementGoals;

namespace PeakPerformance.Application.BusinessLogic.MeasurementGoals.Commands;

public class UpdateMeasurementGoalCommand(MeasurementGoalDto data) : IRequest<BaseResponseWrapper>
{
    public MeasurementGoalDto Data { get; set; } = data;

    public class EditMeasurementCommandHandler(IDatabaseContext db) : IRequestHandler<UpdateMeasurementGoalCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(UpdateMeasurementGoalCommand request, CancellationToken cancellationToken)
        {
            if (request.Data == null)
                return new(new Error(nameof(MeasurementGoal), ResourceValidation.Required.FormatWith(nameof(MeasurementGoal))));

            var model = request.Data.Id.IsNotEmpty()
                ? await db.MeasurementGoals.GetSingleAsync(request.Data.Id)
                : null;

            if (model == null)
                return new(new Error(nameof(MeasurementGoal), ResourceValidation.Not_Found.FormatWith(nameof(MeasurementGoal))));

            request.Data.ToModel(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}