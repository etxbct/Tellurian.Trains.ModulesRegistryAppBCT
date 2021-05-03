﻿CREATE TABLE [dbo].[OperatingDay] (
    [Id]          INT           NOT NULL,
    [Flag]        TINYINT       NOT NULL,
    [FullName]    NVARCHAR (50) NOT NULL,
    [ShortName]   NVARCHAR (10) NOT NULL,
    [IsBasicDay]  BIT           NOT NULL,
    [IsMonday]    BIT           NOT NULL,
    [IsTuesday]   BIT           NOT NULL,
    [IsWednesday] BIT           NOT NULL,
    [IsThursday]  BIT           NOT NULL,
    [IsFriday]    BIT           NOT NULL,
    [IsSaturday]  BIT           NOT NULL,
    [IsSunday]    BIT           NOT NULL,
    CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED ([Id] ASC)
);

