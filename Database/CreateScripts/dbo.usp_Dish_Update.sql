USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Dish_Update') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'DROP Procedure - usp_Dish_Update'
	DROP PROCEDURE [dbo].[usp_Dish_Update]
END 
GO

PRINT 'CREATE Procedure - usp_Dish_Update'
GO
CREATE PROCEDURE [dbo].[usp_Dish_Update]
(
	@DishID INT,
	@Description VARCHAR(250)
)
AS
BEGIN

	UPDATE Dish
	SET Description = @Description
	WHERE DishID = @DishID;

END
GO

PRINT 'GRANT EXECUTE on procedure - usp_Dish_Update'
GRANT EXECUTE ON [dbo].[usp_Dish_Update] TO RecipeHelperUser
GO