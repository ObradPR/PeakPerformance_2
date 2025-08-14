namespace PeakPerformance.Domain.Repositories.Application;

public interface IBodyweightGoalRepository
{
    Task<PagingResult<BodyweightGoal>> SearchAsync(BodyweightGoalSearchOptions options, List<Expression<Func<BodyweightGoal, bool>>> predicates);
}