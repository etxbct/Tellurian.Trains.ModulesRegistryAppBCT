﻿namespace ModulesRegistry.Services.Implementations;

public sealed class LanguageService : ILanguageService
{
    public string[] GetSupportedLanguages() => LanguageUtility.FullySupportedLanguages;

    public LanguageLabels[] GetWaybillLabels() =>
        GetSupportedLanguages()
            .Select(l => l.CreateLabels(Data.WaybillExtensions.LabelResourceKeys))
            .ToArray();
}
