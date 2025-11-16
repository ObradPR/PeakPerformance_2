using PeakPerformance.Application.Dtos.Users;

namespace PeakPerformance.Application.BusinessLogic.Users.Commands;

public class UpdatePersonalDetailsCommand(UserDto user) : IRequest<BaseResponseWrapper>
{
    public UserDto Data { get; set; } = user;

    public class UpdatePersonalDetailsCommandHandler(IDatabaseContext db, IIdentityUser identityUser)
        : IRequestHandler<UpdatePersonalDetailsCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(UpdatePersonalDetailsCommand request, CancellationToken cancellationToken)
        {
            var model = await db.Users.FirstOrDefaultAsync(_ => _.Id == identityUser.Id, cancellationToken);

            if (model == null)
                return new(new Error(nameof(User), ResourceValidation.Not_Found.FormatWith(nameof(User))));

            if (request.Data.Email.IsNotNullOrWhiteSpace() && request.Data.Email != model.Email) // in case of updating email
            {
                if (await db.Users.IgnoreQueryFilters().AnyAsync(_ => _.Email == request.Data.Email, cancellationToken))
                {
                    return new(new Error(nameof(User.Email), ResourceValidation.In_Use.FormatWith(nameof(user.Email))));
                }
            }

            request.Data.ToModel(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}