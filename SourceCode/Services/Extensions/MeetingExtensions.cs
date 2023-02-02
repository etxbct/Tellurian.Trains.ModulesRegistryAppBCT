﻿using System.Diagnostics;
using System.Diagnostics.CodeAnalysis;

namespace ModulesRegistry.Services.Extensions;
public static class MeetingExtensions
{
    public static int DaysCount(this Meeting it) =>
         (it.EndDate - it.StartDate).Days + 1;

    public static string Day(this Meeting it, int day) =>
        it.StartDate.AddDays(day - 1).DayOfWeek.ToString();

    public static bool IsCancelled(this Meeting? it) =>
        it is null || it.Status == (int)MeetingStatus.Canceled;

    public static DateTime? RegistrationOpensDate(this Meeting? it) =>
        it is null || !it.IsRegistrationAvailable() ? null :
        it.Layouts.Where(l => l.IsRegistrationPermitted).Min(l => l.RegistrationOpeningDate);

    public static DateTime? RegistrationClosingDate(this Meeting? it) =>
        it is null || !it.IsRegistrationAvailable() ? null :
        it.Layouts.Where(l => l.IsRegistrationPermitted).Max(l => l.RegistrationClosingDate);

    public static bool IsNotYetOpenForRegistration([NotNullWhen(true)] this Meeting? it, DateTime at) =>
        it is not null &&
        it.Layouts.Any(l => l.IsNotYetOpenForRegistration(at));

    public static bool IsOpenForRegistration([NotNullWhen(true)] this Meeting? it, DateTime at, ClaimsPrincipal? principal = null)
    {
        
        return principal is not null && it is not null && it.IsRegistrationAvailable() && (
            principal.IsGlobalAdministrator() ||
            principal.IsCountryAdministratorInCountry(it?.OrganiserGroup?.CountryId) ||
            principal.IsAnyGroupAdministrator(it?.OrganiserGroup)
        ) ||
        (   it is not null && !it.IsCancelled() &&
            it.Layouts.Any(l => l.IsOpenForRegistration(at)));
    }

    public static bool IsClosedForRegistration([NotNullWhen(false)] this Meeting? it, DateTime at) =>
        it is not null && it.IsRegistrationAvailable() &&
        it.Layouts.Any() && it.Layouts.All(l => l.RegistrationClosingDate <= at);

    private static bool IsRegistrationAvailable(this Meeting it) =>
        it.Layouts.Any(l => l.IsRegistrationPermitted);

    public static bool MayRegister(this Meeting? it, DateTime at, ClaimsPrincipal? principal) =>
       principal is not null && principal.IsAnyAdministrator() ||
        (principal.IsAuthenticated() && it.IsOpenForRegistration(at, principal));

    private static bool IsOpenForRegistration(this Layout it, DateTime at) =>
        it.IsRegistrationPermitted &&
        it.RegistrationOpeningDate <= at &&
        it.RegistrationClosingDate.AddDays(1) > at;

    private static bool IsNotYetOpenForRegistration(this Layout it, DateTime at) =>
        it.IsRegistrationPermitted &&
        it.RegistrationOpeningDate > at;

    public static string Organiser(this Meeting? me) =>
        me is null ? string.Empty :
        me.GroupDomainId.HasValue ? $"{me.OrganiserGroup.FullName}/{me.GroupDomain?.Name}" :
        $"{me.OrganiserGroup.FullName}";


    public static string Status(this Meeting? it, DateTime at) =>
        it is null ? string.Empty :
        Resources.Strings.ResourceManager.GetString(it.StatusResourceName(at)) ?? string.Empty;

    internal static string StatusResourceName(this Meeting? me, DateTime at) =>
        me is null ? string.Empty :
        me.IsCancelled() ? "Canceled" :
        me.IsOpenForRegistration(at) ? "RegistrationOpen" :
        me.IsClosedForRegistration(at) ? "RegistrationClosed" :
        me.IsOrganiserInternal ? "Internal" :
        me.IsRegistrationAvailable() || me.IsNotYetOpenForRegistration(at) ? ((MeetingStatus)me.Status).ToString() :
        ((MeetingStatus)me.Status).ToString();

    public static string MeetingStatusCssClass(this Meeting meeting, DateTime at) => 
        $"meeting {meeting.StatusResourceName(at).ToLowerInvariant()}";


}

