USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Recipe_GetByDishID') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'DROP Procedure - dbo.usp_Recipe_GetByDishID'
	DROP PROCEDURE [dbo].[usp_Recipe_GetByDishID]
END
GO

PRINT 'CREATE Procedure - dbo.usp_Recipe_GetByDishID'
GO

CREATE PROCEDURE [dbo].[usp_Recipe_GetByDishID]
(
	@DishID INT
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
		R.ModifiedBy,
		D.DishID,
		D.Name as 'DishName',
		D.Description as 'DishDescription'
	FROM Recipe R
		JOIN RecipeDish RD ON R.RecipeID = RD.RecipeID
		JOIN Dish D ON RD.DishID = D.DishID
	WHERE D.DishID = @DishID;

END
GO

PRINT 'GRANT Execute to Procedure - dbo.usp_Recipe_GetByDishID'
GRANT EXECUTE on [dbo].[usp_Recipe_GetByDishID] TO RecipeHelperUser