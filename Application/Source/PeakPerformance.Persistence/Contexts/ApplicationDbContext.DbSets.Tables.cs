namespace PeakPerformance.Persistence.Contexts;

public partial class ApplicationDbContext
{
    public virtual DbSet<ErrorLog> ErrorLogs { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UserRole> UserRoles { get; set; }

    public virtual DbSet<Bodyweight> Bodyweights { get; set; }

    public virtual DbSet<BodyweightGoal> BodyweightGoals { get; set; }

    public virtual DbSet<UserMeasurementPreference> UserMeasurementPreferences { get; set; }
}