using RecipeHelper.Domain;
using RecipeHelper.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace RecipeHelper.WebApi.Controllers
{
    public class StyleController : ApiController
    {
        private IStyleRepository _repository;

        public StyleController(IStyleRepository repository)
        {
            this._repository = repository;
        }

        // GET: api/Style
        public IEnumerable<Style> Get()
        {
            return _repository.GetAllStyles();
        }

        // GET: api/Style/5
        public Style Get(int id)
        {
            return _repository.GetStyleByID(id);
        }

        // POST: api/Style
        public void Post([FromBody]Style style)
        {
            //TODO: Add Validation of Style?
            _repository.AddStyle(style);
        }

        // PUT: api/Style/5
        public void Put(int id, [FromBody]Style style)
        {
            //TODO: Get Style first and then Update
            _repository.UpdatStyle(style);
        }

        // DELETE: api/Style/5
        public void Delete(int id)
        {
            //TODO: Check to see if style exists first
            _repository.DeleteStyle(id);
        }
    }
}
