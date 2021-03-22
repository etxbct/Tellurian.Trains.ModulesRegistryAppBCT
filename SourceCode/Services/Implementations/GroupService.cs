﻿using Microsoft.EntityFrameworkCore;
using ModulesRegistry.Data;
using ModulesRegistry.Services.Extensions;
using ModulesRegistry.Services.Resources;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace ModulesRegistry.Services.Implementations
{
    public sealed class GroupService 
    {
        private readonly IDbContextFactory<ModulesDbContext> Factory;
        public GroupService(IDbContextFactory<ModulesDbContext> factory)
        {
            Factory = factory;
        }

        public async Task<IEnumerable<Group>> GetAllAsync(ClaimsPrincipal? principal, int countryId)
        {
            if (principal.IsCountryAdministratorInCountry(countryId))
            {
                using var dbContext = Factory.CreateDbContext();
                return await dbContext.Groups.AsNoTracking()
                    .Where(g => g.CountryId == countryId)
                    .OrderBy(g => g.FullName)
                    .ToListAsync();
            }
            else
            {
                using var dbContext = Factory.CreateDbContext();
                return await dbContext.Groups.AsNoTracking()
                    .Where(g => g.GroupMembers
                    .Any(gm => (gm.IsGroupAdministrator || gm.IsDataAdministrator) && gm.PersonId == principal.PersonId()))
                    .OrderBy(g => g.FullName)
                    .ToListAsync();
            }
        }

        public async Task<Group?> FindByIdAsync(ClaimsPrincipal? principal, int id)
        {
            using var dbContext = Factory.CreateDbContext();
            var group = await dbContext.Groups.AsNoTracking()
                .Include(g => g.GroupMembers)
                .ThenInclude(gm => gm.Person)
                .SingleOrDefaultAsync(g => g.Id == id);
            if (principal.IsCountryAdministratorInCountry(group.CountryId) || await IsGroupMemberAdministratorAsync(principal, id)) return group;
            return null;
        }

        public async Task<GroupMember?> FindMemberByIdAsync(ClaimsPrincipal? principal, int memberId)
        {
            using var dbContext = Factory.CreateDbContext();
            var groupMember = await dbContext.GroupMembers.AsNoTracking()
                .Where(gm => gm.Id == memberId)
                .Include(gm => gm.Group)
                .Include(gm => gm.Person)
                .SingleOrDefaultAsync();
            if (groupMember is null) return null;
            if (await IsGroupDataAdministratorAsync(principal, groupMember.GroupId, groupMember.Group.CountryId)) return groupMember;
            return null;
        }

        public async Task<bool> IsGroupDataAdministratorAsync(ClaimsPrincipal? pricipal, int groupId, int? countryId = null)
        {
            if (pricipal.IsCountryAdministratorInCountry(countryId))
            {
                return true;
            }
            else
            {
                using var dbContext = Factory.CreateDbContext();
                return await dbContext.GroupMembers.AsNoTracking()
                    .AnyAsync(gm => gm.GroupId == groupId && gm.PersonId == pricipal.PersonId() && gm.IsDataAdministrator);
            }
        }
        public async Task<bool> IsGroupMemberAdministratorAsync(ClaimsPrincipal? pricipal, int groupId, int? countryId = null)
        {
            if (pricipal.IsCountryAdministratorInCountry(countryId))
            {
                return true;
            }
            else
            {
                using var dbContext = Factory.CreateDbContext();
                return await dbContext.GroupMembers.AsNoTracking()
                    .AnyAsync(gm => gm.GroupId == groupId && gm.PersonId == pricipal.PersonId() && gm.IsGroupAdministrator);
            }
        }

        public async Task<bool> IsDataAdministratorInSameGroupAsMember(ClaimsPrincipal? pricipal, int memberPersonId)
        {
            using var dbContext = Factory.CreateDbContext();
            var adminGroups = await dbContext.Groups.AsNoTracking().Include(g => g.GroupMembers).Where(g => g.GroupMembers.Any(gm => gm.IsDataAdministrator && gm.PersonId == pricipal.PersonId())).ToListAsync();
            if (adminGroups is null || adminGroups.Count == 0) return false;
            return adminGroups.Any(ag => ag.GroupMembers.Any(gm => gm.PersonId == memberPersonId));
        }

        public async Task<(int Count, string Message, Group? Entity)> SaveAsync(ClaimsPrincipal? principal, Group group)
        {
            if (principal.MaySave())
            {
                using var dbContext = Factory.CreateDbContext();
                dbContext.Groups.Attach(group);
                dbContext.Entry(group).State = group.Id.GetState();
                var count = await dbContext.SaveChangesAsync();
                return count.SaveResult(group);
            }
            return principal.SaveNotAuthorised<Group>();
        }

        public async Task<(int Count, string Message, GroupMember? Entity)> SaveMemberAsync(ClaimsPrincipal? principal, GroupMember entity)
        {
            using var dbContext = Factory.CreateDbContext();
            var countryId = (await dbContext.Groups.AsNoTracking().SingleOrDefaultAsync(g => g.Id == entity.GroupId))?.CountryId;
            if (await IsGroupDataAdministratorAsync(principal, entity.GroupId, countryId))
            {
                dbContext.GroupMembers.Attach(entity);
                dbContext.Entry(entity).State = entity.Id.GetState();
                var count = await dbContext.SaveChangesAsync();
                return count.SaveResult(entity);
            }
            return principal.SaveNotAuthorised<GroupMember>();
        }

        public async Task<(int Count, string Message)> DeleteAsync(ClaimsPrincipal? principal, int id)
        {
            if (principal.MayDelete())
            {
                using var dbContext = Factory.CreateDbContext();
                var group = await FindByIdAsync(principal, id);
                if (group is null) return (0, Strings.NothingToDelete);
                if (group.GroupMembers.Any() || group.ModuleOwnerships.Any()) return (0, Strings.MayNotBeDeleted);
                dbContext.Remove(group);
                var count = await dbContext.SaveChangesAsync();
                return count.DeleteResult();
            }
            return principal.DeleteNotAuthorized<Group>();
        }

        public async Task<(int Count, string Message, GroupMember? Member)> AddMemberAsync(ClaimsPrincipal? principal, GroupMember groupMember)
        {
            using var dbContext = Factory.CreateDbContext();
            if (principal.IsGroupMemberAdministrator(dbContext.GroupMembers.Where(gm => gm.GroupId == groupMember.GroupId)))
            {
                var existing = dbContext.GroupMembers.SingleOrDefault(gm => gm.PersonId == groupMember.PersonId && gm.GroupId == groupMember.GroupId);
                if (existing is not null) return existing.AlreadyExists();
                dbContext.GroupMembers.Add(groupMember);
                var result = await dbContext.SaveChangesAsync();
                return result.SaveResult(groupMember);
            }
            return principal.SaveNotAuthorised<GroupMember>();
        }

        public async Task<(int Count, string Message)> RemoveMemberAsync(ClaimsPrincipal? principal, int groupId, int personId)
        {
            using var dbContext = Factory.CreateDbContext();
            var countryId = (await dbContext.Groups.AsNoTracking().SingleOrDefaultAsync(g => g.Id == groupId))?.CountryId;
            if (countryId.HasValue && await IsGroupDataAdministratorAsync(principal, groupId, countryId.Value))
            {
                var existing = await dbContext.GroupMembers.SingleOrDefaultAsync(gm => gm.PersonId == personId && gm.GroupId == groupId);
                if (existing is null) return existing.NotFound();
                dbContext.GroupMembers.Remove(existing);
                var result = await dbContext.SaveChangesAsync();
                return result.DeleteResult();
            }
            return principal.DeleteNotAuthorized<GroupMember>();
        }
    }
}
