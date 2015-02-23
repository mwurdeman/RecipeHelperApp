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
    public class DishRepository : IDishRepository
    {
        private Database _database;
        private readonly string USP_DISH_GETALL = "usp_Dish_GetAll";
        private readonly string USP_DISH_GETBYID = "usp_Dish_GetByID";
        private readonly string USP_DISH_GETBYRECIPEID = "usp_Dish_GetByRecipeID";
        private readonly string USP_DISH_ADD = "usp_Dish_Add";
        private readonly string USP_DISH_UPDATE = "usp_Dish_Update";
        private readonly string USP_DISH_DELETE = "usp_Dish_Delete";

        public DishRepository(string connectionString)
        {
            this._database = new SqlDatabase(connectionString);
        }

        public IEnumerable<Dish> GetAllDishes()
        {
            List<Dish> dishes = new List<Dish>();
            DbCommand cmd = this._database.GetStoredProcCommand(USP_DISH_GETALL);

            try 
            {
                IDataReader reader = _database.ExecuteReader(cmd);

                while (reader.Read())
                {
                    Dish dish = this.BuildDishObjectFromReader(reader);
                    dishes.Add(dish);
                }

                reader.Close();
            }
            catch
            {
                throw;
            }

            return dishes;
        }

        public IEnumerable<Dish> GetDishesByRecipeID(int recipeID)
        {
            List<Dish> dishes = new List<Dish>();
            DbCommand cmd = this._database.GetStoredProcCommand(USP_DISH_GETBYRECIPEID);

            try
            {
                IDataReader reader = this._database.ExecuteReader(cmd);

                while(reader.Read())
                {
                    Dish dish = this.BuildDishObjectFromReader(reader);
                    dishes.Add(dish);
                }

                reader.Close();
            }
            catch
            {
                throw;
            }

            return dishes;
        }

        public Dish GetDishByID(int dishID)
        {
            Dish dish = null;
            DbCommand cmd = this._database.GetStoredProcCommand(USP_DISH_GETBYID);
            _database.AddInParameter(cmd, "@DishID", DbType.Int32, dishID);

            try
            {
                IDataReader reader = _database.ExecuteReader(cmd);

                if (reader.Read())
                {
                    dish = this.BuildDishObjectFromReader(reader);
                }

                reader.Close();
            }
            catch
            {
                throw;
            }

            return dish;
        }

        public void AddDish(Dish dish)
        {
            DbCommand cmd = this._database.GetStoredProcCommand(USP_DISH_ADD);
            this._database.AddInParameter(cmd, "@Name", DbType.String, dish.Name);
            this._database.AddInParameter(cmd, "@Description", DbType.String, dish.Description);

            try
            {
                dish.ID = (int)this._database.ExecuteScalar(cmd);
            }
            catch
            {
                throw;
            }
        }

        public void UpdateDish(Dish dish)
        {
            DbCommand cmd = this._database.GetStoredProcCommand(USP_DISH_UPDATE);
            this._database.AddInParameter(cmd, "@DishID", DbType.Int32, dish.ID);
            this._database.AddInParameter(cmd, "@Description", DbType.String, dish.Description);

            try
            {
                this._database.ExecuteNonQuery(cmd);
            }
            catch
            {
                throw;
            }
        }

        public void DeleteDish(int dishID)
        {
            DbCommand cmd = this._database.GetStoredProcCommand(USP_DISH_DELETE);
            this._database.AddInParameter(cmd, "@DishID", DbType.Int32, dishID);
           
            try
            {
                this._database.ExecuteNonQuery(cmd);
            }
            catch
            {
                throw;
            }
        }

        private Dish BuildDishObjectFromReader(IDataReader reader)
        {
            Dish dish = new Dish();
            dish.ID = reader.GetInt32("DishID");
            dish.Name = reader.GetString("Name");
            dish.Description = reader.GetString("Description");
            dish.CreatedBy = reader.GetInt32("CreatedBy");
            dish.CreatedDate = reader.GetDateTime("CreatedDate");
            dish.ModifiedBy = reader.GetInt32("ModifiedBy");
            dish.ModifiedDate = reader.GetDateTime("ModifiedDate");

            return dish;
        }
    }
}
