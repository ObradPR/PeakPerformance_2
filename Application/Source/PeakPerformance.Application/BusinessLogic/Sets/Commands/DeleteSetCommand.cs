namespace PeakPerformance.Application.BusinessLogic.Sets.Commands;

public class DeleteSetCommand(long id) : IRequest<BaseResponseWrapper>
{
    public long Id { get; set; } = id;

    public class DeleteSetCommandHandler(IDatabaseContext db) : IRequestHandler<DeleteSetCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(DeleteSetCommand request, CancellationToken cancellationToken)
        {
            var model = await db.WorkoutExerciseSets
                .FirstOrDefaultAsync(_ => _.Id == request.Id, cancellationToken);

            if (model == null)
                return new(new Error("Set", ResourceValidation.Not_Found.FormatWith("Set")));

            // Remove sets
            db.WorkoutExerciseSets.RemoveRange(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}