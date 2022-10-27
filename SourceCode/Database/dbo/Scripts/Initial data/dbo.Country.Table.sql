/****** Object:  Table [dbo].[Country]    Script Date: 2022-10-26 19:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EnglishName] [nvarchar](50) NOT NULL,
	[DomainSuffix] [nchar](2) NOT NULL,
	[Languages] [nvarchar](10) NULL,
	[TimeZoneName] [nvarchar](50) NULL,
	[IsFullySupported] [bit] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Country] ADD  DEFAULT ((0)) FOR [IsFullySupported]
GO
