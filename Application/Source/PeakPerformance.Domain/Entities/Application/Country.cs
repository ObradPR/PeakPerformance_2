using PeakPerformance.Domain.Entities._Base;

namespace PeakPerformance.Domain.Entities.Application;

public class Country : BaseDomain<long>, IConfigurableEntity
{
    public string ISO2 { get; set; }

    public string ISO3 { get; set; }

    public string Name { get; set; }

    //
    // Configuration
    //

    public void Configure(ModelBuilder builder)
    {
        builder.Entity<Country>(_ =>
        {
            _.Property(_ => _.Name).IsRequired();
            _.Property(_ => _.ISO2).IsRequired();
            _.Property(_ => _.ISO3).IsRequired();
        });
    }
}