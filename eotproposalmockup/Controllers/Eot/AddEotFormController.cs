using eotproposalmockup.Models;
using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace eotproposalmockup.Controllers.Eot
{
    public class AddEotFormController : Controller
    {
        NpgsqlConnection _connection;
        public AddEotFormController()
        {
            _connection = new NpgsqlConnection();
            _connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyconnectionString"].ToString();

        }
        [HttpPost]
        public ActionResult AddEot(AddEotForm addeot)
            {

            var message = "Successful";
            int resp = 0;

            try
            {
                _connection.Open();

                if (addeot.is_advancenotice)
                {
                    if (addeot.upload_notice.ContentType != "application/pdf")
                    {
                        message = "Please Upload .pdf File";
                        return Json(new { status = false,error_code=121, ErrorField = "uploadNotice_Error", errors = message });

                    }
                }
                if (addeot.upload_detailedproposal.ContentType != "application/pdf")
                {
                    message = "Please Upload .pdf File";
                    return Json(new { status = false, error_code=121, ErrorField = "detailed_proposal_Error", errors = message });
                }
            if (!ModelState.IsValid)
            {
                var errors = new List<ValidationError>();

                foreach (var key in ModelState.Keys)
                {
                    var state = ModelState[key];
                    if (state.Errors.Any())
                    {
                        // Use reflection to get the property and display name
                        var property = addeot.GetType().GetProperty(key);
                        var displayName = property?.GetCustomAttribute<DisplayAttribute>()?.Name ?? key;

                        foreach (var error in state.Errors)
                        {
                            errors.Add(new ValidationError
                            {
                                DisplayName = displayName,
                                ErrorMessage = error.ErrorMessage
                            });
                        }
                    }
                }

                return Json( new { status = false, error_code=122,errors } );
            }



                string noticeFileName = "";
                //upload_notice file uploading
                if (addeot.is_advancenotice)
                {
                    string notices_folder = Server.MapPath("~/notices");
                    Directory.CreateDirectory(notices_folder);
                    noticeFileName = Path.GetFileName(addeot.upload_notice.FileName);
                    //noticeFileName = DateTime.Now + noticeFileName;
                    string noticePath = Path.Combine(notices_folder, noticeFileName);
                    addeot.upload_notice.SaveAs(noticePath);
                }

                //detailed proposal file uploading
                string detailedProposal_folder = Server.MapPath("~/detailedProposal");
                Directory.CreateDirectory(detailedProposal_folder);
                string detailedProposalFileName = Path.GetFileName(addeot.upload_detailedproposal.FileName);
                //detailedProposalFileName = DateTime.Now + detailedProposalFileName;

                string detailedProposalPath = Path.Combine(detailedProposal_folder, detailedProposalFileName); //filename
                addeot.upload_detailedproposal.SaveAs(detailedProposalPath);



                string addEotSql = "SELECT public.fn_addform(@_eot_reason, @_whosedefault_id, @_eot_dueto, @_eot_claimingstage,@_delay_from,@_delay_to,@_extention_applied_days,@_is_abletoabsorb_delay,@_is_advancenotice,@_dateofnotice,@_upload_notice,@_is_dprapplicable,@_compensation_amount,@_clause_no,@_upload_detailedproposal,@_user_id)";

                using (var command = new NpgsqlCommand(addEotSql, _connection))
                {
                    command.Parameters.AddWithValue("@_eot_reason", addeot.eot_reason);
                    command.Parameters.AddWithValue("@_whosedefault_id", addeot.whosedefault_id);
                    command.Parameters.AddWithValue("@_eot_dueto", addeot.eot_dueto);
                    command.Parameters.AddWithValue("@_eot_claimingstage", addeot.eot_claimingstage);
                    command.Parameters.AddWithValue("@_delay_from", addeot.delay_from);
                    command.Parameters.AddWithValue("@_delay_to", addeot.delay_to);
                    command.Parameters.AddWithValue("@_extention_applied_days", addeot.extention_applied_days);
                    command.Parameters.AddWithValue("@_is_abletoabsorb_delay", addeot.is_abletoabsorb_delay);
                    command.Parameters.AddWithValue("@_is_advancenotice", addeot.is_advancenotice);
                    command.Parameters.AddWithValue("@_dateofnotice", addeot.dateofnotice);
                    command.Parameters.AddWithValue("@_upload_notice", noticeFileName);
                    command.Parameters.AddWithValue("@_is_dprapplicable", addeot.is_dprapplicable);
                    command.Parameters.AddWithValue("@_compensation_amount", addeot.compensation_amount);
                    command.Parameters.AddWithValue("@_clause_no", addeot.clause_no);
                    command.Parameters.AddWithValue("@_upload_detailedproposal", detailedProposalFileName);
                    command.Parameters.AddWithValue("@_user_id", addeot.user_id);
                    resp = (int)command.ExecuteScalar();

                }
            }
            catch (Exception ex)
            {
                return Json(new { status = false, status_code =500, message = ex.Message });

            }

            if (resp>0)
            {
                return Json(new { status=true,status_code=HttpStatusCode.OK,message="EOT form added successfully" });

            }
            else
            {
                return Json(new { status = false, status_code = HttpStatusCode.BadRequest, message = "Something Went Wrong Please try again." });

            }



            //}
        }
            }
}