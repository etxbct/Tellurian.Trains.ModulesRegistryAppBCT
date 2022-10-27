/****** Object:  Table [dbo].[Region]    Script Date: 2022-10-26 19:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[EnglishName] [nvarchar](50) NULL,
	[LocalName] [nvarchar](50) NOT NULL,
	[ColourName] [nvarchar](10) NULL,
	[Description] [nvarchar](max) NULL,
	[ForeColor] [nvarchar](10) NOT NULL,
	[BackColor] [nvarchar](10) NOT NULL,
	[RepresentativeExternalStationId] [int] NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_Country]
GO
ALTER TABLE [dbo].[Region]  WITH NOCHECK ADD  CONSTRAINT [FK_Region_RepresentativeExternalStationId] FOREIGN KEY([RepresentativeExternalStationId])
REFERENCES [dbo].[ExternalStation] ([Id])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_RepresentativeExternalStationId]
GO
