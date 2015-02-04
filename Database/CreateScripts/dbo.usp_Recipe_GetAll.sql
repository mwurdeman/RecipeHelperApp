USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Recipe_GetAll') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'DROP Procedure - dbo.usp_Recipe_GetAll'
	DROP PROCEDURE [dbo].[usp_Recipe_GetAll]
END
GO

PRINT 'CREATE Procedure - dbo.usp_Recipe_GetAll'
GO

CREATE PROCEDURE [dbo].[usp_Recipe_GetAll]
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
		R.ModifiedDate
	FROM Recipe R;

END
GO

PRINT 'GRANT Execute to Procedure - dbo.usp_Recipe_GetAll'
GRANT EXECUTE on [dbo].[usp_Recipe_GetAll] TO RecipeHelperUser