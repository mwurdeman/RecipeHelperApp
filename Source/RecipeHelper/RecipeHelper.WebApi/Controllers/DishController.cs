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
        public void Post([FromBody]Dish dish)
        {
            this._repository.AddDish(dish);
        }

        // PUT: api/Dish/5
        public void Put(int id, [FromBody]Dish dish)
        {
            this._repository.UpdateDish(dish);
        }

        // DELETE: api/Dish/5
        public void Delete(int id)
        {
            this._repository.DeleteDish(id);
        }
    }
}
