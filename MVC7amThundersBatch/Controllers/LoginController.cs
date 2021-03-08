using MVC7amThundersBatch.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace MVC7amThundersBatch.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        EmployeeEntities db = new EmployeeEntities();
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }

        [Authorize(Roles="Admin")]
        public ActionResult AboutUs()
        {
            return View();
        }


        [Authorize(Roles = "Manager")]
        public ActionResult ContactUS()
        {
            return View();
        }





        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(UserDetail reg)
        {
            UserDetail user = db.UserDetails.Where(s => s.UserName == reg.UserName && s.Password == reg.Password).SingleOrDefault();

            if (user != null)
            {
                FormsAuthentication.SetAuthCookie(reg.UserName, false);
                return Redirect("~/Login/Index");
            }
            else
            {
                return View();

            }
        }

        public ActionResult SignOut()
        {
            FormsAuthentication.SignOut();
            return Redirect("~/Login/Login");
        }
        [OutputCache(Duration =20,Location =System.Web.UI.OutputCacheLocation.Client)]

        public ActionResult CacheExample() {

            return View();

        }
    }
}