using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeHelper.Domain.Repositories
{
    public interface IStyleRepository
    {
        IEnumerable<Style> GetAllStyles();
        Style GetStyleByID(int styleID);
        void AddStyle(Style style);
        void UpdatStyle(Style style);
        void DeleteStyle(int styleID);
    }
}
