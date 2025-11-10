namespace PeakPerformance.Domain.Extensions;

public static partial class Extensions
{
    public static string GetFullTableName<T>() where T : class => typeof(T).Name;
}