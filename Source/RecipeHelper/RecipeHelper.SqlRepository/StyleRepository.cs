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
        //private database variable
        private Database _database;
        private readonly string USP_STYLE_GETALL = "usp_Style_GetAll";
        private readonly string USP_STYLE_GETBYID = "usp_Style_GetByID";

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
            throw new NotImplementedException();
        }

        public void UpdatStyle(Style style)
        {
            throw new NotImplementedException();
        }

        public void DeleteStyle(int styleID)
        {
            throw new NotImplementedException();
        }
    }
}
