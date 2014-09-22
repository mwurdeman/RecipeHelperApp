USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RecipeStepIngredient](
	[RecipeStepID] [int] NOT NULL,
	[IngredientID] [int] NOT NULL,
	[UnitOfMeasure] [varchar](50) NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_RecipeStepIngredient] PRIMARY KEY CLUSTERED 
(
	[RecipeStepID] ASC,
	[IngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[RecipeStepIngredient]  WITH CHECK ADD  CONSTRAINT [FK_RecipeStepIngredient_Ingredient] FOREIGN KEY([IngredientID])
REFERENCES [dbo].[Ingredient] ([IngredientID])
GO

ALTER TABLE [dbo].[RecipeStepIngredient] CHECK CONSTRAINT [FK_RecipeStepIngredient_Ingredient]
GO

ALTER TABLE [dbo].[RecipeStepIngredient]  WITH CHECK ADD  CONSTRAINT [FK_RecipeStepIngredient_RecipeStep] FOREIGN KEY([RecipeStepID])
REFERENCES [dbo].[RecipeStep] ([RecipeStepID])
GO

ALTER TABLE [dbo].[RecipeStepIngredient] CHECK CONSTRAINT [FK_RecipeStepIngredient_RecipeStep]
GO


