USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Dish_Delete') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'DROP Procedure - usp_Dish_Delete'
	DROP PROCEDURE [dbo].[usp_Dish_Delete]
END 
GO

PRINT 'CREATE Procedure - usp_Dish_Delete'
GO
CREATE PROCEDURE [dbo].[usp_Dish_Delete]
(
	@DishID INT
)
AS
BEGIN

	DELETE FROM dbo.Dish
	WHERE DishID = @DishID;

END
GO

PRINT 'GRANT EXECUTE on procedure - usp_Dish_Delete'
GRANT EXECUTE ON [dbo].[usp_Dish_Delete] TO RecipeHelperUser
GO