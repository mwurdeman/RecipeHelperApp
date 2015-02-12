using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using RecipeHelper.Domain;
using RecipeHelper.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeHelper.SqlRepository
{
    public class RecipeRepository : IRecipeRepository
    {
        private Database _database;
        private readonly string USP_RECIPE_GETALL = "usp_Recipe_GetAll";
        private readonly string USP_RECIPE_GETBYID = "usp_Recipe_GetByID";
        private readonly string USP_RECIPE_GETBYDISHID = "usp_Recipe_GetByDishID";
        private readonly string USP_RECIPE_GETBYSTYLEID = "usp_Recipe_GetByStyleID";
        private readonly string USP_RECIPE_GETBYCATEGORYID = "usp_Recipe_GetByCategoryID";
        
        public RecipeRepository(string connectionString)
        {
            _database = new SqlDatabase(connectionString);
        }

        public IEnumerable<Recipe> GetAllRecipes()
        {
            List<Recipe> recipes = new List<Recipe>();
            DbCommand cmd = this._database.GetStoredProcCommand(USP_RECIPE_GETALL);

            try
            {
                IDataReader reader = this._database.ExecuteReader(cmd);

                while(reader.Read())
                {
                    Recipe recipe = this.BuildRecipeObjectFromReader(reader);
                    recipes.Add(recipe);
                }

                reader.Close();
            }
            catch
            {
                throw;
            }

            return recipes;
        }

        public Recipe GetRecipeByID(int recipeID)
        {
            Recipe recipe = null;
            DbCommand cmd = this._database.GetStoredProcCommand(USP_RECIPE_GETBYID);

            try
            {
                IDataReader reader = this._database.ExecuteReader(cmd);

                if(reader.Read())
                {
                    recipe = this.BuildRecipeObjectFromReader(reader);
                }

                reader.Close();
            }
            catch
            {
                throw;
            }


            return recipe;
        }

        public RecipeDish GetRecipesByDishID(int dishID)
        {
            RecipeDish recipeDish = null;
            DbCommand cmd = this._database.GetStoredProcCommand(USP_RECIPE_GETBYDISHID);
            this._database.AddInParameter(cmd, "@DishID", DbType.Int32, dishID);

            try
            {
                IDataReader reader = this._database.ExecuteReader(cmd);
                List<Recipe> recipes = new List<Recipe>();

                while(reader.Read())
                {
                    if (recipeDish == null)
                    {
                        recipeDish = new RecipeDish();
                        
                        Dish dish = new Dish();
                        dish.ID = reader.GetInt32("DishID");
                        dish.Name = reader.GetString("DishName");
                        dish.Description = reader.GetString("DishDescription");

                        recipeDish.Dish = dish;
                    }

                    recipes.Add(this.BuildRecipeObjectFromReader(reader));
                }

                recipeDish.Recipes = recipes;
                reader.Close();
            }
            catch
            {
                throw;
            }

            return recipeDish;
        }

        public RecipeStyle GetRecipesByStyleID(int styleID)
        {
            RecipeStyle recipeStyle = null;
            DbCommand cmd = this._database.GetStoredProcCommand(USP_RECIPE_GETBYSTYLEID);
            this._database.AddInParameter(cmd, "@StyleID", DbType.Int32, styleID);

            try
            {
                IDataReader reader = _database.ExecuteReader(cmd);
                List<Recipe> recipes = new List<Recipe>();
                
                while(reader.Read())
                {
                    if (recipeStyle == null)
                    {
                        recipeStyle = new RecipeStyle();

                        recipeStyle.Style = new Style();
                        recipeStyle.Style.ID = reader.GetInt32("StyleID");
                        recipeStyle.Style.Name = reader.GetString("StyleName");
                        recipeStyle.Style.Description = reader.GetString("StyleDescription");
                    }

                    recipes.Add(BuildRecipeObjectFromReader(reader));
                }

                recipeStyle.Recipes = recipes;
                reader.Close();
            }
            catch
            {
                throw;
            }
           
            return recipeStyle;
        }

        public RecipeCategory GetRecipesByCategoryID(int categoryID)
        {
            RecipeCategory recipeCategory = null;
            DbCommand cmd = this._database.GetStoredProcCommand(USP_RECIPE_GETBYCATEGORYID);
            this._database.AddInParameter(cmd, "@CategoryID", DbType.Int32, categoryID);
            
            try
            {
                IDataReader reader = this._database.ExecuteReader(cmd);
                List<Recipe> recipes = new List<Recipe>();

                while(reader.Read())
                {
                    if (recipeCategory == null)
                    {
                        recipeCategory = new RecipeCategory();

                        recipeCategory.Category = new Category();
                        recipeCategory.Category.ID = reader.GetInt32("CategoryID");
                        recipeCategory.Category.Name = reader.GetString("CategoryName");
                        recipeCategory.Category.Description = reader.GetString("CategoryDescription");
                    }

                    recipes.Add(BuildRecipeObjectFromReader(reader));
                }

                recipeCategory.Recipes = recipes;
                reader.Close();
            }
            catch
            {
                throw;
            }

            return recipeCategory;
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

        private Recipe BuildRecipeObjectFromReader(IDataReader reader)
        {
            Recipe recipe = new Recipe();

            recipe.ID = reader.GetInt32("RecipeID");
            recipe.Name = reader.GetString("Name");
            recipe.Description = reader.GetString("Description");
            recipe.Source = reader.GetString("Source");
            recipe.Servings = reader.GetString("Servings");
            recipe.PrepTime = reader.GetString("Preptime");
            recipe.TotalRecipeTime = reader.GetString("TotalRecipeTime");
            recipe.CreatedDate = reader.GetDateTime("CreatedDate");
            recipe.CreatedBy = reader.GetInt32("CreatedBy");
            recipe.ModifiedDate = reader.GetDateTime("ModifiedDate");
            recipe.ModifiedBy = reader.GetInt32("ModifiedBy");

            return recipe;
        }
    }
}
