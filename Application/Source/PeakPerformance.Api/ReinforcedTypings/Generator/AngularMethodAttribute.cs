using Reinforced.Typings.Attributes;

namespace PeakPerformance.Api.ReinforcedTypings.Generator;

public class AngularMethodAttribute : TsFunctionAttribute
{
    public AngularMethodAttribute(Type returnType)
    {
        StrongType = returnType;

        CodeGeneratorType = typeof(AngularActionCallGenerator);
    }

    public bool IsArrayBuffer { get; set; }
}