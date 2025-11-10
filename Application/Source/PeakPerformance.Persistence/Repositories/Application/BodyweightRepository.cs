using PeakPerformance.Domain.ValueObjects;

namespace PeakPerformance.Persistence.Repositories.Application;

public class BodyweightRepository(ApplicationDbContext db) : IBodyweightRepository
{
    public async Task<CurrentBodyInfo> GetCurrentInfoAsync(long userId)
    {
        var bodyweight = await db.Bodyweights
            .Where(_ => _.UserId == userId)
            .OrderByDescending(_ => _.LogDate)
            .FirstOrDefaultAsync();

        var bodyweightGoal = await db.BodyweightGoals
            .Where(_ => _.UserId == userId)
            .OrderByDescending(_ => _.EndDate)
            .FirstOrDefaultAsync();

        return new CurrentBodyInfo
        {
            Bodyweight = bodyweight?.Value,
            BodyweightUnitId = bodyweight?.WeightUnitId,
            BodyFatPercentage = bodyweight?.BodyFatPercentage,
            BodyweightGoal = bodyweightGoal?.Target,
            BodyweightGoalUnitId = bodyweightGoal?.WeightUnitId
        };
    }

    public async Task<PagingResult<Bodyweight>> SearchAsync(BodyweightSearchOptions options, List<Expression<Func<Bodyweight, bool>>> predicates) =>
        await db.Bodyweights.SearchAsync(options, _ => _.LogDate, false, predicates, null);
}