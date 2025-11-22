namespace PeakPerformance.Application.BusinessLogic.Exercises.Commands;

public class DeleteExerciseCommand(long id) : IRequest<BaseResponseWrapper>
{
    public long Id { get; set; } = id;

    public class DeleteExerciseCommandHandler(IDatabaseContext db) : IRequestHandler<DeleteExerciseCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(DeleteExerciseCommand request, CancellationToken cancellationToken)
        {
            var model = await db.WorkoutExercises
                .Include(_ => _.WorkoutExerciseSets)
                .FirstOrDefaultAsync(_ => _.Id == request.Id, cancellationToken);

            if (model == null)
                return new(new Error(nameof(Exercise), ResourceValidation.Not_Found));

            // Remove sets
            db.WorkoutExerciseSets.RemoveRange(model.WorkoutExerciseSets);

            // Remove exercises
            db.WorkoutExercises.Remove(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}