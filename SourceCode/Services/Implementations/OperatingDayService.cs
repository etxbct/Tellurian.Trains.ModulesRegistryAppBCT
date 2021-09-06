﻿using System.Globalization;
using System.Resources;

namespace ModulesRegistry.Services.Implementations;

public class OperatingDayService
{
    private readonly IDbContextFactory<ModulesDbContext> Factory;
    private static readonly ResourceManager ResourceManager = Resources.Strings.ResourceManager;

    public OperatingDayService(IDbContextFactory<ModulesDbContext> factory)
    {
        Factory = factory;
    }

    public async Task<IEnumerable<ListboxItem>> BasicDaysItemsAsync()
    {
        using var dbContext = Factory.CreateDbContext();
        return await dbContext.OperatingDays.AsNoTracking()
            .Where(od => od.IsBasicDay)
            .OrderBy(od => od.Flag)
            .Select(od => new ListboxItem(od.Id, od.Flag.OperationDays(CultureInfo.CurrentCulture).ShortName))
            .ToListAsync();
    }

    public async Task<IEnumerable<ListboxItem>> AllDaysItemsAsync()
    {
        using var dbContext = Factory.CreateDbContext();
        return await dbContext.OperatingDays.AsNoTracking()
            .OrderBy(od => od.Flag)
            .Select(od => new ListboxItem(od.Id, od.Flag.OperationDays(CultureInfo.CurrentCulture).ShortName))
            .ToListAsync();
    }


    private static string Description(OperatingDay day)
    {
        var localized = ResourceManager.GetString(day.FullName);
        return string.IsNullOrWhiteSpace(localized) ? day.FullName : localized;
    }
}
