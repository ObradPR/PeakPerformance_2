namespace PeakPerformance.Domain.Common;

public class Error(string key, string value)
{
    public string Key { get; set; } = key;

    public string Value { get; set; } = value;
}