USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
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

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[RecipeStep]  WITH CHECK ADD  CONSTRAINT [FK_RecipeStep_Recipe] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipe] ([RecipeID])
GO

ALTER TABLE [dbo].[RecipeStep] CHECK CONSTRAINT [FK_RecipeStep_Recipe]
GO


