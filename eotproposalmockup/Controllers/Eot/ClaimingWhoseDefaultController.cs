using eotproposalmockup.Models;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eotproposalmockup.Controllers.Eot
{
    public class ClaimingWhoseDefaultController : Controller
    {
        // GET: ClaimingWhoseDefault

        NpgsqlConnection _connection;
        public ClaimingWhoseDefaultController()
        {
            _connection = new NpgsqlConnection();
            _connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyconnectionString"].ToString();

        }

        [HttpGet]
        public ActionResult getAllWhoseDefault()
        {
            List<claimingwhosedefault> whosedefaultlst = new List<claimingwhosedefault>();

            try
            {
                _connection.Open();
                string getAllClaimingWhoseDefaultSQL = "SELECT * from public.fn_getallclaimingwhosedefault()";
                using(var command=new NpgsqlCommand(getAllClaimingWhoseDefaultSQL,_connection))
                {
                    using(var reader = command.ExecuteReader())
                    {
                        while(reader.Read()) {
                            claimingwhosedefault whosedefault = new claimingwhosedefault();
                            whosedefault.whosedefault_id = reader.GetInt32(0);
                            whosedefault.whosedefault_description = reader.GetString(1);
                            whosedefaultlst.Add(whosedefault);

                        }

                    }
                }


            }
            catch (Exception ex)
            {
                return Json(new { status = false, message = ex.Message },JsonRequestBehavior.AllowGet);
            }
            if (whosedefaultlst.Count > 0)
            {
                return Json(new { status = true, message = "Data fetched successfully..", whosedefaultlst },JsonRequestBehavior.AllowGet);


            }
            else
            {
                return Json(new { status =false, message = "No Data Found"}, JsonRequestBehavior.AllowGet);


            }

            
        }

      
    }
}