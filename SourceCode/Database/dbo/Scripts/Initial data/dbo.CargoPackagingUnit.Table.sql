/****** Object:  Table [dbo].[CargoPackagingUnit]    Script Date: 2022-10-26 19:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CargoPackagingUnit](
	[Id] [int] NOT NULL,
	[SingularResourceCode] [nvarchar](50) NOT NULL,
	[PluralResourceCode] [nvarchar](50) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[PrepositionResourceCode] [nvarchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
