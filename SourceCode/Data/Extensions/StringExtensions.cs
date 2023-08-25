﻿using System.Diagnostics.CodeAnalysis;
using System;

namespace ModulesRegistry.Data.Extensions;

public static class StringExtensions
{
    public static string[]? AsArray(this string? value) =>
        value is null ? null : new string[] {value};

    public static bool HasValue([NotNullWhen(true)] this string? value ) =>
        !string.IsNullOrWhiteSpace(value);

    public static bool HasValueExcept([NotNullWhen(true)] this string? value, params string[] except) =>
        except is not null ? !string.IsNullOrEmpty(value) && !except.Contains(value, StringComparer.OrdinalIgnoreCase) :
        !string.IsNullOrWhiteSpace(value);

    public static bool HasNoValue([NotNullWhen(false)] this string? value) =>
        string.IsNullOrWhiteSpace(value);

    public static string FirstItem(this string? value, string defaultValue = "", char delimiter = ',') =>
        value is null || value.Length == 0 ? defaultValue : value.Split(delimiter)[0] ?? defaultValue;

    public static string ToFirstLowerInvariant(this string? value) =>
        string.IsNullOrWhiteSpace(value) ? string.Empty :
        value.Length == 1 ? value.ToLowerInvariant() :
        string.Concat(value[0].ToString().ToLowerInvariant(), value.AsSpan(1));

    public static string[] Items(this string? value, char separator = ';') =>
     string.IsNullOrWhiteSpace(value) ? Array.Empty<string>() :
     value.Trim().Split(separator);

}
