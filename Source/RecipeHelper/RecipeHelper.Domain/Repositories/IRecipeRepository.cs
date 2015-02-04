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
        IEnumerable<RecipeDish> GetRecipesByDishID(int dishID);
        IEnumerable<RecipeStyle> GetRecipesByStyleID(int styleID);
        IEnumerable<RecipeCategory> GetRecipesByCategoryID(int categoryID);
        Recipe GetRecipeByID(int recipeID);
        void AddRecipe(Recipe recipe);
        void UpdateRecipe(Recipe recipe);
        void DeleteRecipe(int recipeID);
    }
}
