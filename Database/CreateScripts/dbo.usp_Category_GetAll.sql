SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Category_GetAll') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'Dropping Procedure - usp_Category_GetAll'
	DROP PROCEDURE [dbo].[usp_Category_GetAll];
END
GO

PRINT 'Creating Procedure - [dbo].[usp_Category_GetAll]'
GO
CREATE PROCEDURE usp_Category_GetAll
AS
BEGIN

	SET NOCOUNT ON;

    Select CategoryID,
		Name,
		Description
	FROM dbo.Category;

END
GO

PRINT 'Grant EXECUTE to procedure - [dbo].[usp_Category_GetAll]'
GRANT EXECUTE ON dbo.usp_Category_GetAll TO RecipeHelperUser;
GO