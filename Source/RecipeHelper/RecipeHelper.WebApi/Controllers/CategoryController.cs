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
    public class CategoryController : ApiController
    {
        private ICategoryRepository _repository;

        public CategoryController(ICategoryRepository repository)
        {
            this._repository = repository;
        }

        // GET: api/Category
        public IEnumerable<Category> Get()
        {
            return this._repository.GetAllCategories();
        }

        // GET: api/Category/5
        public Category Get(int id)
        {
            return this._repository.GetCategoryByID(id);
        }

        // POST: api/Category
        public void Post([FromBody]Category category)
        {
            this._repository.AddCategory(category);
        }

        // PUT: api/Category/5
        public void Put(int id, [FromBody]Category category)
        {
            this._repository.UpdateCategory(category);
        }

        // DELETE: api/Category/5
        public void Delete(int id)
        {
            this._repository.DeleteCategory(id);
        }
    }
}
