using PeakPerformance.Application.Dtos._Base;
using PeakPerformance.Application.Dtos.Exercises;
using PeakPerformance.Domain.Exceptions;
using PeakPerformance.Domain.ValueObjects;
using PeakPerformance.Infrastructure.Storage.Interfaces;

namespace PeakPerformance.Application.BusinessLogic.Exercises.Commands;

public class AdminSaveExerciseCommand(ExerciseDto data, FileInformationDto file) : IRequest<BaseResponseWrapper>
{
    public ExerciseDto Data { get; set; } = data;

    public FileInformationDto File { get; set; } = file;

    public class AdminSaveExerciseCommandHandler(IDatabaseContext db, IIdentityUser identityUser, ICloudinaryService cloudinaryService, IMapper mapper) : IRequestHandler<AdminSaveExerciseCommand, BaseResponseWrapper>
    {
        public async Task<BaseResponseWrapper> Handle(AdminSaveExerciseCommand request, CancellationToken cancellationToken)
        {
            if (!identityUser.HasRole([eSystemRole.Admin]))
            {
                throw new ForbiddenException();
            }

            if (request.Data == null)
                return new(new Error(nameof(Exercise), ResourceValidation.Required.FormatWith(nameof(Exercise))));

            if (request.Data.Id.IsNotEmpty())
            {
                if (await db.Exercises.AnyAsync(_ => _.Name == request.Data.Name && _.Id != request.Data.Id, cancellationToken))
                    return new(new Error(nameof(Exercise), ResourceValidation.Already_Exist.FormatWith(nameof(Exercise))));
            }
            else
            {
                if (await db.Exercises.AnyAsync(_ => _.Name == request.Data.Name, cancellationToken))
                    return new(new Error(nameof(Exercise), ResourceValidation.Already_Exist.FormatWith(nameof(Exercise))));
            }

            var model = (request.Data.Id.IsNotEmpty()
                ? await db.Exercises.GetSingleAsync(request.Data.Id)
                : null)
                ?? new();

            if (request.File != null)
            {
                var imageUploadResult = await cloudinaryService.UploadPhotoAsync(mapper.Map<FileInformation>(request.File));

                if (imageUploadResult.Error != null)
                    throw new UploadFileException(imageUploadResult.Error.Message);

                model.PictureUrl = imageUploadResult.SecureUrl.ToString();
                model.PublicId = imageUploadResult.PublicId;
            }
            else if (request.Data.RemovePicture == true)
            {
                var imageDeleteResult = await cloudinaryService.DeletePhotoAsync(model.PublicId);

                if (imageDeleteResult.Error != null)
                    throw new UploadFileException(imageDeleteResult.Error.Message);

                model.PictureUrl = null;
                model.PublicId = null;
            }

            request.Data.ToModel(model);

            if (model.IsNew)
                db.Exercises.Add(model);

            await db.SaveChangesAsync(cancellationToken);

            return new();
        }
    }
}