namespace PeakPerformance.Domain.ValueObjects;

public class FileInformation
{
    public string FileName { get; set; }

    public string Type { get; set; }

    public byte[] Buffer { get; set; }

    public long? Size { get; set; }
}