namespace PeakPerformance.Persistence.Repositories.Application;

public class BodyweightRepository(ApplicationDbContext db) : IBodyweightRepository
{
    public async Task<PagingResult<Bodyweight>> SearchAsync(BodyweightSearchOptions options, List<Expression<Func<Bodyweight, bool>>> predicates) =>
        await db.Bodyweights.SearchAsync(options, _ => _.LogDate, false, predicates, null);
}