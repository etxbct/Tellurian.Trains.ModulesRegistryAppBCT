/****** Object:  Table [dbo].[ModuleStandard]    Script Date: 2022-10-26 19:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleStandard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](12) NULL,
	[ScaleId] [int] NOT NULL,
	[TrackSystem] [nvarchar](20) NULL,
	[NormalGauge] [float] NULL,
	[NarrowGauge] [float] NULL,
	[Wheelset] [nvarchar](50) NULL,
	[Couplings] [nvarchar](20) NULL,
	[Electricity] [nvarchar](20) NULL,
	[PreferredTheme] [nvarchar](50) NULL,
	[AcceptedNorm] [nvarchar](255) NULL,
	[MainTheme] [nvarchar](10) NULL,
 CONSTRAINT [PK_ModuleStandard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ModuleStandard]  WITH CHECK ADD  CONSTRAINT [FK_ModuleStandard_Scale] FOREIGN KEY([ScaleId])
REFERENCES [dbo].[Scale] ([Id])
GO
ALTER TABLE [dbo].[ModuleStandard] CHECK CONSTRAINT [FK_ModuleStandard_Scale]
GO
