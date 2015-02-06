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
    public class CategoryRepository : ICategoryRepository
    {
        private Database _database;
        private readonly string USP_CATEGORY_ALL = "usp_Category_GetAll";
        private readonly string USP_CATEGORY_GETBYID = "usp_Category_GetByID";
        private readonly string USP_CATEGORY_ADD = "usp_Category_Add";
        private readonly string USP_CATEGORY_UPDATE = "usp_Category_Update";
        private readonly string USP_CATEGORY_DELETE = "usp_Category_Delete";

        public CategoryRepository(string connectionString)
        {
            this._database = new SqlDatabase(connectionString);
        }

        public IEnumerable<Category> GetAllCategories()
        {
            List<Category> categories = new List<Category>();
            DbCommand cmd = this._database.GetStoredProcCommand(USP_CATEGORY_ALL);
            
            try 
            {
                IDataReader reader = this._database.ExecuteReader(cmd);

                while(reader.Read())
                {
                    Category category = new Category();
                    category.ID = reader.GetInt32("CategoryID");
                    category.Name = reader.GetString("Name");
                    category.Description = reader.GetString("Description");

                    categories.Add(category);
                }

                reader.Close();
            }
            catch
            {
                throw;
            }

            return categories;
        }

        public Category GetCategoryByID(int categoryID)
        {
            Category category = new Category();
            DbCommand cmd = this._database.GetStoredProcCommand(USP_CATEGORY_GETBYID);
            this._database.AddInParameter(cmd, "@CategoryID", DbType.Int32, categoryID);

            try
            {
                IDataReader reader = this._database.ExecuteReader(cmd);

                if(reader.Read())
                {
                    category.ID = reader.GetInt32("CategoryID");
                    category.Name = reader.GetString("Name");
                    category.Description = reader.GetString("Description");
                }

                reader.Close();
            }
            catch
            {
                throw;
            }

            return category;
        }

        public void AddCategory(Category category)
        {
            DbCommand cmd = this._database.GetStoredProcCommand(USP_CATEGORY_ADD);
            this._database.AddInParameter(cmd, "@Name", DbType.String, category.Name);
            this._database.AddInParameter(cmd, "@Description", DbType.String, category.Description);

            try
            {
                category.ID = (int)this._database.ExecuteScalar(cmd);
            }
            catch
            {
                throw;
            }
        }

        public void UpdateCategory(Category category)
        {
            DbCommand cmd = this._database.GetStoredProcCommand(USP_CATEGORY_UPDATE);
            this._database.AddInParameter(cmd, "@CategoryID", DbType.Int32, category.ID);
            this._database.AddInParameter(cmd, "@Description", DbType.String, category.Description);

            try
            {
                this._database.ExecuteNonQuery(cmd);
            }
            catch
            {
                throw;
            }
        }

        public void DeleteCategory(int categoryID)
        {
            DbCommand cmd = this._database.GetStoredProcCommand(USP_CATEGORY_DELETE);
            this._database.AddInParameter(cmd, "@CategoryID", DbType.Int32, categoryID);

            try
            {
                this._database.ExecuteNonQuery(cmd);
            }
            catch
            {
                throw;
            }
        }
    }
}
