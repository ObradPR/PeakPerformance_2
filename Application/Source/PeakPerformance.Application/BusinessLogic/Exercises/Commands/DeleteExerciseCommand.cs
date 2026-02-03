namespace PeakPerformance.Application.BusinessLogic.Exercises.Commands;

public class DeleteExerciseCommand(long id) : IRequest<BaseResponseWrapper>
{
    public long Id { get; set; } = id;

    public class DeleteExerciseCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<DeleteExerciseCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(DeleteExerciseCommand request, CancellationToken cancellationToken)
        {
            var model = await db.WorkoutExercises
                .Include(_ => _.WorkoutExerciseSets)
                .FirstOrDefaultAsync(_ => _.Id == request.Id && _.Workout.UserId == identityUser.Id, cancellationToken);

            if (model == null)
                return new(new Error(nameof(Exercise), ResourceValidation.Not_Found));

            var otherExercises = await db.WorkoutExercises
                .Where(_ => _.WorkoutId == model.WorkoutId && _.Id != model.Id)
                .ToListAsync(cancellationToken);

            foreach (var e in otherExercises.Where(_ => _.Order > model.Order))
                e.Order--;

            // Remove sets
            db.WorkoutExerciseSets.RemoveRange(model.WorkoutExerciseSets);

            // Remove exercises
            db.WorkoutExercises.Remove(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}