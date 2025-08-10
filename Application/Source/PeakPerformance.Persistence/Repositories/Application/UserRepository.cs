using PeakPerformance.Domain.Repositories.Application;
using PeakPerformance.Persistence.Contexts;

namespace PeakPerformance.Persistence.Repositories.Application;

public class UserRepository(ApplicationDbContext db) : IUserRepository
{
    public async Task<bool> ExistsAsync(string username, string email) =>
        await db.Users.IgnoreQueryFilters().AnyAsync(_ => _.Username.ToLower() == username.ToLower() || _.Email.ToLower() == email.ToLower());
}