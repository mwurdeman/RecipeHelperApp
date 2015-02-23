USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Description] [varchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[RecipeUser] ([RecipeUserID])
GO

ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_CreatedBy]
GO

ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[RecipeUser] ([RecipeUserID])
GO

ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_ModifiedBy]
GO


