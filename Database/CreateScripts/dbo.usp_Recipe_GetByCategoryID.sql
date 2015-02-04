USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Recipe_GetByCategoryID') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'DROP Procedure - dbo.usp_Recipe_GetByCategoryID'
	DROP PROCEDURE [dbo].[usp_Recipe_GetByCategoryID]
END
GO

PRINT 'CREATE Procedure - dbo.usp_Recipe_GetByCategoryID'
GO

CREATE PROCEDURE [dbo].[usp_Recipe_GetByCategoryID]
(
	@CategoryID INT
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
		C.CategoryID,
		C.Name,
		C.Description
	FROM Recipe R
		JOIN RecipeCategory RC ON R.RecipeID = RC.RecipeID
		JOIN Category C ON RC.CategoryID = C.CategoryID
	WHERE C.CategoryID = @CategoryID;

END
GO

PRINT 'GRANT Execute to Procedure - dbo.usp_Recipe_GetByCategoryID'
GRANT EXECUTE on [dbo].[usp_Recipe_GetByCategoryID] TO RecipeHelperUser