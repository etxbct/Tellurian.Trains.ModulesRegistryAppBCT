/****** Object:  Table [dbo].[CargoReadyTime]    Script Date: 2022-10-26 19:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CargoReadyTime](
	[Id] [int] NOT NULL,
	[FullName] [nvarchar](20) NOT NULL,
	[ShortName] [nvarchar](10) NOT NULL,
	[IsSpecifiedInLayout] [bit] NOT NULL,
 CONSTRAINT [PK_CargoReadyTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CargoReadyTime] ADD  CONSTRAINT [DF_CargoReadyTime_IsSpecifiedInLayoyt]  DEFAULT ((0)) FOR [IsSpecifiedInLayout]
GO
