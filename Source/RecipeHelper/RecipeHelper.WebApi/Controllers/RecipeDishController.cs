using RecipeHelper.Domain;
using RecipeHelper.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace RecipeHelper.WebApi.Controllers
{
    public class RecipeDishController : ApiController
    {
        private IRecipeRepository _repository;

        public RecipeDishController(IRecipeRepository repository)
        {
            this._repository = repository;
        }

        public RecipeDish Get(int id)
        {
            return this._repository.GetRecipesByDishID(id);
        }
    }
}
