﻿using Microsoft.Data.SqlClient;
using System.Data;
using System.Resources;

namespace ModulesRegistry.Services.Implementations;

public class WaybillService
{
    private readonly IDbContextFactory<ModulesDbContext> Factory;
    public WaybillService(IDbContextFactory<ModulesDbContext> factory)
    {
        Factory = factory;
    }


    public async Task<IEnumerable<Waybill>> GetStationCustomerWaybills(ClaimsPrincipal? principal, int stationId, int? stationCustomerId, bool receiving, bool sending)
    {
        List<Waybill> waybills = new List<Waybill>(200);
        if (principal.IsAuthenticated())
        {
            var dbContext = Factory.CreateDbContext();
            using var connection = dbContext.Database.GetDbConnection() as SqlConnection;
            if (connection is not null)
            {
                var command = new SqlCommand("GetStationCustomerWaybills", connection)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 120
                };
                command.Parameters.AddWithValue("@StationId", stationId);
                command.Parameters.AddWithValue("StationCustomerId", stationCustomerId);
                command.Parameters.AddWithValue("@Sending", sending);
                command.Parameters.AddWithValue("@Receiving", receiving);
                try
                {
                    connection.Open();
                    var reader = await command.ExecuteReaderAsync();
                    var resourceManager = new ResourceManager(typeof(Resources.Strings));
                    while (await reader.ReadAsync())
                    {
                        waybills.Add(reader.MapWaybill(stationId));
                    }
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
        return waybills;

    }

    public async Task<IEnumerable<Waybill>?> GetWaybills(ClaimsPrincipal? principal, int layoutId, int? stationId, bool matchShadowYards = false)
    {
        List<Waybill> waybills = new List<Waybill>(200);
        if (principal.IsAuthenticated())
        {
            var dbContext = Factory.CreateDbContext();
            using var connection = dbContext.Database.GetDbConnection() as SqlConnection;
            if (connection is not null)
            {
                var command = new SqlCommand("GetWaybills", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };

                command.Parameters.AddWithValue("@LayoutId", layoutId);
                if (stationId.HasValue)
                {
                    command.Parameters.AddWithValue("@StationId", stationId);
                    command.Parameters.AddWithValue("@Receiving", true);
                    command.Parameters.AddWithValue("@Sending", matchShadowYards);
                }
                command.Parameters.AddWithValue("@MatchShadowYard", matchShadowYards);
                try
                {
                    connection.Open();
                    var reader = await command.ExecuteReaderAsync();
                    var resourceManager = new ResourceManager(typeof(Resources.Strings));
                    while (await reader.ReadAsync())
                    {
                        waybills.Add(reader.MapWaybill(stationId ?? 0));
                    }
                }
                catch (Exception)
                {
                    return waybills;
                }
            }
        }
        return waybills;
    }
}
internal static class WaybillMapper
{
    public static Waybill MapWaybill(this IDataRecord record, int stationId)
    {
        var waybill = new Waybill(record.MapOriginCargoCustomer(), record.MapDestinationCargoCustomer())
        {
            Id = record.GetInt("Id"),
            OwnerStationId = stationId,
            Quantity = record.GetInt("Quantity"),
            QuantityShortUnit = record.GetString("QuantityShortUnit"),
            OperatorName = string.Empty, // To be supported
            DefaultWagonClass = record.GetString("DefaultClasses"),
            SpecialWagonClass = record.GetString("SpecificWagonClass"),
            PrintCount = record.GetInt("PrintCount"),
            PrintPerOperatingDay = record.GetBool("PrintPerOperatingDay"),
            HasEmptyReturn = record.GetBool("HasEmptyReturn"),
            //MatchReturn = record.GetBool("MatchReturn")
        };
        waybill.Origin.Waybill = waybill;
        waybill.Destination.Waybill = waybill;  
        return waybill;
    }

    internal static CargoCustomer MapOriginCargoCustomer(this IDataRecord record) =>
        new()
        {
            IsOrigin = true,
            Name = record.GetString("SenderName"),
            StationId = record.GetInt("OriginStationId"),
            StationName = record.GetString("OriginStationName"),
            InternationalStationName = record.GetString("OriginInternationalStationName"),
            Languages = record.GetString("OriginLanguages", "en"),
            DomainSuffix = record.GetString("OriginDomainSuffix"),
            ForeColor = record.GetString("OriginForeColor"),
            BackColor = record.GetString("OriginBackColor"),
            CargoName = record.GetString(record.GetString("OriginLanguages", "EN").FirstItem("EN")),
            PackagingUnitResourceKey = record.GetString("PackagingUnitResourceName"),
            QuantityUnitResourceKey = record.GetString("QuanityUnitResourceName"),
            IsModuleStation = record.GetBool("OriginIsModuleStation"),
            OperationDaysFlags = record.GetByte("SendingDayFlag"),
            ReadyTimeResourceKey = record.GetString("SenderReadyTime"),
            TrackOrArea = record.GetString("SenderTrackOrArea"),
            TrackOrAreaColor = record.GetString("SenderTrackOrAreaColor"),
            CargoTrackOrArea = record.GetString("SenderCargoTrackOrArea"),
            CargoTrackOrAreaColor = record.GetString("SenderCargoTrackOrAreaColor"),
            FromYear = record.GetNullableInt("SenderFromYear", null),
            UptoYear = record.GetNullableInt("SenderUptoYear", null)
        };

    internal static CargoCustomer MapDestinationCargoCustomer(this IDataRecord record) =>
        new()
        {
            Name = record.GetString("ReceiverName"),
            StationId = record.GetInt("DestinationStationId"),
            StationName = record.GetString("DestinationStationName"),
            InternationalStationName = record.GetString("DestinationInternationalStationName"),
            Languages = record.GetString("DestinationLanguages", "en"),
            DomainSuffix = record.GetString("DestinationDomainSuffix"),
            ForeColor = record.GetString("DestinationForeColor"),
            BackColor = record.GetString("DestinationBackColor"),
            CargoName = record.GetString(record.GetString("DestinationLanguages", "EN").FirstItem("EN")),
            PackagingUnitResourceKey = record.GetString("PackagingUnitResourceName"),
            PackagingPrepositionResourceCode = record.GetString("PackagingPrepositionResourceCode"),
            QuantityUnitResourceKey = record.GetString("QuanityUnitResourceName"),
            IsModuleStation = record.GetBool("DestinationIsModuleStation"),
            OperationDaysFlags = record.GetByte("ReceivingDayFlag"),
            ReadyTimeResourceKey = record.GetString("ReceiverReadyTime"),
            TrackOrArea = record.GetString("ReceiverTrackOrArea"),
            TrackOrAreaColor = record.GetString("ReceiverTrackOrAreaColor"),
            CargoTrackOrArea = record.GetString("ReceiverCargoTrackOrArea"),
            CargoTrackOrAreaColor = record.GetString("ReceiverCargoTrackOrAreaColor"),
            FromYear = record.GetNullableInt("ReceiverFromYear", null),
            UptoYear = record.GetNullableInt("ReceiverUptoYear", null)
        };
}


