USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Style_Update') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'DROP Procedure - usp_Style_Update'
	DROP PROCEDURE [dbo].[usp_Style_Update]
END 
GO

PRINT 'CREATE Procedure - usp_Style_Update'
GO
CREATE PROCEDURE [dbo].[usp_Style_Update]
(
	@StyleID INT,
	@Description VARCHAR(250)
)
AS
BEGIN

	UPDATE Style
	SET Description = @Description
	WHERE StyleID = @StyleID;

END
GO

PRINT 'GRANT EXECUTE on procedure - usp_Style_Update'
GRANT EXECUTE ON [dbo].[usp_Style_Update] TO RecipeHelperUser
GO