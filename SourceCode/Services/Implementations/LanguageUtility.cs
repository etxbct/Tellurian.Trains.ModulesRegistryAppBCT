﻿using Microsoft.AspNetCore.Components;
using ModulesRegistry.Services.Resources;
using System.Globalization;
using System.Resources;

namespace ModulesRegistry.Services.Implementations;

public static class LanguageUtility
{
    public const string DefaultLanguage = "en";
    public static CultureInfo CurrentCulture => System.Threading.Thread.CurrentThread.CurrentCulture;
    public static CultureInfo DefaultCulture => new(DefaultLanguage);

    private static readonly ResourceManager ResourceManager = Strings.ResourceManager;

    public static string GetString(string resourceName, string? language)
    {
        if (string.IsNullOrWhiteSpace(resourceName)) return string.Empty;
        var culture = CurrentCulture; 
        if (language.HasValue())
        {
            try
            {
                culture = new CultureInfo(language);
            }
            catch (CultureNotFoundException)
            {
                return $"Language '{language}' is invalid!";
            }
        }
        var result = Strings.ResourceManager.GetString(resourceName, culture);
        return result is null ? resourceName : result;
    }
    
    /// <summary>
    /// Returns a list of <see cref="CultureInfo"/> that are fully supported in user interface.
    /// </summary>
    public static IList<CultureInfo> FullySupportedCultures => LanguageCultureMap.Values.Take(5).ToArray();
    public static string[] FullySupportedLanguages => FullySupportedCultures.Select(c => c.TwoLetterISOLanguageName).ToArray();

    public static IEnumerable<CultureInfo> AllSupportedCultures => LanguageCultureMap.Values;

    /// <summary>
    /// This list contains all languages that are fully or partial supported
    /// </summary>
    private static IDictionary<Language, CultureInfo> LanguageCultureMap =>
         new Dictionary<Language, CultureInfo>() {
                 { Language.English, new CultureInfo("en") },
                 { Language.Swedish, new CultureInfo("sv") },
                 { Language.Danish, new CultureInfo("da") },
                 { Language.Norwegian, new CultureInfo("no") },
                 { Language.German, new CultureInfo("de") },
                 // Not fully supported below:
                 { Language.Dutch, new CultureInfo("nl") },
                 { Language.Polish, new CultureInfo("pl") },
                 { Language.Italian, new CultureInfo("it") },
                 { Language.French, new CultureInfo("fr") },
        };

    public static CultureInfo SupportedOrDefaultCulture(this string? twoLetterISOLanguageName) =>
        FullySupportedCultures.SingleOrDefault(sc => sc.TwoLetterISOLanguageName.Equals(twoLetterISOLanguageName, StringComparison.OrdinalIgnoreCase)) ?? DefaultCulture;

    public static string AsYesOrNo(this bool me) => me ? Strings.Yes : Strings.No;
    public static string AsYes(this bool me) => me ? Strings.Yes : string.Empty;

    public static MarkupString AsYesOrNoWithColor(this bool me, bool invert = false) => new($"<span style=\"color: {me.YesNoColor(invert)};\">{me.AsYesOrNo()}</span>");
    private static string YesNoColor(this bool me, bool invert = false) => invert ? me ? "red" : "green" : me ? "green" : "red";

    /// <summary>
    /// Uses the <paramref name="resourceKey"/> as key to find a localized text in <see cref="Strings"/> resources.
    /// </summary>
    /// <param name="resourceKey">The key to find a localised  </param>
    /// <returns></returns>
    public static string AsLocalized(this string? resourceKey)
    {
        if (string.IsNullOrWhiteSpace(resourceKey)) return string.Empty;
        var translated = ResourceManager.GetString(resourceKey);
        return string.IsNullOrEmpty(translated) ? resourceKey : translated;
    }

    /// <summary>
    /// Finds a translated property for an object. The object must have properties with translations for each language.
    /// </summary>
    /// <param name="me">An object with porperties for translated texts.</param>
    /// <returns></returns>
    public static LocalizedText LocalizedName(this object me) => me.LocalizedName(CurrentCulture);

    /// <summary>
    /// Finds a translated property for an object for the provided <paramref name="culture"/>. The object must have a property for that langauge.
    /// </summary>
    /// <param name="me"></param>
    /// <param name="culture"></param>
    /// <returns></returns>
    public static LocalizedText LocalizedName(this object me, CultureInfo culture)
    {
        var language = culture.TwoLetterISOLanguageName;
        var value = language.GetPropertyValue(me);
        if (value is not null) return new LocalizedText(language, value);
        return me.LocalizedNames().FirstOrDefault() ?? LocalizedText.Empty;
    }

    /// <summary>
    /// This method is used to extract values of object properties that have a name that match a two-letter ISO language name.
    /// </summary>
    /// <param name="me">Usually a data entity that contains a set of language properties.</param>
    /// <returns></returns>
    internal static IEnumerable<LocalizedText> LocalizedNames(this object me)
    {
        foreach (var language in AllSupportedCultures)
        {
            var value = language.TwoLetterISOLanguageName.GetPropertyValue(me);
            if (value is not null) yield return new LocalizedText(language.TwoLetterISOLanguageName, value);
        }
    }

    private static string? GetPropertyValue(this string propertyName, object me)
    {
        var property = me.GetType().GetProperty(propertyName.ToUpperInvariant());
        return property is null ? null : (string?)property.GetValue(me);
    }
}

public enum Language
{
    Default,
    English,
    Swedish,
    Danish,
    Norwegian,
    German,
    Polish,
    Dutch,
    Italian,
    French
}
