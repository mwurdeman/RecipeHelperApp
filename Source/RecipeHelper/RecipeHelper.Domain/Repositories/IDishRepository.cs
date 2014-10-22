using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeHelper.Domain.Repositories
{
    public interface IDishRepository
    {
        IEnumerable<Dish> GetAllDishes();
        Dish GetDishByID(int dishID);
        void AddDish(Dish dish);
        void UpdateDish(Dish dish);
        void DeleteDish(int dishID);
    }
}
