﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HandleErrorExample2.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
 [HandleError]
        public ActionResult About()
        {
            try
            {
                int a = 10;
                int b = 0;
                int c = a / b;
            }
            catch(Exception ex)
            {
                throw ex;
            }

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}