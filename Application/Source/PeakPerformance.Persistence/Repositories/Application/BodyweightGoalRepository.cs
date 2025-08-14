namespace PeakPerformance.Persistence.Repositories.Application;

public class BodyweightGoalRepository(ApplicationDbContext db) : IBodyweightGoalRepository
{
    public async Task<PagingResult<BodyweightGoal>> SearchAsync(BodyweightGoalSearchOptions options, List<Expression<Func<BodyweightGoal, bool>>> predicates) =>
        await db.BodyweightGoals.SearchAsync(options, _ => _.StartDate, false, predicates, null);
}