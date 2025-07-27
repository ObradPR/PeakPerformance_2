namespace PeakPerformance.Domain.Extensions;

public static class Extensions
{
    public static string GetFullTableName<T>() where T : class => typeof(T).Name;
}