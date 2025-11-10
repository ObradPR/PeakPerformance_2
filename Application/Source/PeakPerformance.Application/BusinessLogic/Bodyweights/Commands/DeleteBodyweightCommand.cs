namespace PeakPerformance.Application.BusinessLogic.Bodyweights.Commands;

public class DeleteBodyweightCommand(long id) : IRequest<BaseResponseWrapper>
{
    public long Id { get; set; } = id;

    public class DeleteBodyweightCommandHandler(IDatabaseContext db) : IRequestHandler<DeleteBodyweightCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(DeleteBodyweightCommand request, CancellationToken cancellationToken)
        {
            var model = await db.Bodyweights.GetSingleAsync(request.Id);

            if (model == null)
                return new(new Error(nameof(Bodyweight), ResourceValidation.Not_Found));

            db.Bodyweights.Remove(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}