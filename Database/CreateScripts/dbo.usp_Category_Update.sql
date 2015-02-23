USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Category_Update') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'DROP Procedure - usp_Category_Update'
	DROP PROCEDURE [dbo].[usp_Category_Update]
END 
GO

PRINT 'CREATE Procedure - usp_Category_Update'
GO
CREATE PROCEDURE [dbo].[usp_Category_Update]
(
	@CategoryID INT,
	@Description VARCHAR(250),
	@RecipeUserID INT
)
AS
BEGIN

	UPDATE Category
	SET Description = @Description
		, ModifiedBy = @RecipeUserID
		, ModifiedDate = CURRENT_TIMESTAMP
	WHERE CategoryID = @CategoryID;

END
GO

PRINT 'GRANT EXECUTE on procedure - usp_Category_Update'
GRANT EXECUTE ON [dbo].[usp_Category_Update] TO RecipeHelperUser
GO