namespace PeakPerformance.Domain.Interfaces;

public interface IDatabaseContext
{
    DbSet<ErrorLog> ErrorLogs { get; set; }

    DbSet<User> Users { get; set; }

    DbSet<UserRole> UserRoles { get; set; }

    DbSet<UserMeasurementPreference> UserMeasurementPreferences { get; set; }

    DbSet<Bodyweight> Bodyweights { get; set; }

    DbSet<BodyweightGoal> BodyweightGoals { get; set; }

    DbSet<Measurement> Measurements { get; set; }

    DbSet<MeasurementGoal> MeasurementGoals { get; set; }

    DbSet<Country> Countries { get; set; }

    DbSet<Workout> Workouts { get; set; }

    DbSet<Exercise> Exercises { get; set; }

    DbSet<ExerciseGoal> ExerciseGoals { get; set; }

    DbSet<WorkoutExercise> WorkoutExercises { get; set; }

    DbSet<WorkoutExerciseSet> WorkoutExerciseSets { get; set; }

    DbSet<UserSelectedExercise> UserSelectedExercises { get; set; }

    // methods

    Task<int> SaveChangesAsync(CancellationToken cancellationToken = default);
}