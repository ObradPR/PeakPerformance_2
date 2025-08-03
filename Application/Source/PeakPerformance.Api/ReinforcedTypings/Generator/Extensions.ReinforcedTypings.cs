using Reinforced.Typings.Ast.TypeNames;

namespace PeakPerformance.Api.ReinforcedTypings.Generator;

public static class Extensions
{
    public static bool IsString(this RtTypeName typeName)
    {
        return typeName.ToString().Equals("string", StringComparison.CurrentCultureIgnoreCase);
    }
}