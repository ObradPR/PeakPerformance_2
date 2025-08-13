namespace PeakPerformance.Application.BusinessLogic.Bodyweights.Commands;

public class DeleteBodyweightCommand(long id) : IRequest<BaseResponseWrapper>
{
    public long Id { get; set; } = id;

    public class DeleteBodyweightCommandHandler(IUnitOfWork unitOfWork) : IRequestHandler<DeleteBodyweightCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(DeleteBodyweightCommand request, CancellationToken cancellationToken)
        {
            var model = await unitOfWork.GetSingleAsync<Bodyweight>(_ => _.Id == request.Id);

            if (model == null)
                return new(new Error(nameof(Bodyweight), ResourceValidation.Not_Found));

            unitOfWork.Delete(model);

            await unitOfWork.SaveAsync();

            return new();
        }
    }
}