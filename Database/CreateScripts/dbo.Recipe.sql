USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Recipe](
	[RecipeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[Source] [varchar](250) NOT NULL,
	[Servings] [varchar](50) NOT NULL,
	[PrepTime] [varchar](55) NOT NULL,
	[TotalRecipeTime] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Recipe] PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


