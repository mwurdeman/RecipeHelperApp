using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeHelper.Domain.Repositories
{
    public interface IRecipeUserRepository
    {
        RecipeUser GetRecipeUserByID(int recipeUserID);
        void AddRecipeUser(RecipeUser recipeUser);
        void UpdateRecipeUser(RecipeUser recipeUser);
    }
}
