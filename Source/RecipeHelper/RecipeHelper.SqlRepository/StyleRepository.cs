using RecipeHelper.Domain;
using RecipeHelper.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeHelper.SqlRepository
{
    public class StyleRepository : IStyleRepository
    {
        //private database variable

        public StyleRepository(string connectionString)
        {
            //init database variable
        }

        public IEnumerable<Style> GetAllStyles()
        {
            throw new NotImplementedException();
        }

        public Style GetStyleByID(int styleID)
        {
            throw new NotImplementedException();
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
