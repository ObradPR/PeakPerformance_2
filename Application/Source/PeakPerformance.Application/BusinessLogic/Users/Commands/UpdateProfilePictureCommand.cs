using PeakPerformance.Application.Dtos._Base;
using PeakPerformance.Domain.Exceptions;
using PeakPerformance.Domain.ValueObjects;
using PeakPerformance.Infrastructure.Storage.Interfaces;

namespace PeakPerformance.Application.BusinessLogic.Users.Commands;

public class UpdateProfilePictureCommand(FileInformationDto file) : IRequest<BaseResponseWrapper>
{
    public FileInformationDto File { get; set; } = file;

    public class UpdateProfilePictureCommandHandler(IDatabaseContext db, IIdentityUser identityUser, ICloudinaryService cloudinaryService, IMapper mapper)
        : IRequestHandler<UpdateProfilePictureCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(UpdateProfilePictureCommand request, CancellationToken cancellationToken)
        {
            var model = await db.Users.FirstOrDefaultAsync(_ => _.Id == identityUser.Id, cancellationToken);

            if (model == null)
                return new(new Error(nameof(User), ResourceValidation.Not_Found.FormatWith(nameof(User))));

            var imageUploadResult = await cloudinaryService.UploadPhotoAsync(mapper.Map<FileInformation>(request.File));

            if (imageUploadResult.Error != null)
                throw new UploadFileException(imageUploadResult.Error.Message);

            model.ProfilePictureUrl = imageUploadResult.SecureUrl.ToString();
            model.PublicId = imageUploadResult.PublicId;

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}