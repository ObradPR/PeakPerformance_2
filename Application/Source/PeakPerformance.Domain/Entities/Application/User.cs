using PeakPerformance.Domain.Entities._Base;
using System.ComponentModel.DataAnnotations.Schema;

namespace PeakPerformance.Domain.Entities.Application;

public class User : BaseIndexAuditedDomain<User, long>, IConfigurableEntity
{
    public string FullName { get; set; }

    public string Username { get; set; }

    public string Email { get; set; }

    public string Password { get; set; }

    [Column(TypeName = Constants.DB_TYPE_DATE)]
    public DateTime DateOfBirth { get; set; }

    public string Description { get; set; }

    // Image
    public string ProfilePictureUrl { get; set; }

    public string PublicId { get; set; }

    //
    // Relationships
    //

    #region Relationships

    [InverseProperty(nameof(UserRole.User))]
    public virtual ICollection<UserRole> UserRoles { get; set; } = [];

    [InverseProperty(nameof(Bodyweight.User))]
    public virtual ICollection<Bodyweight> Bodyweights { get; set; } = [];

    #endregion Relationships

    //
    // Indexes
    //

    #region Indexes

    public static IDatabaseIndex IX_Users_Email => new DatabaseIndex(nameof(IX_Users_Email))
    {
        Columns = { nameof(Email) },
        IsUnique = true,
    };

    public static IDatabaseIndex IX_Users_Username => new DatabaseIndex(nameof(IX_Users_Username))
    {
        Columns = { nameof(Username) },
        IsUnique = true,
    };

    #endregion Indexes

    //
    // Configuration
    //
    public void Configure(ModelBuilder builder)
    {
        builder.Entity<User>(_ =>
        {
            _.Property(_ => _.FullName).HasMaxLength(30).IsRequired();
            _.Property(_ => _.Username).HasMaxLength(30).IsRequired();
            _.Property(_ => _.Email).HasMaxLength(100).IsRequired();
            _.Property(_ => _.Password).IsRequired();
            _.Property(_ => _.DateOfBirth).IsRequired();
            _.Property(_ => _.Description).HasMaxLength(500);
        });
    }
}