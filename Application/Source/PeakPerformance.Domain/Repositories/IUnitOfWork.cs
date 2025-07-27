using PeakPerformance.Domain.Entities._Base;
using PeakPerformance.Domain.Repositories.Application;

namespace PeakPerformance.Domain.Repositories;

public interface IUnitOfWork
{
    // Repositories

    IUserRepository Users { get; }

    // Methods

    Task<T> GetSingleAsync<T>(long id) where T : BaseDomain;

    Task<List<T>> GetListAsync<T>() where T : BaseDomain;

    Task SaveAsync();
}