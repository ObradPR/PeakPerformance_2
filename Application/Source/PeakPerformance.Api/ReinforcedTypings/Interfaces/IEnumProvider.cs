namespace PeakPerformance.Api.ReinforcedTypings;

internal interface IEnumProvider
{
    public int Id { get; set; }

    public string Name { get; set; }

    public string Description { get; set; }

    public string BgColor { get; set; }
}