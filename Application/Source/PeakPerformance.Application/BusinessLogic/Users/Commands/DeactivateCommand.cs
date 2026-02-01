using PeakPerformance.Application.Dtos.Users;

namespace PeakPerformance.Application.BusinessLogic.Users.Commands;

public class DeactivateCommand(DeactivateReasonDto data) : IRequest<BaseResponseWrapper>
{
    public DeactivateReasonDto Data { get; set; } = data;

    public class DeactivateCommandHandler(IDatabaseContext db, IIdentityUser identityUser)
        : IRequestHandler<DeactivateCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(DeactivateCommand request, CancellationToken cancellationToken)
        {
            var model = await db.Users.FirstOrDefaultAsync(_ => _.Id == identityUser.Id, cancellationToken);

            if (model == null)
                return new(new Error(nameof(User), ResourceValidation.Not_Found.FormatWith(nameof(User))));

            model.DeactivateReason = request.Data.Reason;
            db.Users.Remove(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}