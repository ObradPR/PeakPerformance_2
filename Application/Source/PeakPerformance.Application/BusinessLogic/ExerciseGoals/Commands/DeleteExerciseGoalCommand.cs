namespace PeakPerformance.Application.BusinessLogic.ExerciseGoals.Commands;

public class DeleteExerciseGoalCommand(long id) : IRequest<BaseResponseWrapper>
{
    public long Id { get; set; } = id;

    public class DeleteExerciseGoalCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<DeleteExerciseGoalCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(DeleteExerciseGoalCommand request, CancellationToken cancellationToken)
        {
            var model = await db.ExerciseGoals.GetSingleAsync(_ => _.Id == request.Id && _.UserId == identityUser.Id);

            if (model == null)
                return new(new Error("Goal", ResourceValidation.Not_Found));

            db.ExerciseGoals.Remove(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}