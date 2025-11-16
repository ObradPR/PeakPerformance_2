using CloudinaryDotNet.Actions;
using PeakPerformance.Domain.ValueObjects;

namespace PeakPerformance.Infrastructure.Storage.Interfaces;

public interface ICloudinaryService
{
    Task<ImageUploadResult> UploadPhotoAsync(FileInformation file);

    Task<DeletionResult> DeletePhotoAsync(string publicId);
}