namespace PeakPerformance.Domain.Repositories.Application;

public interface IBodyweightRepository
{
    Task<PagingResult<Bodyweight>> SearchAsync(BodyweightSearchOptions options, List<Expression<Func<Bodyweight, bool>>> predicates);
}