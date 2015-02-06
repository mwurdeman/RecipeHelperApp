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
        public HttpResponseMessage Post([FromBody]Style style)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    this._repository.AddStyle(style);
                    return Request.CreateResponse(HttpStatusCode.Created, style);
                }
                catch (Exception ex)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
                }
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            } 
        }

        // PUT: api/Style/5
        public HttpResponseMessage Put(int id, [FromBody]Style style)
        {
            Style s = this._repository.GetStyleByID(id);

            if (s == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Category object was not found");
            }
            else
            {
                s.Description = style.Description;
            }

            try
            {
                this._repository.UpdatStyle(s);
                return Request.CreateResponse(HttpStatusCode.OK, s);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }

        // DELETE: api/Style/5
        public HttpResponseMessage Delete(int id)
        {
            try
            {
                this._repository.DeleteStyle(id);
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            } 
        }
    }
}
