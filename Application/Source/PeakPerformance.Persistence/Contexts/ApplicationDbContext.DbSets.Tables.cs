namespace PeakPerformance.Persistence.Contexts;

public partial class ApplicationDbContext : IDatabaseContext
{
    public virtual DbSet<ErrorLog> ErrorLogs { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UserRole> UserRoles { get; set; }

    public virtual DbSet<UserMeasurementPreference> UserMeasurementPreferences { get; set; }

    public virtual DbSet<Bodyweight> Bodyweights { get; set; }

    public virtual DbSet<BodyweightGoal> BodyweightGoals { get; set; }

    public virtual DbSet<Measurement> Measurements { get; set; }

    public virtual DbSet<MeasurementGoal> MeasurementGoals { get; set; }

    public virtual DbSet<Country> Countries { get; set; }
}