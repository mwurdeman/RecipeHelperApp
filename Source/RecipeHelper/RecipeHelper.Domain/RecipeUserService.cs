using RecipeHelper.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeHelper.Domain
{
    public class RecipeUserService
    {
        private IRecipeUserRepository _repository;

        public RecipeUserService(IRecipeUserRepository repository)
        {
            this._repository = repository;
        }

        public RecipeUser GetRecipeUserByID (int recipeUserID)
        {
            return this._repository.GetRecipeUserByID(recipeUserID);
        }
    }
}
