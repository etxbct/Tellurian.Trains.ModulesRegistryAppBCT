/****** Object:  Table [dbo].[CargoUnit]    Script Date: 2022-10-26 19:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CargoUnit](
	[Id] [int] NOT NULL,
	[SingularResourceCode] [nvarchar](50) NOT NULL,
	[PluralResourceCode] [nvarchar](50) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[FullName] [nvarchar](12) NOT NULL,
	[Designation] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_CargoUnit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CargoUnit] ADD  DEFAULT ((0)) FOR [DisplayOrder]
GO
