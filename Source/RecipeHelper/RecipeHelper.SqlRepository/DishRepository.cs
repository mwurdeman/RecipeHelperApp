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
        //private database variable
        private Database _database;
        private readonly string USP_DISH_GETALL = "usp_Dish_GetAll";
        private readonly string USP_DISH_GETBYID = "usp_Dish_GetByID";

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
                    Dish dish = new Dish();
                    dish.ID = reader.GetInt32("DishID");
                    dish.Name = reader.GetString("Name");
                    dish.Description = reader.GetString("Description");

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
                    dish = new Dish();
                    dish.ID = reader.GetInt32("DishID");
                    dish.Name = reader.GetString("Name");
                    dish.Description = reader.GetString("Description");
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
