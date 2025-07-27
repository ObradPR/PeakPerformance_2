﻿namespace PeakPerformance.Domain.Entities._Base;

public abstract class BaseDomain
{ }

public class BaseDomain<TKey> : BaseDomain, IBaseDomain<TKey>
    where TKey : struct
{
    [Key]
    public TKey Id { get; set; }

    public bool IsNew => Id.Equals(default(TKey));
}