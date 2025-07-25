﻿using System.Globalization;
using System.Text.RegularExpressions;

namespace PeakPerformance.Common.Extensions;

public static partial class Extensions
{
    public static string AppendArgument(this string value, string argument) => string.Format(value, argument);

    public static string AppendArgument(this string value, params string[] args) => string.Format(value, args);

    public static bool IsNullOrEmpty(this string value) => string.IsNullOrEmpty(value);

    public static bool IsNotNullOrEmpty(this string value) => !string.IsNullOrEmpty(value);

    public static bool IsNullOrWhiteSpace(this string value) => string.IsNullOrWhiteSpace(value);

    public static bool IsNotNullOrWhiteSpace(this string value) => !string.IsNullOrWhiteSpace(value);

    public static string IfNotNullOrWhiteSpace(this string text, string format = null, string defaultValue = "") => text.IsNotNullOrWhiteSpace() ? (format.IsNotNullOrEmpty() ? string.Format(format, text) : text) : defaultValue;

    public static string IfNotNullOrEmpty(this string text, string format = null, string defaultValue = "") => text.IsNotNullOrEmpty() ? (format.IsNotNullOrEmpty() ? string.Format(format, text) : text) : defaultValue;

    public static string ToTitleCase(this string value)
        =>
        value.IsNotNullOrEmpty()
        ? CultureInfo.CurrentCulture.TextInfo.ToTitleCase(value.ToLower())
        : value;

    public static bool ContainsIgnoreCase(this string source, string toCheck) => source?.IndexOf(toCheck, StringComparison.OrdinalIgnoreCase) >= 0;

    public static string Truncate(this string value, int maxLength)
        =>
        value.IsNotNullOrEmpty()
        ? (value.Length <= maxLength ? value : value[..maxLength])
        : value;

    public static string Reverse(this string value)
    {
        if (value == null)
            return null;

        char[] array = value.ToCharArray();
        Array.Reverse(array);
        return new string(array);
    }

    public static string RemoveWhitespace(this string value)
        =>
        value.IsNotNullOrEmpty()
        ? new string(value.Where(c => !char.IsWhiteSpace(c)).ToArray())
        : value;

    public static string ToCamelCase(this string value)
        =>
        value.IsNotNullOrEmpty()
        ? char.ToLowerInvariant(value[0]) + value[1..]
        : value;

    public static string FormatWith(this string value, params object[] args) => string.Format(value, args);

    public static string GetUserFullName(string firstName, string lastName, string middleName) => string.Join(" ", firstName, middleName, lastName);

    public static bool IsNumeric(this string value, out int result) => int.TryParse(value, out result);

    public static string ToPlural(this string singular)
        => singular.EndsWith('y')
        ? singular.Truncate(singular.Length - 1) + "ies"
        : Regex.IsMatch(singular, "(s|ss|sh|ch|x|z)$")
        ? singular + "es"
        : singular + "s";

    public static int ToInt(this string value)
        => value.IsNumeric(out var result)
        ? result
        : 0;

    public static string Join(this IEnumerable<string> values, string separator) => string.Join(separator, values);

    public static bool HasValue(this string text) => text.IsNotNullOrEmpty() && text.IsNotNullOrWhiteSpace();

    public static bool In(this string text, params string[] args) => args.Contains(text);
}