﻿using System.Linq.Expressions;

namespace PeakPerformance.Persistence.Extensions;

public static partial class Extensions
{
    public static void ExecuteSqlRaw<TContext>(this TContext context, string sql)
        where TContext : DbContext
        => context.Database.ExecuteSql($"{sql}");

    public static async Task<bool> DatabaseExistsAsync<TContext>(this TContext context)
        where TContext : DbContext
        => await context.Database.CanConnectAsync();

    public static async Task EnsureDatabaseMigratedAsync<TContext>(this TContext context)
        where TContext : DbContext
        => await context.Database.MigrateAsync();

    public static void DetachAllTrackedChanges<TContext>(this TContext context)
        where TContext : DbContext
        => context.ChangeTracker.Entries().ForEach(_ => _.State = EntityState.Detached);

    public static void Create<TContext, TEntity>(this TContext context, TEntity model)
        where TEntity : class
        where TContext : DbContext
        => context.Set<TEntity>().Add(model);

    public static async Task CreateAsync<TContext, TEntity>(this TContext context, TEntity model)
        where TEntity : class
        where TContext : DbContext
        => await context.Set<TEntity>().AddAsync(model);

    public static void CreateList<TContext, TEntity>(this TContext context, IEnumerable<TEntity> models)
        where TEntity : class
        where TContext : DbContext
        => context.Set<TEntity>().AddRange(models);

    public static async Task CreateListAsync<TContext, TEntity>(this TContext context, IEnumerable<TEntity> models)
        where TEntity : class
        where TContext : DbContext
        => await context.Set<TEntity>().AddRangeAsync(models);

    public static void DeleteSingle<TContext, TEntity>(this TContext context, TEntity model)
        where TEntity : class
        where TContext : DbContext
        => context.Set<TEntity>().Remove(model);

    public static void DeleteSingle<TContext, TEntity>(this TContext context, Expression<Func<TEntity, bool>> filter)
        where TEntity : class
        where TContext : DbContext
    {
        var entity = context.Set<TEntity>().SingleOrDefault(filter)
            ?? throw new ArgumentNullException(typeof(TEntity).Name);

        context.DeleteSingle(entity);
    }

    public static void Remove<TContext, TEntity>(this TContext context, TEntity model)
        where TEntity : class
        where TContext : DbContext
        => context.Set<TEntity>().Remove(model);
}