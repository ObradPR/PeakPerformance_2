﻿namespace PeakPerformance.Domain.Searches;

public class BodyweightSearchOptions : SearchOptions
{
    public long? UserId { get; set; }

    public DateTime? FromDate { get; set; }

    public DateTime? ToDate { get; set; }

    public eChartTimespan? ChartTimespanId { get; set; }
}