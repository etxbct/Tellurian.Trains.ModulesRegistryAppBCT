/****** Object:  Table [dbo].[OperatingBasicDay]    Script Date: 2022-10-26 19:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperatingBasicDay](
	[OperatingDayId] [int] NOT NULL,
	[BasicDayId] [int] NOT NULL,
 CONSTRAINT [PK_OperatingDayId_BasicDayId] PRIMARY KEY CLUSTERED 
(
	[OperatingDayId] ASC,
	[BasicDayId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OperatingBasicDay]  WITH CHECK ADD  CONSTRAINT [FK_OperatingBasicDay_BasicDays] FOREIGN KEY([BasicDayId])
REFERENCES [dbo].[OperatingDay] ([Id])
GO
ALTER TABLE [dbo].[OperatingBasicDay] CHECK CONSTRAINT [FK_OperatingBasicDay_BasicDays]
GO
ALTER TABLE [dbo].[OperatingBasicDay]  WITH CHECK ADD  CONSTRAINT [FK_OperatingBasicDay_OperatingDays] FOREIGN KEY([OperatingDayId])
REFERENCES [dbo].[OperatingDay] ([Id])
GO
ALTER TABLE [dbo].[OperatingBasicDay] CHECK CONSTRAINT [FK_OperatingBasicDay_OperatingDays]
GO
