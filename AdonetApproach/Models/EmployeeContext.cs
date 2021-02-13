using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace AdonetApproach.Models
{
    public class EmployeeContext
    {
        SqlConnection con = new SqlConnection("Data Source=AZAM-PC\\SQLEXPRESS;Initial Catalog=AmithDb;Integrated Security=true" );

        public List<EmployeeModel> getEmployee()
        {
            List<EmployeeModel> listObj = new List<EmployeeModel>();
            SqlCommand cmd = new SqlCommand("sp_getEmployee",con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                EmployeeModel emp = new EmployeeModel();
                emp.EmpId = Convert.ToInt32(dr[0]);
                emp.EmpName = Convert.ToString(dr[1]);
                emp.EmpSalary = Convert.ToInt32(dr[2]);
                listObj.Add(emp);
            }
            return listObj;
        }

        public int save(EmployeeModel emp)
        {
            SqlCommand cmd = new SqlCommand("sp_insertEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.Parameters.AddWithValue("@EmpName", emp.EmpName);
            cmd.Parameters.AddWithValue("@EmpSalary", emp.EmpSalary);
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }
        
    }
}