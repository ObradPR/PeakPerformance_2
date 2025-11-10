using PeakPerformance.Domain.ValueObjects;

namespace PeakPerformance.Domain.Repositories.Application;

public interface IBodyweightRepository
{
    Task<CurrentBodyInfo> GetCurrentInfoAsync(long userId);

    Task<PagingResult<Bodyweight>> SearchAsync(BodyweightSearchOptions options, List<Expression<Func<Bodyweight, bool>>> predicates);
}