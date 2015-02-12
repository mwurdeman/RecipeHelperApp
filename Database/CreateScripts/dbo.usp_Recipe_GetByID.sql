USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Recipe_GetByID') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'DROP Procedure - dbo.usp_Recipe_GetByID'
	DROP PROCEDURE [dbo].[usp_Recipe_GetByID]
END
GO

PRINT 'CREATE Procedure - dbo.usp_Recipe_GetByID'
GO

CREATE PROCEDURE [dbo].[usp_Recipe_GetByID]
(
	@RecipeID INT
)
AS
BEGIN

	SELECT 
		R.RecipeID,
		R.Name,
		R.Description,
		R.Source,
		R.Servings,
		R.PrepTime,
		R.TotalRecipeTime,
		R.CreatedDate,
		R.CreatedBy,
		R.ModifiedDate,
		R.ModifiedBy
	FROM Recipe R
	WHERE R.RecipeID = @RecipeID;

END
GO

PRINT 'GRANT Execute to Procedure - dbo.usp_Recipe_GetByID'
GRANT EXECUTE on [dbo].[usp_Recipe_GetByID] TO RecipeHelperUser
GO