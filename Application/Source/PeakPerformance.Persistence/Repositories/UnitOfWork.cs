using PeakPerformance.Domain.Repositories;
using PeakPerformance.Domain.Repositories.Application;
using PeakPerformance.Persistence.Contexts;
using PeakPerformance.Persistence.Extensions;
using PeakPerformance.Persistence.Repositories.Application;
using System.Linq.Expressions;

namespace PeakPerformance.Persistence.Repositories;

public class UnitOfWork(ApplicationDbContext context) : IUnitOfWork
{
    private ApplicationDbContext db { get; set; } = context;

    // Repositories

    public IUserRepository Users => new UserRepository(db);

    // Methods

    public async Task<T> GetSingleAsync<T>(long id) where T : BaseDomain => await db.Set<T>().FindAsync(id);

    public async Task<T> GetSingleAsync<T>(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties) where T : BaseDomain => await db.Set<T>().GetSingleAsync(predicate, includeProperties);

    public async Task<List<T>> GetListAsync<T>() where T : BaseDomain => await db.Set<T>().ToListAsync();

    public async Task<List<T>> GetListAsync<T>(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includeProperties) where T : BaseDomain => await db.Set<T>().GetListAsync(predicate, includeProperties);

    public void Create<T>(T entity) where T : BaseDomain => db.Set<T>().Add(entity);

    public void CreateList<T>(List<T> entities) where T : BaseDomain => db.Set<T>().AddRange(entities);

    public async Task SaveAsync() => await db.SaveChangesAsync();
}