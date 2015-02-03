SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Dish_GetByID') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'Dropping Procedure - usp_Dish_GetByID'
	DROP PROCEDURE [dbo].[usp_Dish_GetByID];
END
GO

PRINT 'Creating Procedure - [dbo].[usp_Dish_GetByID]'
GO
CREATE PROCEDURE [dbo].[usp_Dish_GetByID]
(	
	@DishID INT
)
AS
BEGIN

	SET NOCOUNT ON;

    Select DishID,
		Name,
		Description
	FROM dbo.Dish
	WHERE DishID = @DishID;

END
GO

PRINT 'Grant EXECUTE to procedure - [dbo].[usp_Dish_GetByID]'
GRANT EXECUTE ON dbo.usp_Dish_GetByID TO RecipeHelperUser;
GO