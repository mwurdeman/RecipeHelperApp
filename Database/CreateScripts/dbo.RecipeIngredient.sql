USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RecipeIngredient](
	[RecipeID] [int] NOT NULL,
	[IngredientID] [int] NOT NULL,
	[UnitOfMeasure] [varchar](50) NOT NULL,
	[Amont] [int] NOT NULL,
 CONSTRAINT [PK_RecipeIngredient] PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC,
	[IngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[RecipeIngredient]  WITH CHECK ADD  CONSTRAINT [FK_RecipeIngredient_Ingredient] FOREIGN KEY([IngredientID])
REFERENCES [dbo].[Ingredient] ([IngredientID])
GO

ALTER TABLE [dbo].[RecipeIngredient] CHECK CONSTRAINT [FK_RecipeIngredient_Ingredient]
GO

ALTER TABLE [dbo].[RecipeIngredient]  WITH CHECK ADD  CONSTRAINT [FK_RecipeIngredient_Recipe] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipe] ([RecipeID])
GO

ALTER TABLE [dbo].[RecipeIngredient] CHECK CONSTRAINT [FK_RecipeIngredient_Recipe]
GO


