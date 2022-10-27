/****** Object:  Table [dbo].[OperatingDay]    Script Date: 2022-10-26 19:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperatingDay](
	[Id] [int] NOT NULL,
	[Flag] [tinyint] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[ShortName] [nvarchar](10) NOT NULL,
	[IsBasicDay] [bit] NOT NULL,
	[IsMonday] [bit] NOT NULL,
	[IsTuesday] [bit] NOT NULL,
	[IsWednesday] [bit] NOT NULL,
	[IsThursday] [bit] NOT NULL,
	[IsFriday] [bit] NOT NULL,
	[IsSaturday] [bit] NOT NULL,
	[IsSunday] [bit] NOT NULL,
	[IsSundayFirst] [bit] NOT NULL,
 CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OperatingDay] ADD  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[OperatingDay] ADD  DEFAULT ((0)) FOR [IsSundayFirst]
GO
