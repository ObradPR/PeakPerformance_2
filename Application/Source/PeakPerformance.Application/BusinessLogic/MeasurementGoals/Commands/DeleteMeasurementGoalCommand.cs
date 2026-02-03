namespace PeakPerformance.Application.BusinessLogic.MeasurementGoals.Commands;

public class DeleteMeasurementGoalCommand(long id) : IRequest<BaseResponseWrapper>
{
    public long Id { get; set; } = id;

    public class DeleteMeasurementGoalCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<DeleteMeasurementGoalCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(DeleteMeasurementGoalCommand request, CancellationToken cancellationToken)
        {
            var model = await db.MeasurementGoals.GetSingleAsync(_ => _.Id == request.Id && _.UserId == identityUser.Id);

            if (model == null)
                return new(new Error("Goal", ResourceValidation.Not_Found));

            db.MeasurementGoals.Remove(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}