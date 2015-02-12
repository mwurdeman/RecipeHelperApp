USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RecipeUser](
	[RecipeUserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [VARCHAR](100) NOT NULL,
	[LastName] [VARCHAR](100) NOT NULL,
	[Active] [BIT] NOT NULL,
 CONSTRAINT [PK_RecipeUserID] PRIMARY KEY CLUSTERED
 (
	[RecipeUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


