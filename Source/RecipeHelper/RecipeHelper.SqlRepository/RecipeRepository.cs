using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using RecipeHelper.Domain;
using RecipeHelper.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeHelper.SqlRepository
{
    public class RecipeRepository : IRecipeRepository
    {
        private Database _database;
        
        public RecipeRepository(string connectionString)
        {
            _database = new SqlDatabase(connectionString);
        }

        public IEnumerable<Recipe> GetAllRecipes()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<RecipeDish> GetRecipesByDishID(int dishID)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<RecipeStyle> GetRecipesByStyleID(int styleID)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<RecipeCategory> GetRecipesByCategoryID(int categoryID)
        {
            throw new NotImplementedException();
        }

        public Recipe GetRecipeByID(int recipeID)
        {
            throw new NotImplementedException();
        }

        public void AddRecipe(Recipe recipe)
        {
            throw new NotImplementedException();
        }

        public void UpdateRecipe(Recipe recipe)
        {
            throw new NotImplementedException();
        }

        public void DeleteRecipe(int recipeID)
        {
            throw new NotImplementedException();
        }
    }
}
