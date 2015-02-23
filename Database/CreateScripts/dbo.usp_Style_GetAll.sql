SET ANSI_NULLS ON 
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = object_id(N'usp_Style_GetAll') AND TYPE IN (N'P', N'PC'))
BEGIN
	PRINT 'DROP Procedure - dbo.usp_Style_GetAll'
	DROP PROCEDURE [dbo].[usp_Style_GetAll]
END
GO

PRINT 'CREATE Procedure - dbo.usp_Style_GetAll'
GO

CREATE PROCEDURE [dbo].[usp_Style_GetAll]
AS
BEGIN

	SET NOCOUNT ON;

	SELECT 
		StyleID,
		Name,
		Description,
		CreatedBy,
		CreatedDate,
		ModifiedBy,
		ModifiedDate
	FROM dbo.Style;

END
GO

PRINT 'GRANT EXECUTE to procedure - dbo.usp_Style_GetAll'
GRANT EXECUTE ON [dbo].[usp_Style_GetAll] TO RecipeHelperUser
GO