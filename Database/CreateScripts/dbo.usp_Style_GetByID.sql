SET ANSI_NULLS ON 
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = object_id(N'usp_Style_GetByID') AND TYPE IN (N'P', N'PC'))
BEGIN
	PRINT 'DROP Procedure - dbo.usp_Style_GetByID'
	DROP PROCEDURE [dbo].[usp_Style_GetByID]
END
GO

PRINT 'CREATE Procedure - dbo.usp_Style_GetByID'
GO

CREATE PROCEDURE [dbo].[usp_Style_GetByID]
(
	@StyleID int
)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT 
		StyleID,
		Name,
		Description
	FROM dbo.Style
	WHERE StyleID = @StyleID;

END
GO

PRINT 'GRANT EXECUTE to procedure - dbo.usp_Style_GetByID'
GRANT EXECUTE ON [dbo].[usp_Style_GetByID] TO RecipeHelperUser
GO