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
    public class RecipeCategoryController : ApiController
    {
        private IRecipeRepository _repository;

        public RecipeCategoryController(IRecipeRepository repository)
        {
            this._repository = repository;
        }

        public RecipeCategory Get(int id)
        {
            return _repository.GetRecipesByCategoryID(id);
        }
    }
}
