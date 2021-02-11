using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC7amThundersBatch.Models
{
    public class EmpDeptModel
    {
        public EmployeeModel Emp { get; set; }
        public DepartmentModel Dept { get; set; }
    }
}