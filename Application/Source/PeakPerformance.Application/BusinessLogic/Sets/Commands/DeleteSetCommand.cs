namespace PeakPerformance.Application.BusinessLogic.Sets.Commands;

public class DeleteSetCommand(long id) : IRequest<BaseResponseWrapper>
{
    public long Id { get; set; } = id;

    public class DeleteSetCommandHandler(IDatabaseContext db, IIdentityUser identityUser) : IRequestHandler<DeleteSetCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(DeleteSetCommand request, CancellationToken cancellationToken)
        {
            var model = await db.WorkoutExerciseSets
                .FirstOrDefaultAsync(_ => _.Id == request.Id && _.WorkoutExercise.Workout.UserId == identityUser.Id, cancellationToken);

            if (model == null)
                return new(new Error("Set", ResourceValidation.Not_Found.FormatWith("Set")));

            var otherSet = await db.WorkoutExerciseSets
               .Where(_ => _.WorkoutExerciseId == model.WorkoutExerciseId && _.Id != model.Id)
               .ToListAsync(cancellationToken);

            foreach (var s in otherSet.Where(_ => _.Order > model.Order))
                s.Order--;

            // Remove sets
            db.WorkoutExerciseSets.Remove(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}