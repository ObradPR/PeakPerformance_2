namespace PeakPerformance.Application.BusinessLogic.Workouts.Commands;

public class UpdateWorkoutCompleteStatusCommand(long id) : IRequest<BaseResponseWrapper>
{
    public long Id { get; set; } = id;

    public class UpdateWorkoutCompleteStatusCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<UpdateWorkoutCompleteStatusCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(UpdateWorkoutCompleteStatusCommand request, CancellationToken cancellationToken)
        {
            var model = await db.Workouts.GetSingleAsync(_ => _.Id == request.Id && _.UserId == identityUser.Id && _.LogDate <= Functions.TODAY);

            model.IsCompleted = !(model.IsCompleted ?? false);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}