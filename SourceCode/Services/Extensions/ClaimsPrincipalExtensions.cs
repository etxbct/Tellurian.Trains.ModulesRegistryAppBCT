﻿using System;
using System.Globalization;
using System.Linq;
using System.Security.Claims;

namespace ModulesRegistry.Services.Extensions
{
    public static class PolicyNames
    {
        public const string Admin = nameof(Admin);
        public const string User = nameof(User);
    }

    public static class AppClaimTypes
    {
        public const string GlobalAdministrator = nameof(GlobalAdministrator);
        public const string CountryAdministrator = nameof(CountryAdministrator);
        public const string PersonId = nameof(PersonId);
        public const string UserId = nameof(UserId);

    }

    public static class ClaimsPrincipalExtensions
    {
        public static string Name(this ClaimsPrincipal me) =>
            me.Claims.SingleOrDefault(c => c is not null && c.Type.Equals("name", StringComparison.OrdinalIgnoreCase))?.Value ?? "Unknown";

        public static string PreferredUserName(this ClaimsPrincipal me) =>
            me.Claims.SingleOrDefault(c => c is not null && c.Type.Equals("preferred_username", StringComparison.OrdinalIgnoreCase))?.Value ?? string.Empty;
        public static string EmailAddess(this ClaimsPrincipal me) =>
            me.Claims.SingleOrDefault(c => c is not null && c.Type.Equals("preferred_username", StringComparison.OrdinalIgnoreCase))?.Value ?? string.Empty;

        public static string? ObjectId(this ClaimsPrincipal me) =>
           me.Claims.SingleOrDefault(c => c is not null && c.Type.Equals("http://schemas.microsoft.com/identity/claims/objectidentifier", StringComparison.OrdinalIgnoreCase))?.Value;

        public static string? GivenName(this ClaimsPrincipal me) =>
            me.Claims.SingleOrDefault(c => c is not null && c.Type.Equals(ClaimTypes.GivenName, StringComparison.OrdinalIgnoreCase))?.Value;

        public static int AdministersCountryId(this ClaimsPrincipal me)
        {
            var admin = me.Claims.SingleOrDefault(c => c.Type.Equals(AppClaimTypes.CountryAdministrator));
            if (admin is null) return 0;
            return int.Parse(admin.Value, NumberStyles.Integer);
        }

        public static bool IsGlobalAdministrator(this ClaimsPrincipal me) =>
            me.Claims.Any(c => c.Type == AppClaimTypes.GlobalAdministrator);
    }
}
