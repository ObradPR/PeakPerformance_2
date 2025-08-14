using PeakPerformance.Domain.Entities._Base;
using PeakPerformance.Domain.Repositories.Application;

namespace PeakPerformance.Domain.Repositories;

public interface IUnitOfWork
{
    // Repositories

    IUserRepository Users { get; }

    IBodyweightRepository Bodyweights { get; }

    IBodyweightGoalRepository BodyweightGoals { get; }

    // Methods

    Task<T> GetSingleAsync<T>(long id) where T : BaseDomain;

    Task<T> GetSingleAsync<T>(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties) where T : BaseDomain;

    Task<List<T>> GetListAsync<T>() where T : BaseDomain;

    Task<List<T>> GetListAsync<T>(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties) where T : BaseDomain;

    void Create<T>(T entity) where T : BaseDomain;

    void CreateList<T>(List<T> entities) where T : BaseDomain;

    void Delete<T>(T entity) where T : BaseDomain;

    void DeleteList<T>(List<T> entities) where T : BaseDomain;

    Task SaveAsync();
}