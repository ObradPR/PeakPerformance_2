using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using PeakPerformance.Common;
using PeakPerformance.Domain.ValueObjects;
using PeakPerformance.Infrastructure.Storage.Interfaces;

namespace PeakPerformance.Infrastructure.Storage.Services;

public class CloudinaryService(string credentials) : BaseCloudinaryService(credentials), ICloudinaryService
{
    public async Task<ImageUploadResult> UploadPhotoAsync(FileInformation file)
    {
        if (file == null)
            return new();

        using var stream = new MemoryStream(file.Buffer);
        var uploadParams = new ImageUploadParams
        {
            File = new FileDescription(file.FileName, stream),
            Transformation = new Transformation().Height(300).Width(300).Crop("fill").Gravity(Gravity.Face),
            Folder = Constants.CLOUDINARY_STORAGE_NAME
        };

        return await _cloudinary.UploadAsync(uploadParams);
    }

    public async Task<DeletionResult> DeletePhotoAsync(string publicId) => await _cloudinary.DestroyAsync(new DeletionParams(publicId));
}