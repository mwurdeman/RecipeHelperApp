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
DROP TABLE dbo.Comment
DROP TABLE dbo.Review
DROP TABLE dbo.Recipe
DROP TABLE dbo.RecipeUser

--CREATE TABLES
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

CREATE TABLE [dbo].[Recipe](
	[RecipeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[Source] [varchar](250) NOT NULL,
	[Servings] [varchar](50) NOT NULL,
	[PrepTime] [varchar](55) NOT NULL,
	[TotalRecipeTime] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL
 CONSTRAINT [PK_Recipe] PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[RecipeUser] ([RecipeUserID])
GO

ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Recipe_CreatedBy]
GO

ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[RecipeUser] ([RecipeUserID])
GO

ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Recipe_ModifiedBy]
GO

CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[RecipeID] [int] NOT NULL,
	[RecipeUserID] [int] NOT NULL,
	[Comment] [VARCHAR](MAX) NOT NULL
 CONSTRAINT [PK_CommentID] PRIMARY KEY CLUSTERED
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_RecipeID] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipe] ([RecipeID])
GO

ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_RecipeID]
GO

ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_RecipeUserID] FOREIGN KEY([RecipeUserID])
REFERENCES [dbo].[RecipeUser] ([RecipeUserID])
GO

ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_RecipeUserID]
GO

CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[RecipeID] [int] NOT NULL,
	[RecipeUserID] [int] NOT NULL,
	[Review] [VARCHAR](MAX) NOT NULL,
	[Rating] [int] NOT NULL
 CONSTRAINT [PK_ReviewID] PRIMARY KEY CLUSTERED
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_RecipeID] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipe] ([RecipeID])
GO

ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_RecipeID]
GO

ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_RecipeUserID] FOREIGN KEY([RecipeUserID])
REFERENCES [dbo].[RecipeUser] ([RecipeUserID])
GO

ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_RecipeUserID]
GO

CREATE TABLE [dbo].[Ingredient](
	[IngredientID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Description] [varchar](250) NULL,
	[StockingUnit] [varchar](50) NOT NULL
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

ALTER TABLE [dbo].[RecipeStep] WITH CHECK ADD CONSTRAINT [FK_RecipeStep_Recipe] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipe] ([RecipeID])
GO

ALTER TABLE [dbo].[RecipeStep] CHECK CONSTRAINT [FK_RecipeStep_Recipe]
GO

CREATE TABLE [dbo].[RecipeIngredient](
	[RecipeID] [int] NOT NULL,
	[IngredientID] [int] NOT NULL,
	[UnitOfMeasure] [varchar](50) NOT NULL,
	[Amount] [int] NOT NULL,
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

INSERT INTO Category
(Name)
VALUES
('Hamburger');

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

INSERT INTO Style
(Name)
VALUES
('American');

INSERT INTO Style
(Name)
VALUES
('Other');

INSERT INTO Style
(Name)
VALUES
('Crockpot');

INSERT INTO Ingredient 
(Name, Description, StockingUnit)
VALUES
('Cream of Mushroom', '', '10 1/2 Oz Can');

INSERT INTO Ingredient 
(Name, Description, StockingUnit)
VALUES
('Cream of Chicken', '', '10 1/2 Oz Can');

INSERT INTO Ingredient 
(Name, Description, StockingUnit)
VALUES
('Yellow Onion', '', 'Each');

INSERT INTO Ingredient 
(Name, Description, StockingUnit)
VALUES
('Red Onion', '', 'Each');

INSERT INTO Ingredient 
(Name, Description, StockingUnit)
VALUES
('Red Pepper', '', 'Each');

INSERT INTO Ingredient 
(Name, Description, StockingUnit)
VALUES
('Green Pepper', '', 'Each');

INSERT INTO Ingredient 
(Name, Description, StockingUnit)
VALUES
('Hamburger', '', 'LBS');

INSERT INTO Ingredient 
(Name, Description, StockingUnit)
VALUES
('Chicken', '', 'LBS');

INSERT INTO Ingredient 
(Name, Description, StockingUnit)
VALUES
('Pork Chops', '', 'LBS');

INSERT INTO RecipeUser
(FirstName, LastName, Active)
VALUES
('Matthew', 'Wurdeman', 1);

INSERT INTO Recipe
(Name, Description, Source, Servings, PrepTime, TotalRecipeTime, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
VALUES
('Memphis Pulled Pork', 'A yummy Memphis styled BBQ crockpot recipe', 'Publix', '6', '30 minutes', '6 to 8 hours', CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, 1);

INSERT INTO Recipe
(Name, Description, Source, Servings, PrepTime, TotalRecipeTime, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
VALUES
('Cheeseburger', 'Good ole American food', 'Homemade', '6', '5 minutes', '15 minutes', CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, 1);

INSERT INTO Recipe
(Name, Description, Source, Servings, PrepTime, TotalRecipeTime, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
VALUES
('Breaded Tilapia', 'Quick and simpled baked Tilapia order that is full of tasts', 'Internet', '4', '10 minutes', '15 minutes', CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, 1);

INSERT INTO Recipe
(Name, Description, Source, Servings, PrepTime, TotalRecipeTime, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
VALUES
('Chicken Stir Fry', 'Healthly but still yummy!', 'Homemade', '5', '20 minutes', '10 minutes', CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, 1);

INSERT INTO RecipeDish
(RecipeID, DishID)
VALUES
(1, 3);

INSERT INTO RecipeDish
(RecipeID, DishID)
VALUES
(2, 2);

INSERT INTO RecipeDish
(RecipeID, DishID)
VALUES
(2, 3);

INSERT INTO RecipeDish
(RecipeID, DishID)
VALUES
(3, 3);

INSERT INTO RecipeDish
(RecipeID, DishID)
VALUES
(4, 3);

INSERT INTO RecipeStyle
(RecipeID, StyleID)
VALUES
(1, 1);

INSERT INTO RecipeStyle
(RecipeID, StyleID)
VALUES
(1, 6);

INSERT INTO RecipeStyle
(RecipeID, StyleID)
VALUES
(1, 8);

INSERT INTO RecipeStyle
(RecipeID, StyleID)
VALUES
(2, 6);

INSERT INTO RecipeStyle
(RecipeID, StyleID)
VALUES
(3, 7);

INSERT INTO RecipeStyle
(RecipeID, StyleID)
VALUES
(4, 2);

INSERT INTO RecipeCategory
(RecipeID, CategoryID)
VALUES
(1, 2);

INSERT INTO RecipeCategory
(RecipeID, CategoryID)
VALUES
(2, 8);

INSERT INTO RecipeCategory
(RecipeID, CategoryID)
VALUES
(3, 7);

INSERT INTO RecipeCategory
(RecipeID, CategoryID)
VALUES
(4, 1);

--SELECT FROM TABLES
SELECT * FROM dbo.RecipeUser
SELECT * FROM dbo.Recipe
SELECT * FROM dbo.Comment
SELECT * FROM dbo.Review
SELECT * FROM dbo.Ingredient
SELECT * FROM dbo.Style
SELECT * FROM dbo.Category
SELECT * FROM dbo.Dish
SELECT * FROM dbo.RecipeStep
SELECT * FROM dbo.RecipeIngredient
SELECT * FROM dbo.RecipeStepIngredient
SELECT * FROM dbo.RecipeCategory
SELECT * FROM dbo.RecipeDish
SELECT * FROM dbo.RecipeStyle