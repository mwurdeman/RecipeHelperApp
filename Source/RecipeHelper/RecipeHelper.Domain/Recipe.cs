using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeHelper.Domain
{
    public class Recipe
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Source { get; set; }
        public string Servings { get; set; }
        public string PrepTime { get; set; }
        public string TotalRecipeTime { get; set; }
        public DateTime CreatedDate { get; set; }
        public int CreatedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public int ModifiedBy { get; set; }

        public IEnumerable<Style> RecipeStyles { get; set; }
        public IEnumerable<Dish> RecipeDishes { get; set; }
        public IEnumerable<Category> RecipeCategories { get; set; }
    }
}
