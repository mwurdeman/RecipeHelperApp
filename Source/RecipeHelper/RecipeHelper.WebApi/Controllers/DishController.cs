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
    public class DishController : ApiController
    {
        private IDishRepository _repository;

        public DishController(IDishRepository repository)
        {
            this._repository = repository;
        }
        
        // GET: api/Dish
        public IEnumerable<Dish> Get()
        {
            return this._repository.GetAllDishes();
        }

        // GET: api/Dish/5
        public Dish Get(int id)
        {
            return this._repository.GetDishByID(id);
        }

        // POST: api/Dish
        public HttpResponseMessage Post([FromBody]Dish dish)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    this._repository.AddDish(dish);
                    return Request.CreateResponse(HttpStatusCode.Created, dish);
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

        // PUT: api/Dish/5
        public HttpResponseMessage Put(int id, [FromBody]Dish dish)
        {
            Dish d = this._repository.GetDishByID(id);

            if (d == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Category object was not found");
            }
            else
            {
                d.Description = dish.Description;
            }

            try
            {
                this._repository.UpdateDish(d);
                return Request.CreateResponse(HttpStatusCode.OK, d);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }

        // DELETE: api/Dish/5
        public HttpResponseMessage Delete(int id)
        {
            try
            {
                this._repository.DeleteDish(id);
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            } 
        }
    }
}
