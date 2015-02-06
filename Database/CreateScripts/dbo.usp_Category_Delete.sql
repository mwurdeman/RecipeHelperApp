USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Category_Delete') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'DROP Procedure - usp_Category_Delete'
	DROP PROCEDURE [dbo].[usp_Category_Delete]
END 
GO

PRINT 'CREATE Procedure - usp_Category_Delete'
GO
CREATE PROCEDURE [dbo].[usp_Category_Delete]
(
	@CategoryID INT
)
AS
BEGIN

	DELETE FROM dbo.Category
	WHERE CategoryID = @CategoryID;

END
GO

PRINT 'GRANT EXECUTE on procedure - usp_Category_Delete'
GRANT EXECUTE ON [dbo].[usp_Category_Delete] TO RecipeHelperUser
GO