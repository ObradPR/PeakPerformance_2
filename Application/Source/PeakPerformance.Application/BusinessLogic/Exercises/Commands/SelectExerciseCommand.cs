namespace PeakPerformance.Application.BusinessLogic.Exercises.Commands;

public class SelectExerciseCommand(long id) : IRequest<BaseResponseWrapper>
{
    public long Id { get; set; } = id;

    public class SelectExerciseCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<SelectExerciseCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(SelectExerciseCommand request, CancellationToken cancellationToken)
        {
            if (request.Id.IsEmpty())
                return new();

            var count = await db.UserSelectedExercises.CountAsync(_ => _.UserId == identityUser.Id);

            if (count > 5)
                return new();

            var model = new UserSelectedExercise
            {
                ExerciseId = request.Id,
                UserId = identityUser.Id,
            };

            db.UserSelectedExercises.Add(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}