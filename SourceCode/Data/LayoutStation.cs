﻿#nullable disable

using Microsoft.EntityFrameworkCore;

namespace ModulesRegistry.Data;

public class LayoutStation
{
    public LayoutStation()
    {
        LayoutModules = new HashSet<LayoutModule>();
        Regions = new HashSet<Region>();
        StartingLines = new HashSet<LayoutLine>();
        EndingLines = new HashSet<LayoutLine>();
    }
    public int Id { get; set; }
    public int LayoutParticipantId { get; set; }
    public int StationId { get; set; }
    public string OtherName { get; set; }
    public string OtherSignature { get; set; }
    public int? OtherCountryId { get; set; }

    public virtual LayoutParticipant LayoutParticipant { get; set; }
    public virtual Station Station { get; set; }
    public virtual Country OtherCountry { get; set; }
    public virtual ICollection<LayoutModule> LayoutModules { get; set; }
    public virtual ICollection<Region> Regions { get; set; }
    public virtual ICollection<LayoutLine> StartingLines { get; set; }
    public virtual ICollection<LayoutLine> EndingLines { get; set; }
}

internal static class LayoutStationMapping
{
    public static void MapLayoutStation(this ModelBuilder modelBuilder) =>
        modelBuilder.Entity<LayoutStation>(entity =>
        {
            entity.ToTable("LayoutStation");

            entity.Property(e => e.OtherName)
                 .HasMaxLength(50);

            entity.Property(e => e.OtherSignature)
                  .HasMaxLength(5);

            entity.HasOne(e => e.LayoutParticipant)
                 .WithMany(e => e.LayoutStations)
                 .HasForeignKey(e => e.LayoutParticipantId);

            entity.HasMany(e => e.Regions)
                .WithMany(e => e.LayoutStations);

            entity.HasOne(e => e.Station)
                 .WithOne()
                 .HasForeignKey<LayoutStation>(e => e.StationId);

            entity.HasOne(e => e.OtherCountry)
                .WithOne()
                .HasForeignKey<LayoutStation>(e => e.OtherCountryId);
        });
}