﻿CREATE TABLE [dbo].[Region] (
    [Id]                               INT            IDENTITY (1, 1) NOT NULL,
    [CountryId]                        INT            NOT NULL,
    [EnglishName]                      NVARCHAR (50)  NULL,
    [LocalName]                        NVARCHAR (50)  NOT NULL,
    [ColourName]                       NVARCHAR (10)  NULL,
    [Description]                      NVARCHAR (MAX) NULL,
    [ForeColor]                        NVARCHAR (10)  NOT NULL,
    [BackColor]                        NVARCHAR (10)  NOT NULL,
    [RepresentativeExternalStationId]  INT            NULL,
    [IsCargoHub]                       BIT            NOT NULL DEFAULT 0, 
    CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Region_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_Region_RepresentativeExternalStationId] FOREIGN KEY ([RepresentativeExternalStationId]) REFERENCES [dbo].[ExternalStation] ([Id]),
);




GO
CREATE NONCLUSTERED INDEX [IX_Region_CountryId]
    ON [dbo].[Region]([CountryId] ASC);

