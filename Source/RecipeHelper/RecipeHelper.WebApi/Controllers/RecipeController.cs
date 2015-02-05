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
    public class RecipeController : ApiController
    {
        private IRecipeRepository _repository;

        public RecipeController(IRecipeRepository repository)
        {
            this._repository = repository;
        }

        // GET: api/Recipe
        public IEnumerable<Recipe> Get()
        {
            return this._repository.GetAllRecipes();
        }

        // GET: api/Recipe/5
        public Recipe Get(int id)
        {
            return this._repository.GetRecipeByID(id);
        }

        // POST: api/Recipe
        public void Post([FromBody]Recipe value)
        {
        }

        // PUT: api/Recipe/5
        public void Put(int id, [FromBody]Recipe value)
        {
        }

        // DELETE: api/Recipe/5
        public void Delete(int id)
        {
        }
    }
}
