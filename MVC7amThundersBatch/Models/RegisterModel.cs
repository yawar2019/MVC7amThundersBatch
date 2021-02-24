using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVC7amThundersBatch.Models
{
    public class RegisterModel
    {
        [Key]
        public int UserId { get; set; }
        [Required(ErrorMessage ="UserName is Cannot be Empty")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Password is Cannot be Empty")]
        public string Password { get; set; }
        [Compare("Password", ErrorMessage = "Password and Cpwd is not Matching")]
        public string ConfirmPassword { get; set; }
        [DataType(DataType.EmailAddress,ErrorMessage ="EmailId format is Invalid")]
        public string EmailId { get; set; }
        [Range(10,30,ErrorMessage ="Age should be between 10-30")]
        public int Age { get; set; }
        [StringLength(20,ErrorMessage ="More then 20 characters invalid")]
        public string Address { get; set; }
    }
}