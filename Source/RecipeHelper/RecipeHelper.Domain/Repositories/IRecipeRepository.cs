using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeHelper.Domain.Repositories
{
    public interface IRecipeRepository
    {
        IEnumerable<Recipe> GetAllRecipes();
        Recipe GetRecipeByID(int recipeID);
        RecipeDish GetRecipesByDishID(int dishID);
        RecipeStyle GetRecipesByStyleID(int styleID);
        RecipeCategory GetRecipesByCategoryID(int categoryID);
        void AddRecipe(Recipe recipe);
        void UpdateRecipe(Recipe recipe);
        void DeleteRecipe(int recipeID);
    }
}
