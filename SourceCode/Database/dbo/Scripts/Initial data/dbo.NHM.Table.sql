/****** Object:  Table [dbo].[NHM]    Script Date: 2022-10-26 19:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHM](
	[Id] [int] NOT NULL,
	[Code] [nchar](8) NOT NULL,
	[LevelDigits] [tinyint] NOT NULL,
	[DA] [nvarchar](2000) NOT NULL,
	[DE] [nvarchar](2000) NOT NULL,
	[EN] [nvarchar](2000) NOT NULL,
	[NL] [nvarchar](2000) NOT NULL,
	[PL] [nvarchar](2000) NOT NULL,
	[SV] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_NHM] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
