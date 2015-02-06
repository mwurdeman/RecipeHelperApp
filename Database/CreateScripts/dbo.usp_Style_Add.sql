USE [RecipeHelper]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT object_id FROM sys.objects WHERE object_id = OBJECT_ID(N'usp_Style_Add') AND type IN (N'P', N'PC'))
BEGIN
	PRINT 'DROP Procedure - usp_Style_Add'
	DROP PROCEDURE [dbo].[usp_Style_Add]
END 
GO

PRINT 'CREATE Procedure - usp_Style_Add'
GO
CREATE PROCEDURE [dbo].[usp_Style_Add]
(
	@Name VARCHAR(150),
	@Description VARCHAR(250)
)
AS
BEGIN

	INSERT INTO dbo.Style
	(Name, Description)
	VALUES
	(@Name, @Description);

	SELECT CONVERT(int, SCOPE_IDENTITY());

END
GO

PRINT 'GRANT EXECUTE on procedure - usp_Style_Add'
GRANT EXECUTE ON [dbo].[usp_Style_Add] TO RecipeHelperUser
GO