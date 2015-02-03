SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Dish_GetAll') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'Dropping Procedure - usp_Dish_GetAll'
	DROP PROCEDURE [dbo].[usp_Dish_GetAll];
END
GO

PRINT 'Creating Procedure - [dbo].[usp_Dish_GetAll]'
GO
CREATE PROCEDURE [dbo].[usp_Dish_GetAll]
AS
BEGIN

	SET NOCOUNT ON;

    Select DishID,
		Name,
		Description
	FROM dbo.Dish;

END
GO

PRINT 'Grant EXECUTE to procedure - [dbo].[usp_Dish_GetAll]'
GRANT EXECUTE ON dbo.usp_Dish_GetAll TO RecipeHelperUser;
GO