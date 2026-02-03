namespace PeakPerformance.Application.BusinessLogic.BodyweightGoals.Commands;

public class DeleteBodyweightGoalCommand(long id) : IRequest<BaseResponseWrapper>
{
    public long Id { get; set; } = id;

    public class DeleteBodyweightGoalCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<DeleteBodyweightGoalCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(DeleteBodyweightGoalCommand request, CancellationToken cancellationToken)
        {
            var model = await db.BodyweightGoals.GetSingleAsync(_ => _.Id == request.Id && _.UserId == identityUser.Id);

            if (model == null)
                return new(new Error("Goal", ResourceValidation.Not_Found));

            db.BodyweightGoals.Remove(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}