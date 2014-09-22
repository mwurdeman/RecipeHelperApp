USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RecipeCategory](
	[RecipeID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_RecipeCategory] PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RecipeCategory]  WITH CHECK ADD  CONSTRAINT [FK_RecipeCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO

ALTER TABLE [dbo].[RecipeCategory] CHECK CONSTRAINT [FK_RecipeCategory_Category]
GO

ALTER TABLE [dbo].[RecipeCategory]  WITH CHECK ADD  CONSTRAINT [FK_RecipeCategory_Recipe] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipe] ([RecipeID])
GO

ALTER TABLE [dbo].[RecipeCategory] CHECK CONSTRAINT [FK_RecipeCategory_Recipe]
GO


