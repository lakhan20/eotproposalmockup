using eotproposalmockup.Models;
using Npgsql;
using System;
using System.Configuration;
using System.Web.Mvc;

namespace eotproposalmockup.Controllers.login
{
    public class LoginController : Controller
    {
        NpgsqlConnection _connection;
        public LoginController()
        {
            _connection = new NpgsqlConnection();
            _connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyconnectionString"].ToString();

        }
      

        [HttpPost]
        public ActionResult LoginApi(LoginModel loginModel)
        {
            LoginResponse loginResponse = new LoginResponse();
         
            try
            {
                _connection.Open();
                string loginSql = "SELECT * from public.fn_login(@_user_email,@_user_password)";

                using (var command = new NpgsqlCommand(loginSql, _connection))
                {
                    command.Parameters.AddWithValue("@_user_email", loginModel.user_email);
                    command.Parameters.AddWithValue("@_user_password", loginModel.user_password);

                    using (var loginReader = command.ExecuteReader())
                    {

                        if (loginReader.Read())
                        {
                            loginResponse.user_id = Convert.ToInt32(loginReader["user_id"]);
                            loginResponse.user_name = Convert.ToString(loginReader["user_name"]);
                            loginResponse.user_email = Convert.ToString(loginReader["user_email"]);
                            loginResponse.user_password = Convert.ToString(loginReader["user_password"]);
                            loginResponse.status = Convert.ToBoolean(loginReader["status"]);
                            loginResponse.role_id = Convert.ToInt32(loginReader["role_id"]);
                            loginResponse.role_name = Convert.ToString(loginReader["role_name"]);
                        }
                    }


                }
            }
            catch (Exception ex)
            {

                return Json(new { success = false, message = ex.Message });
            }
            if (Convert.ToBoolean(loginResponse.role_id) && Convert.ToBoolean(loginResponse.user_id))
            {
                _connection.Close();
                return Json(new { success = true, message = "User Logged in successfully.", loginResponse });


            }
            else
            {
                return Json(new { success = false, message = "UnAuthorized User." });

            }

        }

        public ActionResult Login()
        {
            return View();

        }
    }
}