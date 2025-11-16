using PeakPerformance.Application.Dtos.Users;

namespace PeakPerformance.Application.BusinessLogic.Users.Commands;

public class ChangePasswordCommand(ChangePasswordDto data) : IRequest<BaseResponseWrapper>
{
    public ChangePasswordDto Data { get; set; } = data;

    public class ChangePasswordCommandHandler(IDatabaseContext db, IIdentityUser identityUser, IUserManager userManager)
        : IRequestHandler<ChangePasswordCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(ChangePasswordCommand request, CancellationToken cancellationToken)
        {
            var model = await db.Users.FirstOrDefaultAsync(_ => _.Id == identityUser.Id, cancellationToken);

            if (model == null)
                return new(new Error(nameof(User), ResourceValidation.Not_Found.FormatWith(nameof(User))));

            // Check old password matching before changing password
            if (!userManager.VerifyPassword(request.Data.OldPassword, model.Password))
                return new(new Error(nameof(User), ResourceValidation.Is_Wrong.FormatWith(nameof(request.Data.OldPassword))));

            model.Password = userManager.HashPassword(request.Data.NewPassword);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}