SELECT * FROM dbo.Recipe
SELECT * FROM dbo.Ingredient
SELECT * FROM dbo.Style
SELECT * FROM dbo.Category
SELECT * FROM dbo.Dish
SELECT * FROM dbo.RecipeStep
SELECT * FROM dbo.RecipeIngredient
SELECT * FROM dbo.RecipeStepIngredient
SELECT * FROM dbo.RecipeCategory
SELECT * FROM dbo.RecipeDish
SELECT * FROM dbo.RecipeStyle
SELECT * FROM dbo.RecipeUser

SELECT 
	R.RecipeID,
	R.Name as 'RecipeName',
	R.Description as 'RecipeDescription',
	R.Source,
	R.Servings,
	R.PrepTime,
	R.TotalRecipeTime,
	R.CreatedDate,
	R.ModifiedDate,
	S.StyleID,
	S.Name as 'StyleName',
	S.Description as 'StyleDescription'
FROM Recipe R
	JOIN RecipeStyle RS ON R.RecipeID = RS.RecipeID
	JOIN Style S ON RS.StyleID = S.StyleID
WHERE S.StyleID = 1

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
	D.DishID,
	D.Name,
	D.Description
FROM Recipe R
	JOIN RecipeDish RD ON R.RecipeID = RD.RecipeID
	JOIN Dish D ON RD.DishID = D.DishID
WHERE D.DishID = 3

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
WHERE C.CategoryID = 2

SELECT D.DishID
	, D.Name
	, D.Description
FROM Dish D
	JOIN RecipeDish RD ON D.DishID = RD.DishID
WHERE RD.RecipeID = 2