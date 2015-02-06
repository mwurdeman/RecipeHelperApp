USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Style_Delete') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'DROP Procedure - usp_Style_Delete'
	DROP PROCEDURE [dbo].[usp_Style_Delete]
END 
GO

PRINT 'CREATE Procedure - usp_Style_Delete'
GO
CREATE PROCEDURE [dbo].[usp_Style_Delete]
(
	@StyleID INT
)
AS
BEGIN

	DELETE FROM dbo.Style
	WHERE StyleID = @StyleID;

END
GO

PRINT 'GRANT EXECUTE on procedure - usp_Style_Delete'
GRANT EXECUTE ON [dbo].[usp_Style_Delete] TO RecipeHelperUser
GO