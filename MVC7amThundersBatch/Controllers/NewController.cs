 
using MVC7amThundersBatch.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC7amThundersBatch.Controllers
{
    public class NewController : Controller
    {
        // GET: New
        [NonAction]
        public int Index()
        {
            return 1;
        }

        public string Index1()
        {
            int a = Index();
            return "Hello World value is :"+a;
        }

        public ActionResult Index2()
        {
            return View() ;
        }
        public ActionResult Index3()
        {
            return Redirect("http://www.Google.com");
        }

        public string  Index4(int? id)
        {
            return "Sai Employee id is :"+id;
        }
        public string Index5(int? eid)
        {
            return "Amit Employee id is :" + eid;
        }

        public string Index6(int? id,string name,string Designation)
        {
            return "Employee id is :" + id+" Employee Name is "+name+" Designation is "+Designation;
        }

        public string Index7(int? id)
        {
            return "Employee id is :" + id + " Employee Name is " + Request.QueryString["name"] + " Designation is " + Request.QueryString["Designation"] ;
        }

        public ActionResult SendHello() {
           
            ViewBag.info = 1;
            return View();
        }
        public ActionResult SendEmployeeDetails()
        {
            EmployeeModel obj = new EmployeeModel();
            obj.EmpId = 1;
            obj.EmpName = "Sai Krupa";
            obj.EmpSalary = 250000;

            ViewBag.info = obj;
            return View();
        }

        public ActionResult SendMultipleEmpDet()
        {
            List<EmployeeModel> listObj = new List<EmployeeModel>();

            EmployeeModel obj = new EmployeeModel();
            obj.EmpId = 1;
            obj.EmpName = "Sai Krupa";
            obj.EmpSalary = 250000;

            EmployeeModel obj1 = new EmployeeModel();
            obj1.EmpId = 2;
            obj1.EmpName = "Venkat";
            obj1.EmpSalary = 350000;

            EmployeeModel obj2 = new EmployeeModel();
            obj2.EmpId = 3;
            obj2.EmpName = "Amit";
            obj2.EmpSalary = 450000;


            listObj.Add(obj);
            listObj.Add(obj1);
            listObj.Add(obj2);


            ViewBag.info = listObj;
            return View();
        }

        public ActionResult sendOneEmployeebyModel()
        {
            EmployeeModel obj = new EmployeeModel();
            obj.EmpId = 1;
            obj.EmpName = "Sai Krupa";
            obj.EmpSalary = 250000;
            
            return View(obj);
        }

        public ActionResult sendMulitipleEmployeebyModel()
        {
            List<EmployeeModel> listObj = new List<EmployeeModel>();

            EmployeeModel obj = new EmployeeModel();
            obj.EmpId = 1;
            obj.EmpName = "Sai Krupa";
            obj.EmpSalary = 250000;

            EmployeeModel obj1 = new EmployeeModel();
            obj1.EmpId = 2;
            obj1.EmpName = "Venkat";
            obj1.EmpSalary = 350000;

            EmployeeModel obj2 = new EmployeeModel();
            obj2.EmpId = 3;
            obj2.EmpName = "Amit";
            obj2.EmpSalary = 450000;


            listObj.Add(obj);
            listObj.Add(obj1);
            listObj.Add(obj2);

            return View(listObj);
        }

        public ActionResult getEmpDept() {

            EmployeeModel obj = new EmployeeModel();
            obj.EmpId = 1;
            obj.EmpName = "Sai Krupa";
            obj.EmpSalary = 250000;

            DepartmentModel dept = new DepartmentModel();
            dept.DeptId = 1211;
            dept.DeptName = "IT";

            EmpDeptModel EDptobj = new Models.EmpDeptModel();
            EDptobj.Emp = obj;
            EDptobj.Dept = dept;

            return View(EDptobj);
        }

        public ActionResult HtmlHelperExample() {
            AdonetApproach.Models.EmployeeContext db = new AdonetApproach.Models.EmployeeContext();
            //EmployeeModel emp = new EmployeeModel();
            //emp.EmpName = "Sai";
            ViewBag.EmployeeDetail = new SelectList(db.getEmployee(), "EmpId", "EmpName");
            return View();

        }

        public ActionResult ValidationExample()
        {
            
            return View();

        }
        [HttpPost]
        public ActionResult ValidationExample(RegisterModel r)
        {
            if (ModelState.IsValid)
            {
                return View();
            }
            else
            {
                return View();
            }
        }
    }
}