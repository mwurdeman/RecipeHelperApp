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
    public class StyleRepository : IStyleRepository
    {
        private Database _database;
        private readonly string USP_STYLE_GETALL = "usp_Style_GetAll";
        private readonly string USP_STYLE_GETBYID = "usp_Style_GetByID";
        private readonly string USP_STYLE_GETBYRECIPEID = "usp_Style_GetByRecipeID";
        private readonly string USP_STYLE_ADD = "usp_Style_Add";
        private readonly string USP_STYLE_UPDATE = "usp_Style_Update";
        private readonly string USP_STYLE_DELETE = "usp_Style_Delete";

        public StyleRepository(string connectionString)
        {
            this._database = new SqlDatabase(connectionString);
        }

        public IEnumerable<Style> GetAllStyles()
        {
            List<Style> styles = new List<Style>();
            DbCommand cmd = this._database.GetStoredProcCommand(USP_STYLE_GETALL);

            try
            {
                IDataReader reader = this._database.ExecuteReader(cmd);

                while(reader.Read())
                {
                    Style style = new Style();
                    style.ID = reader.GetInt32("StyleID");
                    style.Name = reader.GetString("Name");
                    style.Description = reader.GetString("Description");

                    styles.Add(style);
                }

                reader.Close();
            }
            catch
            {
                throw;
            }

            return styles;
        }

        public IEnumerable<Style> GetStylesByRecipeID(int recipeID)
        {
            List<Style> styles = new List<Style>();
            DbCommand cmd = this._database.GetStoredProcCommand(USP_STYLE_GETBYRECIPEID);
            this._database.AddInParameter(cmd, "@RecipeID", DbType.Int32, recipeID);

            try
            {
                IDataReader reader = this._database.ExecuteReader(cmd);

                while(reader.Read())
                {
                    Style style = new Style();
                    style.ID = reader.GetInt32("StyleID");
                    style.Name = reader.GetString("Name");
                    style.Description = reader.GetString("Description");

                    styles.Add(style);
                }

                reader.Close();
            }
            catch
            {
                throw;
            }

            return styles;
        }

        public Style GetStyleByID(int styleID)
        {
            Style style = null;
            DbCommand cmd = this._database.GetStoredProcCommand(USP_STYLE_GETBYID);
            this._database.AddInParameter(cmd, "@StyleID", DbType.Int32, styleID);

            try
            {
                IDataReader reader = _database.ExecuteReader(cmd);

                if(reader.Read())
                {
                    style.ID = reader.GetInt32("StyleID");
                    style.Name = reader.GetString("Name");
                    style.Description = reader.GetString("Description");
                }

                reader.Close();
            }
            catch
            {
                throw;
            }

            return style;
        }

        public void AddStyle(Style style)
        {
            DbCommand cmd = this._database.GetStoredProcCommand(USP_STYLE_ADD);
            this._database.AddInParameter(cmd, "@Name", DbType.String, style.Name);
            this._database.AddInParameter(cmd, "@Description", DbType.String, style.Description);

            try
            {
                style.ID = (int)this._database.ExecuteScalar(cmd);
            }
            catch
            {
                throw;
            }
        }

        public void UpdatStyle(Style style)
        {
            DbCommand cmd = this._database.GetStoredProcCommand(USP_STYLE_UPDATE);
            this._database.AddInParameter(cmd, "@StyleID", DbType.Int32, style.ID);
            this._database.AddInParameter(cmd, "@Description", DbType.String, style.Description);

            try
            {
                this._database.ExecuteNonQuery(cmd);
            }
            catch
            {
                throw;
            }
        }

        public void DeleteStyle(int styleID)
        {
            DbCommand cmd = this._database.GetStoredProcCommand(USP_STYLE_DELETE);
            this._database.AddInParameter(cmd, "@StyleID", DbType.Int32, styleID);

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
