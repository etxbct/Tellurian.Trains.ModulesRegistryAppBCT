﻿CREATE VIEW [dbo].[ModuleConsumerWaybill] AS 
-- This view is waybills to consumers at other module stations.
-- This view must match colums in same order as in views:
-- ModuleSupplierWaybill
-- ModuleConsumerWaybill (this)
-- ExternalSupplierWaybill
-- ExternalConsumerWaybill
SELECT
	SCW.Id,
	SCW.PrintCount,
	SCW.PrintPerOperatingDay,
	SCW.HasEmptyReturn,
	SENDER.StationId AS OriginStationId,
	SENDER.StationCustomerId AS OriginStationCustomerId,
	SENDER.StationName AS OriginStationName,
	SENDER.InternationalStationName AS OriginInternationalStationName,
	SENDER.CustomerName AS SenderName,
	SENDER.CustomerTrackOrArea AS SenderTrackOrArea,
	SENDER.CustomerTrackOrAreaColor AS SenderTrackOrAreaColor,
	SENDER.CargoTrackOrArea AS SenderCargoTrackOrArea,
	SENDER.CargoTrackOrAreaColor AS SenderCargoTrackOrAreaColor,
	SENDER.Languages AS OriginLanguages,
	SENDER.DomainSuffix AS OriginDomainSuffix,
	SENDER.BackColor AS OriginBackColor,
	SENDER.ForeColor AS OriginForeColor,
	SENDER.ReadyTime AS SenderReadyTime,
	SENDER.OperatingDayFlag AS SendingDayFlag,
	SENDER.IsModuleStation AS OriginIsModuleStation,
	SENDER.FromYear AS SenderFromYear,
	SENDER.UptoYear AS SenderUptoYear,
	CAST (1 AS BIT) AS OriginIsExternal,
	RECEIVER.StationId AS DestinationStationId,
	RECEIVER.StationCustomerId AS DestinationStationCustomerId,
	RECEIVER.StationName AS DestinationStationName,
	RECEIVER.InternationalStationName AS DestinationInternationalStationName,
	RECEIVER.CustomerName AS ReceiverName,
	RECEIVER.CustomerTrackOrArea AS ReceiverTrackOrArea,
	RECEIVER.CustomerTrackOrAreaColor AS ReceiverTrackOrAreaColor,
	RECEIVER.CargoTrackOrArea AS ReceiverCargoTrackOrArea,
	RECEIVER.CargoTrackOrAreaColor AS ReceiverCargoTrackOrAreaColor,
	RECEIVER.Languages AS DestinationLanguages,
	RECEIVER.DomainSuffix AS DestinationDomainSuffix,
	RECEIVER.BackColor AS DestinationBackColor,
	RECEIVER.ForeColor AS DestinationForeColor,
	RECEIVER.ReadyTime AS ReceiverReadyTime,
	RECEIVER.OperatingDayFlag AS ReceivingDayFlag,
	RECEIVER.IsModuleStation AS DestinationIsModuleStation,
	RECEIVER.SpecialCargoName,
	RECEIVER.SpecificWagonClass,
	RECEIVER.QuantityUnitId,
	RECEIVER.Quantity,
	RECEIVER.QuantityUnitResourceCode AS QuanityUnitResourceName,
	RECEIVER.QuantityShortUnit,
	RECEIVER.PackagingUnit AS PackagingUnitResourceName,
	RECEIVER.PackagingPrepositionResourceCode,
	RECEIVER.FromYear AS ReceiverFromYear,
	RECEIVER.UptoYear AS ReceiverUptoYear,
	CAST (1 AS BIT) AS DestinationIsExternal,
	C.DefaultClasses,
	C.NHMCode,
	C.DA,
	C.DE,
	C.EN,
	C.FR,
	C.IT,
	C.NB,
	C.NL,
	C.PL,
	C.SV
FROM
	StationCustomerWaybill AS SCW INNER JOIN
	SupplierCustomerCargo SENDER ON SCW.StationCustomerCargoId = SENDER.StationCustomerCargoId INNER JOIN
	ConsumerCustomerCargo RECEIVER ON SCW.OtherStationCustomerCargoId = RECEIVER.StationCustomerCargoId INNER JOIN
	Cargo AS C ON C.Id = SENDER.CargoId
WHERE
	SENDER.IsModuleStation <> 0 AND RECEIVER.IsModuleStation <> 0 AND 
	(C.FromYear IS NULL OR SENDER.UptoYear IS NULL OR C.FromYear <= SENDER.UptoYear ) AND
	(C.UptoYear IS NULL OR SENDER.FromYear IS NULL OR C.UptoYear >= SENDER.FromYear )
