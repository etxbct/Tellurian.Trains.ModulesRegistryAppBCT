﻿CREATE VIEW [dbo].[CustomerCargo]
AS 
SELECT -- Internal station customer cargo
	LP.LayoutId,
	0 AS ExcludeLayoutId,
	SCC.StationCustomerId,
	SCC.Id,
	SCC.OperatingDayId,
	S.[Id] AS StationId,
	COALESCE(LS.OtherName, S.FullName) AS StationName,
	COALESCE(LS.OtherSignature, S.Signature) AS StationSignature,
	SCC.CargoId,
	CD.IsSupply,
	CD.IsInternational,
	1 AS IsInternal,
	0 AS IsShadowYard,
	C.DefaultClasses,
	COALESCE(LS.OtherCountryId, R.CountryId) AS CountryId,
	'#FFFFFF' AS BackColor,
	'#000000' AS ForeColor,
	SC.CustomerName,
	COALESCE(SCC.FromYear, SC.OpenedYear) AS FromYear,
	COALESCE(SCC.UptoYear, SC.ClosedYear) AS UptoYear,
	SCC.Quantity,
	SCC.QuantityUnitId,
	SCC.PackageUnitId,
	SCC.SpecificWagonClass,
	SCC.SpecialCargoName,
	CRT.ShortName AS ReadyTime,
	CRT.IsSpecifiedInLayout AS ReadyTimeIsSpecifiedInLayout,
	COALESCE(SCC.TrackOrArea, SC.TrackOrArea) AS TrackOrArea,
	CASE
		WHEN SCC.TrackOrAreaColor IS NOT NULL AND SCC.TrackOrAreaColor <> '#ffffff' THEN SCC.TrackOrAreaColor
		ELSE SC.TrackOrAreaColor
	END AS TrackOrAreaColor,
	SCC.EmptyReturn,
	SCC.MatchReturn
FROM [Station] AS S 
	INNER JOIN [Region] AS R ON S.RegionId = R.Id 
	INNER JOIN [StationCustomer] AS SC ON SC.StationId = S.Id
	INNER JOIN [StationCustomerCargo] AS SCC ON SCC.StationCustomerId = SC.Id
	INNER JOIN [Cargo] AS C ON SCC.CargoId = C.Id
	INNER JOIN [CargoDirection] AS CD ON SCC.DirectionId = CD.Id
	INNER JOIN [CargoReadyTime] AS CRT ON CRT.Id = SCC.ReadyTimeId
	LEFT JOIN [LayoutStation] AS LS ON LS.StationId = S.Id 
	LEFT JOIN LayoutParticipant LP ON LS.LayoutParticipantId = LP.Id
UNION
SELECT -- Modules not present in the current layout
	COALESCE(L.Id,0) AS LayoutId,
	COALESCE(L.Id,0) AS ExcludeLayoutId,
	SCC.StationCustomerId,
	SCC.Id,
	SCC.OperatingDayId,
	S.Id AS StationId,
	S.FullName AS StationName,
	S.Signature AS StationSignature,
	SCC.CargoId,
	CD.IsSupply,
	CD.IsInternational,
	0 AS IsInternal,
	0 AS IsShadowYard,
	C.DefaultClasses,
	R.CountryId,
	R.BackColor,
	R.ForeColor,
	SC.CustomerName,
	COALESCE(SCC.FromYear, SC.OpenedYear) AS FromYear,
	COALESCE(SCC.UptoYear, SC.ClosedYear) AS UptoYear,
	SCC.Quantity,
	SCC.QuantityUnitId,
	SCC.PackageUnitId,
	SCC.SpecificWagonClass,
	SCC.SpecialCargoName,
	CRT.ShortName AS ReadyTime,
	CRT.IsSpecifiedInLayout AS ReadyTimeIsSpecifiedInLayout,
	COALESCE(SCC.TrackOrArea, SC.TrackOrArea) AS TrackOrArea,
	CASE
		WHEN SCC.TrackOrAreaColor IS NOT NULL AND SCC.TrackOrAreaColor <> '#ffffff' THEN SCC.TrackOrAreaColor
		ELSE SC.TrackOrAreaColor
	END AS TrackOrAreaColor,
	SCC.EmptyReturn,
	SCC.MatchReturn
FROM 
	[Station] AS S INNER JOIN Region AS R ON R.Id = S.RegionId
	INNER JOIN [StationCustomer] AS SC ON SC.StationId = S.Id
	INNER JOIN [StationCustomerCargo] AS SCC ON SCC.StationCustomerId = SC.Id
	INNER JOIN [Cargo] AS C ON C.Id = SCC.CargoId
	INNER JOIN [CargoDirection] AS CD ON SCC.DirectionId = CD.Id
	INNER JOIN [CargoReadyTime] AS CRT ON CRT.Id = SCC.ReadyTimeId
	LEFT JOIN LayoutStation LS ON LS.StationId = S.Id
	LEFT JOIN LayoutParticipant LP ON LP.Id = LS.LayoutParticipantId
	LEFT JOIN Layout AS L ON L.Id = LP.LayoutId
	LEFT JOIN Meeting AS M ON M.Id = L.MeetingId
