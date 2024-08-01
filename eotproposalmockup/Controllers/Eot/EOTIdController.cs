using Npgsql;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eotproposalmockup.Controllers.Eot
{
    public class EOTIdController : Controller
    {

        NpgsqlConnection _connection;
        public EOTIdController()
        {
            _connection = new NpgsqlConnection();
            _connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyconnectionString"].ToString();
        }

        [HttpGet]
        public ActionResult getNextEotId()
        {
            
                _connection.Open();
                string getnexteotSql = "select * from nextval('tbl_eotform_eot_id_seq')";
                using (var command = new NpgsqlCommand(getnexteotSql, _connection))
                {
                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            var nextvalid = Convert.ToInt32(reader["nextval"]);
                            //Console.WriteLine(reader.GetName(0));
                            return Json(new { status = true, message = "Got eot id",id=nextvalid}, JsonRequestBehavior.AllowGet);
                        }
                        else
                        {
                            return Json(new { status = false, message = "Unable to find id" });

                        }

                    }
                }

            //}
            //catch (Exception ex)
            //{

            //    return Json(new { status = false, message = ex.Message });
            //}
        }


    }
}