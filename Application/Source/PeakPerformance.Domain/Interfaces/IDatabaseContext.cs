namespace PeakPerformance.Domain.Interfaces;

public interface IDatabaseContext
{
    DbSet<ErrorLog> ErrorLogs { get; set; }

    DbSet<User> Users { get; set; }

    DbSet<UserRole> UserRoles { get; set; }

    DbSet<Bodyweight> Bodyweights { get; set; }

    DbSet<BodyweightGoal> BodyweightGoals { get; set; }

    DbSet<UserMeasurementPreference> UserMeasurementPreferences { get; set; }

    // methods

    Task<int> SaveChangesAsync(CancellationToken cancellationToken = default);
}