namespace PeakPerformance.Application.Attributes;

[AttributeUsage(AttributeTargets.Property, AllowMultiple = false)]
public class BodyPartAttribute(eBodyPart bodyPart) : Attribute
{
    public eBodyPart BodyPart { get; set; } = bodyPart;
}