using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeHelper.Domain.Repositories
{
    public interface IRecipeGroupsRepository
    {
        IEnumerable<RecipeDish> GetRecipesByDishID(int dishID);
        IEnumerable<RecipeStyle> GetRecipesByStyleID(int styleID);
        IEnumerable<RecipeCategory> GetRecipesByCategoryID(int categoryID);
    }
}
