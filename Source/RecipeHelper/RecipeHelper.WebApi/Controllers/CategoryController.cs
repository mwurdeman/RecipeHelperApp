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
        public HttpResponseMessage Post([FromBody]Category category)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    this._repository.AddCategory(category);
                    return Request.CreateResponse(HttpStatusCode.Created, category);
                }
                catch (Exception ex)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
                }
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }          
        }

        // PUT: api/Category/5
        public HttpResponseMessage Put(int id, [FromBody]Category category)
        {
            Category c = this._repository.GetCategoryByID(id);

            if (c == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Category object was not found");
            }
            else
            {
                c.Description = category.Description;
            }

            try
            {
                this._repository.UpdateCategory(c);
                return Request.CreateResponse(HttpStatusCode.OK, c);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }

        // DELETE: api/Category/5
        public HttpResponseMessage Delete(int id)
        {
            try
            {
                this._repository.DeleteCategory(id);
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            } 
        }
    }
}
