SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Category_GetByID') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'Dropping Procedure - usp_Category_GetByID'
	DROP PROCEDURE [dbo].[usp_Category_GetByID];
END
GO

PRINT 'Creating Procedure - [dbo].[usp_Category_GetByID]'
GO
CREATE PROCEDURE usp_Category_GetByID
(	
	@CategoryID INT
)
AS
BEGIN

	SET NOCOUNT ON;

    Select CategoryID,
		Name,
		Description,
		CreatedBy,
		CreatedDate,
		ModifiedBy,
		ModifiedDate
	FROM dbo.Category
	WHERE CategoryID = @CategoryID;

END
GO

PRINT 'Grant EXECUTE to procedure - [dbo].[usp_Category_GetByID]'
GRANT EXECUTE ON dbo.usp_Category_GetByID TO RecipeHelperUser;
GO