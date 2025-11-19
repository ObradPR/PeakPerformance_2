using PeakPerformance.Domain.Exceptions;
using PeakPerformance.Infrastructure.Storage.Interfaces;

namespace PeakPerformance.Application.BusinessLogic.Users.Commands;

public class DeleteProfilePictureCommand() : IRequest<BaseResponseWrapper>
{
    public class DeleteProfilePictureCommandHandler(IDatabaseContext db, IIdentityUser identityUser, ICloudinaryService cloudinaryService)
        : IRequestHandler<DeleteProfilePictureCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(DeleteProfilePictureCommand request, CancellationToken cancellationToken)
        {
            var model = await db.Users.FirstOrDefaultAsync(_ => _.Id == identityUser.Id, cancellationToken);

            if (model == null)
                return new(new Error(nameof(User), ResourceValidation.Not_Found.FormatWith(nameof(User))));

            var imageDeleteResult = await cloudinaryService.DeletePhotoAsync(model.PublicId);

            if (imageDeleteResult.Error != null)
                throw new UploadFileException(imageDeleteResult.Error.Message);

            model.ProfilePictureUrl = null;
            model.PublicId = null;

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}