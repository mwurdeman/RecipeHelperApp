using RecipeHelper.Domain;
using RecipeHelper.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeHelper.SqlRepository
{
    public class DishRepository : IDishRepository
    {
        //private database variable

        public DishRepository(string connectionString)
        {
            //init database variable
        }

        public IEnumerable<Dish> GetAllDishes()
        {
            throw new NotImplementedException();
        }

        public Dish GetDishByID(int dishID)
        {
            throw new NotImplementedException();
        }

        public void AddDish(Dish dish)
        {
            throw new NotImplementedException();
        }

        public void UpdateDish(Dish dish)
        {
            throw new NotImplementedException();
        }

        public void DeleteDish(int dishID)
        {
            throw new NotImplementedException();
        }
    }
}
