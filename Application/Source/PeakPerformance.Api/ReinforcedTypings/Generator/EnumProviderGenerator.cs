﻿using Reinforced.Typings;
using Reinforced.Typings.Ast;
using Reinforced.Typings.Ast.TypeNames;
using Reinforced.Typings.Generators;
using System.ComponentModel;
using System.Reflection;

namespace PeakPerformance.Api.ReinforcedTypings.Generator;

public class EnumProviderGenerator : ClassCodeGenerator
{
    public override RtClass GenerateNode(Type element, RtClass result, TypeResolver resolver)
    {
        if (element.IsEnum)
        {
            result = new RtClass { Name = new RtSimpleTypeName(element.Name) };
            result.Decorators.Add(new RtDecorator("Injectable({ providedIn: 'root' })"));
            var fields = element.GetFields(BindingFlags.Public | BindingFlags.Static);
            foreach (var field in fields)
            {
                var enumProviderAttr = field.GetCustomAttributes(typeof(EnumProviderAttribute), false).FirstOrDefault() as EnumProviderAttribute;
                if (enumProviderAttr != null)
                {
                    var functionName = $"get{field.Name}";
                    var method = new RtFunction
                    {
                        Identifier = new RtIdentifier(functionName),
                        ReturnType = new RtSimpleTypeName("IEnumProvider[]")
                    };
                    var enumType = enumProviderAttr.EnumType;
                    method.Body = GenerateMethodBody(enumType);
                    result.Members.Add(method);
                }
            }
            return result;
        }
        return base.GenerateNode(element, result, resolver);
    }

    private static RtRaw GenerateMethodBody(Type enumType)
    {
        var enumValues = Enum.GetValues(enumType);
        var enumArray = new List<string>(); // Use a string list to build the final output
        foreach (var value in enumValues)
        {
            var enumName = Enum.GetName(enumType, value);
            var enumId = Convert.ToInt32(value);
            // Get the description if it exists
            var descriptionAttribute = enumType.GetField(enumName)?.GetCustomAttribute<DescriptionAttribute>();
            var description = descriptionAttribute != null ? descriptionAttribute.Description : enumName;
            // Create the enum object string
            var enumObject = $@"{{ id: {enumId}, name: '{enumName}', description: '{description}' }}";
            enumArray.Add(enumObject); // Add the string representation
        }
        // Join the array into a string
        var returnValue = $@"return [
    {string.Join(",\n    ", enumArray)}
];";
        return new RtRaw(returnValue); // Return a new RtRaw with the joined string
    }
}