UNION
SELECT -- External station customer cargo
	-1 AS LayoutId,
	0 AS ExcludeLayoutId,
	-ESCC.ExternalStationCustomerId,
	-ESCC.Id AS Id,
	ESCC.OperatingDayId,
	-ES.[Id] AS StationId,
	ES.FullName AS StationName,
	ES.Signature AS StationSignature,
	ESCC.CargoId,
	CD.IsSupply,
	CD.IsInternational,
	0 AS IsInternal,
	0 AS IsShadowYard,
	C.DefaultClasses,
	R.CountryId,
	R.BackColor,
	R.ForeColor,
	ESC.CustomerName,
	COALESCE(ESCC.FromYear, ESC.OpenedYear) AS FromYear,
	COALESCE(ESCC.UptoYear, ESC.ClosedYear) AS UptoYear,
	ESCC.Quantity,
	ESCC.QuantityUnitId,
	ESCC.PackageUnitId,
	ESCC.SpecificWagonClass,
	ESCC.SpecialCargoName,
	NULL AS ReadyTime,
	0 AS ReadyTimeIsSpecifiedInLayout,
	NULL AS TrackOrArea,
	'#ffffff' AS TrackOrAreaColor,
	0 AS EmptyReturn,
	0 AS MatchReturn
FROM [ExternalStation] AS ES 
	INNER JOIN [Region] AS R ON ES.RegionId = R.Id 
	INNER JOIN [ExternalStationCustomer] AS ESC ON ESC.ExternalStationId = ES.Id
	INNER JOIN [ExternalStationCustomerCargo] AS ESCC ON ESCC.ExternalStationCustomerId = ESC.Id
	INNER JOIN [Cargo] AS C ON ESCC.CargoId = C.Id
	INNER JOIN [CargoDirection] AS CD ON ESCC.DirectionId = CD.Id
UNION

SELECT -- Shadow yard suppliers
	LP.LayoutId,
	0 AS ExcludeLayoutId,
	0 AS StationCustomerId,	
	0 AS Id,
	8 AS OperatingDayId,
	LS.StationId,
	COALESCE(LS.OtherName, S.FullName) AS StationName,
	COALESCE(LS.OtherSignature, S.Signature) AS StationSignature,
	C.Id AS GargoId,
	1 AS IsSupply,
	1 AS IsInternational,
	1 AS IsInternal,
	1 AS IsShadowYard,
	'' AS DefaultClasses,
	COALESCE(LS.OtherCountryId, R.CountryId) AS CountryId,
	'#FFFFFF' AS BackColor,
	'#000000' AS ForeColor,
	'ImportAgent' AS CustomerName,
	NULL AS FromYear,
	NULL AS UptoYear,
	10 AS Quantity,
	4 AS QuantityUnitId,
	0 AS PackageUnitId,
	NULL AS SpecificWagonClass,
	NULL AS SpecialCargoName,
	NULL AS ReadyTime,
	0 AS ReadyTimeIsSpecifiedInLayout,
	NULL AS TrackOrArea,
	'#ffffff' AS TrackOrAreaColor,
	0 AS EmptyReturn,
	0 AS MatchReturn
FROM 
	LayoutParticipant LP 
	INNER JOIN LayoutStation LS ON LS.LayoutParticipantId = LP.Id
	INNER JOIN Station S ON S.Id = LS.StationId
	LEFT JOIN Region R ON R.Id = S.RegionId
	--LEFT JOIN Region LSR ON R.Id = LS.
	JOIN Cargo AS C ON C.Id > 0
WHERE
	S.IsShadow <> 0
UNION
SELECT -- Shadow yard consumers
	LP.LayoutId,
	0 AS ExcludeLayoutId,
	0 AS StationCustomerId,
	0 AS Id,
	8 AS OperatingDayId,
	LS.StationId,
	COALESCE(LS.OtherName, S.FullName) AS StationName,
	COALESCE(LS.OtherSignature, S.Signature) AS StationSignature,
	C.Id AS GargoId,
	0 AS IsSupply,
	1 AS IsInternational,
	1 AS IsInternal,
	1 AS IsShadowYard,
	'' AS DefaultClasses,
	COALESCE(LS.OtherCountryId, R.CountryId) AS CountryId,
	'#FFFFFF' AS BackColor,
	'#000000' AS ForeColor,
	'ExportAgent' AS CustomerName,
	NULL AS FromYear,
	NULL AS UptoYear,
	10 AS Quantity,
	4 AS QuantityUnitId,
	0 AS PackageUnitId,
	NULL AS SpecificWagonClass,
	NULL AS SpecialCargoName,
	NULL AS ReadyTime,
	0 AS ReadyTimeIsSpecifiedInLayout,
	NULL AS TrackOrArea,
	'#ffffff' AS TrackOrAreaColor,
	0 AS EmptyReturn,
	0 AS MatchReturn
FROM 
	LayoutParticipant LP 
	INNER JOIN LayoutStation LS ON LS.LayoutParticipantId = LP.Id	
	INNER JOIN Station S ON S.Id = LS.StationId
	LEFT JOIN Region R ON R.Id = S.RegionId
	JOIN Cargo AS C ON C.Id > 0
WHERE
	S.IsShadow <> 0