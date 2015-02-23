USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Category_Add') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'DROP Procedure - usp_Category_Add'
	DROP PROCEDURE [dbo].[usp_Category_Add]
END 
GO

PRINT 'CREATE Procedure - usp_Category_Add'
GO
CREATE PROCEDURE [dbo].[usp_Category_Add]
(
	@Name VARCHAR(150),
	@Description VARCHAR(250),
	@RecipeUserID INT
)
AS
BEGIN

	INSERT INTO dbo.Category
	(Name, Description, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate)
	VALUES
	(@Name, @Description, @RecipeUserID, CURRENT_TIMESTAMP, @RecipeUserID, CURRENT_TIMESTAMP);

	SELECT CONVERT(int, SCOPE_IDENTITY());

END
GO

PRINT 'GRANT EXECUTE on procedure - usp_Category_Add'
GRANT EXECUTE ON [dbo].[usp_Category_Add] TO RecipeHelperUser
GO