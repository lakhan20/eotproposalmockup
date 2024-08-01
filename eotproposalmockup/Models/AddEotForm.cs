using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace eotproposalmockup.Models
{
    public class AddEotForm
    {
        public int eot_id { get; set; }
        public string eot_reason { get; set; }
        public int whosedefault_id { get; set; }
        public string eot_dueto { get; set; }
        public string eot_claimingstage { get; set; }
        public int dpr_lastdeliverable { get; set; }
        public DateTime delay_from { get; set; }
        public DateTime delay_to { get; set;}
        public int extention_applied_days { get; set; }
        public Boolean is_abletoabsorb_delay { get; set; }

        public Boolean is_advancenotice { get; set; }
        public DateTime dateofnotice { get; set; }

        [MaxFileSize(2 * 1024 * 1024, ErrorMessage = "File size has to be of 2 mb")]
        [Display(Name = "uploadNotice_Error")]
        public HttpPostedFileBase upload_notice { get; set; }
        public Boolean is_dprapplicable { get; set; }
        public double compensation_amount { get; set; }
        public string clause_no { get; set; }

        [MaxFileSize(2 * 1024 * 1024, ErrorMessage = "File size has to be of 2 mb")]
        [Display(Name = "detailed_proposal_Error")]
        public HttpPostedFileBase upload_detailedproposal { get; set; }
        public int user_id { get; set; }
    }
}