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

SET ANSI_PADDING OFF
GO


