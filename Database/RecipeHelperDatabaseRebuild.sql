USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

--DROP TABLES
DROP TABLE dbo.RecipeStyle
DROP TABLE dbo.RecipeCategory
DROP TABLE dbo.RecipeDish
DROP TABLE dbo.RecipeStepIngredient
DROP TABLE dbo.RecipeIngredient
DROP TABLE dbo.Style
DROP TABLE dbo.Category
DROP TABLE dbo.Dish
DROP TABLE dbo.Ingredient
DROP TABLE dbo.RecipeStep
DROP TABLE dbo.Recipe

--CREATE TABLES
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

CREATE TABLE [dbo].[Ingredient](
	[IngredientID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Description] [varchar](250) NULL,
	[StockingUnit] [varchar](50) NOT NULL,
	[StockingSize] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ingredient] PRIMARY KEY CLUSTERED 
(
	[IngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Dish](
	[DishID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_Dish] PRIMARY KEY CLUSTERED 
(
	[DishID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Style](
	[StyleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_Style] PRIMARY KEY CLUSTERED 
(
	[StyleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[RecipeStep](
	[RecipeStepID] [int] IDENTITY(1,1) NOT NULL,
	[StepNumber] [int] NOT NULL,
	[RecipeID] [int] NOT NULL,
	[StepInformation] [varchar](max) NOT NULL,
	[CookingTime] [varchar](50) NOT NULL,
	[CookingTemperature] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RecipeStep] PRIMARY KEY CLUSTERED 
(
	[RecipeStepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[RecipeStep]  WITH CHECK ADD  CONSTRAINT [FK_RecipeStep_Recipe] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipe] ([RecipeID])
GO

ALTER TABLE [dbo].[RecipeStep] CHECK CONSTRAINT [FK_RecipeStep_Recipe]
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

CREATE TABLE [dbo].[RecipeDish](
	[RecipeID] [int] NOT NULL,
	[DishID] [int] NOT NULL,
 CONSTRAINT [PK_RecipeDish] PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC,
	[DishID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RecipeDish]  WITH CHECK ADD  CONSTRAINT [FK_RecipeDish_Dish] FOREIGN KEY([DishID])
REFERENCES [dbo].[Dish] ([DishID])
GO

ALTER TABLE [dbo].[RecipeDish] CHECK CONSTRAINT [FK_RecipeDish_Dish]
GO

ALTER TABLE [dbo].[RecipeDish]  WITH CHECK ADD  CONSTRAINT [FK_RecipeDish_Recipe] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipe] ([RecipeID])
GO

ALTER TABLE [dbo].[RecipeDish] CHECK CONSTRAINT [FK_RecipeDish_Recipe]
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

CREATE TABLE [dbo].[RecipeStyle](
	[RecipeID] [int] NOT NULL,
	[StyleID] [int] NOT NULL,
 CONSTRAINT [PK_RecipeStyle] PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC,
	[StyleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RecipeStyle]  WITH CHECK ADD  CONSTRAINT [FK_RecipeStyle_Recipe] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipe] ([RecipeID])
GO

ALTER TABLE [dbo].[RecipeStyle] CHECK CONSTRAINT [FK_RecipeStyle_Recipe]
GO

ALTER TABLE [dbo].[RecipeStyle]  WITH CHECK ADD  CONSTRAINT [FK_RecipeStyle_Style] FOREIGN KEY([StyleID])
REFERENCES [dbo].[Style] ([StyleID])
GO

ALTER TABLE [dbo].[RecipeStyle] CHECK CONSTRAINT [FK_RecipeStyle_Style]
GO

--INSERT INTO TABLES
INSERT INTO Dish
(Name)
VALUES
('Breakfast');

INSERT INTO Dish
(Name)
VALUES
('Lunch');

INSERT INTO Dish
(Name)
VALUES
('Dinner');

INSERT INTO Dish
(Name)
VALUES
('Snack');

INSERT INTO Dish
(Name)
VALUES
('Dessert');

INSERT INTO Category
(Name)
VALUES
('Chicken');

INSERT INTO Category
(Name)
VALUES
('Pork');

INSERT INTO Category
(Name)
VALUES
('Steak');

INSERT INTO Category
(Name)
VALUES
('Beef');

INSERT INTO Category
(Name)
VALUES
('Pasta');

INSERT INTO Category
(Name)
VALUES
('Soup');

INSERT INTO Category
(Name)
VALUES
('Fish');

INSERT INTO Style
(Name)
VALUES
('BBQ');

INSERT INTO Style
(Name)
VALUES
('Chinese');

INSERT INTO Style
(Name)
VALUES
('Italian');

INSERT INTO Style
(Name)
VALUES
('Mexican');

INSERT INTO Style
(Name)
VALUES
('Stew');

--SELECT FROM TABLES
SELECT * FROM dbo.Recipe
SELECT * FROM dbo.Ingredient
SELECT * FROM dbo.Style
SELECT * FROM dbo.Category
SELECT * FROM dbo.Dish
SELECT * FROM dbo.RecipeStep
SELECT * FROM dbo.RecipeIngredient