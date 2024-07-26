using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;

namespace eotproposalmockup.Controllers.UserHome
{
    public class UserHomeController : Controller
    {
        // GET: UserHome
        public ActionResult UserHomeView()
        {
            
            return View();
        }
    }
}