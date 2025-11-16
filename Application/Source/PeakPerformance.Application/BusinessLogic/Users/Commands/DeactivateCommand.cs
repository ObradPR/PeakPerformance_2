namespace PeakPerformance.Application.BusinessLogic.Users.Commands;

public class DeactivateCommand() : IRequest<BaseResponseWrapper>
{
    public class DeactivateCommandHandler(IDatabaseContext db, IIdentityUser identityUser)
        : IRequestHandler<DeactivateCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(DeactivateCommand request, CancellationToken cancellationToken)
        {
            var model = await db.Users.FirstOrDefaultAsync(_ => _.Id == identityUser.Id, cancellationToken);

            if (model == null)
                return new(new Error(nameof(User), ResourceValidation.Not_Found.FormatWith(nameof(User))));

            model.IsActive = false;

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}