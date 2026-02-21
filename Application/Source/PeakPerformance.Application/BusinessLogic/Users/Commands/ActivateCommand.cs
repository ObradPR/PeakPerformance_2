namespace PeakPerformance.Application.BusinessLogic.Users.Commands;

public class ActivateCommand(long? userId = null) : IRequest<BaseResponseWrapper>
{
    public long? UserId { get; set; } = userId;

    public class ActivateCommandHandler(IDatabaseContext db, IIdentityUser identityUser)
        : IRequestHandler<ActivateCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(ActivateCommand request, CancellationToken cancellationToken)
        {
            var userId = identityUser.HasRole([eSystemRole.Admin]) && request.UserId.HasValue
                ? request.UserId.Value
                : identityUser.Id;

            var model = await db.Users
                .IgnoreQueryFilters()
                .FirstOrDefaultAsync(_ => _.Id == userId, cancellationToken);

            if (model == null)
                return new(new Error(nameof(User), ResourceValidation.Not_Found.FormatWith(nameof(User))));

            model.IsActive = true;
            model.DeactivateReason = null;

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}