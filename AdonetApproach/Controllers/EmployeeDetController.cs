using AdonetApproach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AdonetApproach.Controllers
{
    public class EmployeeDetController : Controller
    {
        EmployeeContext db = new EmployeeContext();

        // GET: EmployeeDet
        public ActionResult Index()
        {
            return View(db.getEmployee());
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(EmployeeModel emp)
        {
            int i = db.save(emp);
            if (i > 0)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }
    }
}