namespace PeakPerformance.Application.BusinessLogic.ExerciseGoals.Commands;

public class DeleteExerciseGoalCommand(long id) : IRequest<BaseResponseWrapper>
{
    public long Id { get; set; } = id;

    public class DeleteExerciseGoalCommandHandler(IDatabaseContext db) : IRequestHandler<DeleteExerciseGoalCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(DeleteExerciseGoalCommand request, CancellationToken cancellationToken)
        {
            var model = await db.ExerciseGoals.GetSingleAsync(request.Id);

            if (model == null)
                return new(new Error("Goal", ResourceValidation.Not_Found));

            db.ExerciseGoals.Remove(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}