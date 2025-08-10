namespace PeakPerformance.Domain.Repositories.Application;

public interface IUserRepository
{
    Task<bool> ExistsAsync(string username, string email);
}