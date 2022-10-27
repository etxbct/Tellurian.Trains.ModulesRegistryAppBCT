/****** Object:  Table [dbo].[CargoDirection]    Script Date: 2022-10-26 19:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CargoDirection](
	[Id] [int] NOT NULL,
	[FullName] [nvarchar](10) NOT NULL,
	[ShortName] [nvarchar](4) NOT NULL,
	[IsSupply] [bit] NOT NULL,
	[IsInternational] [bit] NOT NULL,
 CONSTRAINT [PK_CargoDirection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CargoDirection] ADD  CONSTRAINT [DF_CargoDirection_IsInternational]  DEFAULT ((0)) FOR [IsInternational]
GO
