namespace PeakPerformance.Application.Dtos._Base;

public class FileInformationDto
{
    public string FileName { get; set; }

    public string Type { get; set; }

    public byte[] Buffer { get; set; }

    public long? Size { get; set; }
}