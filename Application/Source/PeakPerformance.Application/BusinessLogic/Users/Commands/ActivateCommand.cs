namespace PeakPerformance.Application.BusinessLogic.Users.Commands;

public class ActivateCommand() : IRequest<BaseResponseWrapper>
{
    public class ActivateCommandHandler(IDatabaseContext db, IIdentityUser identityUser)
        : IRequestHandler<ActivateCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(ActivateCommand request, CancellationToken cancellationToken)
        {
            var model = await db.Users
                .IgnoreQueryFilters()
                .FirstOrDefaultAsync(_ => _.Id == identityUser.Id, cancellationToken);

            if (model == null)
                return new(new Error(nameof(User), ResourceValidation.Not_Found.FormatWith(nameof(User))));

            model.IsActive = true;

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}