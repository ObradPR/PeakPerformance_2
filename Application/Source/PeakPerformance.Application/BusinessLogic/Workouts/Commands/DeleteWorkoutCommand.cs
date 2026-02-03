namespace PeakPerformance.Application.BusinessLogic.Workouts.Commands;

public class DeleteWorkoutCommand(long id) : IRequest<BaseResponseWrapper>
{
    public long Id { get; set; } = id;

    public class DeleteWorkoutCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<DeleteWorkoutCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(DeleteWorkoutCommand request, CancellationToken cancellationToken)
        {
            var model = await db.Workouts
                .Include(_ => _.WorkoutExercises)
                    .ThenInclude(_ => _.WorkoutExerciseSets)
                .FirstOrDefaultAsync(_ => _.Id == request.Id && _.UserId == identityUser.Id, cancellationToken);

            if (model == null)
                return new(new Error(nameof(Workout), ResourceValidation.Not_Found));

            // Remove sets
            db.WorkoutExerciseSets.RemoveRange(model.WorkoutExercises.SelectMany(_ => _.WorkoutExerciseSets));

            // Remove exercises
            db.WorkoutExercises.RemoveRange(model.WorkoutExercises);

            // Remove workout
            db.Workouts.Remove(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}