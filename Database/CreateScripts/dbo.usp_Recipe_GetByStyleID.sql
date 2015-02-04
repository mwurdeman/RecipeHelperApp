USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Recipe_GetByStyleID') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'DROP Procedure - dbo.usp_Recipe_GetByStyleID'
	DROP PROCEDURE [dbo].[usp_Recipe_GetByStyleID]
END
GO

PRINT 'CREATE Procedure - dbo.usp_Recipe_GetByStyleID'
GO

CREATE PROCEDURE [dbo].[usp_Recipe_GetByStyleID]
(
	@StyleID INT
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
		R.ModifiedDate,
		S.StyleID,
		S.Name,
		S.Description
	FROM Recipe R
		JOIN RecipeStyle RS ON R.RecipeID = RS.RecipeID
		JOIN Style S ON RS.StyleID = S.StyleID
	WHERE S.StyleID = @StyleID;

END
GO

PRINT 'GRANT Execute to Procedure - dbo.usp_Recipe_GetByStyleID'
GRANT EXECUTE on [dbo].[usp_Recipe_GetByStyleID] TO RecipeHelperUser