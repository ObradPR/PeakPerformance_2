namespace PeakPerformance.Application.BusinessLogic.BodyweightGoals.Commands;

public class DeleteBodyweightGoalCommand(long id) : IRequest<BaseResponseWrapper>
{
    public long Id { get; set; } = id;

    public class DeleteBodyweightGoalCommandHandler(IUnitOfWork unitOfWork) : IRequestHandler<DeleteBodyweightGoalCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(DeleteBodyweightGoalCommand request, CancellationToken cancellationToken)
        {
            var model = await unitOfWork.GetSingleAsync<BodyweightGoal>(request.Id);

            if (model == null)
                return new(new Error("Goal", ResourceValidation.Not_Found));

            unitOfWork.Delete(model);

            await unitOfWork.SaveAsync();

            return new();
        }
    }
}