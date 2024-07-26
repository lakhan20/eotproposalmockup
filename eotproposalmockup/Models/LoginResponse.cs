using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eotproposalmockup.Models
{
    public class LoginResponse
    {
        public int user_id { get; set; } = 0;
        public string user_name { get; set; }
        public string user_email { get; set; }
        public string user_password { get; set; }
        public Boolean status { get; set; }
        public int role_id { get; set; } = 0;
        public string role_name { get; set;}
    }
}