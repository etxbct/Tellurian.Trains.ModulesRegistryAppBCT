﻿using Microsoft.AspNetCore.Components;
using System.Runtime.CompilerServices;

namespace ModulesRegistry.Services.Extensions;
public static class MeetingExtensions
{
    public static bool MayDelete(this Meeting? meeting, ClaimsPrincipal principal) =>
        meeting is not null &&
        principal.IsCountryOrGlobalAdministrator() &&
        meeting.Layouts.Sum(l => l.LayoutParticipants.Count) == 0;

    public static string Status(this Meeting? meeting, DateTime at) =>
        meeting is null ? string.Empty :
        Resources.Strings.ResourceManager.GetString(meeting.StatusResourceName(at)) ?? string.Empty;

    internal static string StatusResourceName(this Meeting? meeting, DateTime at) =>
        meeting is null ? string.Empty :
        meeting.IsCancelled() ? "Canceled" :
        meeting.IsOpenForRegistration(at) ? "RegistrationOpen" :
        meeting.IsClosedForRegistration(at) ? "RegistrationClosed" :
        meeting.IsOrganiserInternal ? "Internal" :
        ((MeetingStatus)meeting.Status).ToString();

    public static string StatusCssClass(this Meeting meeting, DateTime at) =>
        $"meeting {meeting.StatusResourceName(at).ToLowerInvariant()}";

    public static string StatusIcon(this Meeting meeting, DateTime at) =>
        meeting.StatusResourceName(at) switch
        {
            "Canceled" => "fa fa-times-circle",
            "RegistrationOpen" => "fa fa-user-plus",
            "RegistrationClosed" => "fa fa-user-slash",
            _ => (MeetingStatus)meeting.Status switch
            {
                MeetingStatus.Preliminary => "fa fa-question-circle",
                MeetingStatus.Planned => "fa fa-calendar-check",
                MeetingStatus.UnderApproval => "fa fa-gavel",
                MeetingStatus.Approved  => meeting.GroupDomainId>0 ? "fa fa-check-double" : "fa fa-check-circle",

                _ => string.Empty,
            }
        };

    static private string StatusColor(this Meeting meeting, DateTime at) =>
        (MeetingStatus)meeting.Status switch
        {
            MeetingStatus.Canceled => "red",
            MeetingStatus.Approved => "green",
            MeetingStatus.Planned => meeting.GroupDomainId == 0 ? "green" : "blue",
            MeetingStatus.Preliminary => "orange",
            _ => "blue"

        };

    public static MarkupString DisplayedStatus(this Meeting meeting, DateTime at) =>
        new(
            $"""
            <span class="{meeting.StatusIcon(at)}" style="color: {meeting.StatusColor(at)}" title="{meeting.Status(at)}"></span>
            """
            );


}

