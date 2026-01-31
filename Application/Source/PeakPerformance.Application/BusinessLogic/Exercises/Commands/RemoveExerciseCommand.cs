namespace PeakPerformance.Application.BusinessLogic.Exercises.Commands;

public class RemoveExerciseCommand(long id) : IRequest<BaseResponseWrapper>
{
    public long Id { get; set; } = id;

    public class RemoveExerciseCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<RemoveExerciseCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(RemoveExerciseCommand request, CancellationToken cancellationToken)
        {
            if (request.Id.IsEmpty())
                return new();

            var model = await db.UserSelectedExercises.FirstOrDefaultAsync(_ => _.ExerciseId == request.Id && _.UserId == identityUser.Id, cancellationToken);

            db.UserSelectedExercises.Remove(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}