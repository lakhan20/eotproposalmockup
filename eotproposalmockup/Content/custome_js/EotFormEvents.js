



//all events

var isBriefReasonValid = false;
var isWhoseDefaultValid = false;
var isEotDueToValid = false;
var isEotClaimingStageValid = false;
var isDelayFromValid = false;
var isDelayToValid = false;
var isnoofdaysextensionValid = false;

var isdateofnoticeValid = true;
var isuploadnoticeValid = true;
var iscompensationamountValid = true;
var isClausNoValid = false;
var isDetailedProposalValid = false;



//layout change events
$(".is_advance_notice").change(function () {
    var is_advance_notice_val = $('input[name="is_advance_notice"]:checked').val();

    if (is_advance_notice_val == "Yes") {
        isdateofnoticeValid = false;
        isuploadnoticeValid = false;
        $('.ifNoticegiven').show();
    }
    else {
        isdateofnoticeValid = true;
        isuploadnoticeValid = true;
        $('.ifNoticegiven').hide();
    }
});
$(".is_additionalCost").change(function () {
    var is_additionalCost = $('input[name="is_additionalCost"]:checked').val();

    if (is_additionalCost == "Yes") {
        iscompensationamountValid = false;
        $('.ifapplicableforcost').show();
    }
    else {
        iscompensationamountValid = true;
        $('.ifapplicableforcost').hide();
    }

});
$("#briefReason").blur(function () {
    if ($("#briefReason").val().trim() == "") {
        $("#briefReason_Error").html("Please Enter Brief Reason")
        $("#briefReason_Error").addClass("invalid");
        isBriefReasonValid = false;
        return;
    }
    else {
        $("#briefReason_Error").html("")
        $("#briefReason_Error").removeClass("invalid");
        isBriefReasonValid = true;
        debugger;
        $("#submitBtn").prop("disabled", !isAllFieldsValid());
        debugger;
        //if (isAllFieldsValid()) {
        //    $('#submitBtn').removeAttr('disabled');

        //}
        //else {
        //    $('#submitBtn').attr('disabled',"disabled");
        //}

    }

    //console.log("brief reason :  ", isBriefReasonValid) 
    //$("#submitBtn").prop("disabled", !isBriefReasonValid);


})



$("#whoseDefault").blur(function () {

    if ($("#whoseDefault").val() == 0) {
        $("#whoseDefault_Error").html("Please Select Whose default")
        $("#whoseDefault_Error").addClass("invalid");
        isWhoseDefaultValid = false;
        return;
    }
    else {
        isWhoseDefaultValid = true;
        debugger;
        $("#whoseDefault_Error").html("")
        $("#whoseDefault_Error").removeClass("invalid");
        $("#submitBtn").prop("disabled", !isAllFieldsValid());

        //if (isAllFieldsValid()) {
        //    $('#submitBtn').removeAttr('disabled');

        //}
        //else {
        //    $('#submitBtn').attr('disabled', "disabled");
        //}
    }
});

$("#eotDueTo").change(function () {
    
    if ($("#eotDueTo").val() == 0) {
        $("#eotDueTo_Error").html("Please Select EOT Due to")
        $("#eotDueTo_Error").addClass("invalid");
        $(".eotDueToOtherReasonDiv").hide();

        isEotDueToValid = false;
    }
    else if ($("#eotDueTo").val() == 4) {
        $("#eotDueTo_Error").html("")
        $("#eotDueTo_Error").removeClass("invalid");
        $(".eotDueToOtherReasonDiv").show();
        isEotDueToValid = false;
    }
    else {
        $("#eotDueTo_Error").html("")
        $("#eotDueTo_Error").removeClass("invalid");
        $(".eotDueToOtherReasonDiv").hide();
        isEotDueToValid = true;
        $("#submitBtn").prop("disabled", !isAllFieldsValid());

        //if (isAllFieldsValid()) {
        //    $('#submitBtn').removeAttr('disabled');

        //}
        //else {
        //    $('#submitBtn').attr('disabled', "disabled");
        //}
    }


});
$("#eotDueTo").blur(function () {

    if ($("#eotDueTo").val() == 0) {
        $("#eotDueTo_Error").html("Please Select EOT Due to ")
        $("#eotDueTo_Error").addClass("invalid");
        isEotDueToValid = false;
    }

    else {
        $("#eotDueTo_Error").html("")
        $("#eotDueTo_Error").removeClass("invalid");
        //$(".eotDueToOtherReasonDiv").hide();
        isEotDueToValid = true;
        $("#submitBtn").prop("disabled", !isAllFieldsValid());

        //if (isAllFieldsValid()) {
        //    $('#submitBtn').removeAttr('disabled');

        //}
        //else {
        //    $('#submitBtn').attr('disabled', "disabled");
        //}

    }


});


$("#eotDueToOtherReason").blur(function () {
    //console.log("eot due to : ", $("#eotDueTo").val())
    if ($("#eotDueTo").val() !== 4 && $("#eotDueToOtherReason").val().trim() == "") {
        $("#eotDueToOtherReason_Error").html("Please Enter Other Reason else select another reason")
        $("#eotDueToOtherReason_Error").addClass("invalid");
        isEotDueToValid = false;
    }
    else {
        isEotDueToValid = true;
        $("#eotDueToOtherReason_Error").html("")
        $("#eotDueToOtherReason_Error").removeClass("invalid");
        $("#submitBtn").prop("disabled", !isAllFieldsValid());

        //if (isAllFieldsValid) {
        //    $('#submitBtn').removeAttr('disabled');

        //}
        //else {
        //    $('#submitBtn').attr('disabled', "disabled");
        //}
    }
});

$("#eotClaimingStage").blur(function () {
    if ($("#eotClaimingStage").val() == 0) {
        $("#eotClaimingStage_Error").html("Please Select EOT Claiming for stage")
        $("#eotClaimingStage_Error").addClass("invalid");
        isEotClaimingStageValid = false;
    }
    else {
        isEotClaimingStageValid = true;
        $("#eotClaimingStage_Error").html("")
        $("#eotClaimingStage_Error").removeClass("invalid");
        $("#submitBtn").prop("disabled", !isAllFieldsValid());

        //if (isAllFieldsValid()) {
        //    $('#submitBtn').removeAttr('disabled');

        //}
        //else {
        //    $('#submitBtn').attr('disabled', "disabled");
        //}
    }
});


$("#eotClaimingStage").change(function () {
    //console.log("eot due to : ", $("#eotDueTo").val())
    if ($("#eotClaimingStage").val() == 0) {
        $("#eotClaimingStage_Error").html("Please Select EOT Claiming for stage")
        $("#eotClaimingStage_Error").addClass("invalid");
        isEotClaimingStageValid = false;
    }
    else {
        isEotClaimingStageValid = true;
        $("#eotClaimingStage_Error").html("")
        $("#eotClaimingStage_Error").removeClass("invalid");
        $("#submitBtn").prop("disabled", !isAllFieldsValid());

        //if (isAllFieldsValid) {
        //    $('#submitBtn').removeAttr('disabled');

        //}
        //else {
        //    $('#submitBtn').attr('disabled', "disabled");
        //}
    }
});

$("#delayFrom").blur(function () {
    if ($("#delayFrom").val() == "") {
        $("#delayFrom_Error").html("Please Enter Delay From Date")
        $("#delayFrom_Error").addClass("invalid");
        isDelayFromValid = false;
    }
    else {
        isDelayFromValid = true;
        $("#delayFrom_Error").html("")
        $("#delayFrom_Error").removeClass("invalid");
        $("#submitBtn").prop("disabled", !isAllFieldsValid());

        //if (isAllFieldsValid()) {
        //    $('#submitBtn').removeAttr('disabled');

        //}
        //else {
        //    $('#submitBtn').attr('disabled', "disabled");
        //}
    }

})


$("#delayTo").on("change", function () {
    let delayFrom = new Date($("#delayFrom").val());
    let delayTo = new Date($("#delayTo").val());
    if (delayFrom == "Invalid Date") {
        $("#delayFrom_Error").html("Please enter a valid delay from")
        $("#delayFrom_Error").addClass("invalid");
        $("#noofdelaydays").val("");
        $("#delayTo").val("");
        $("#delayFrom").val("");
        isDelayToValid = false;
        return;
    }
    else {
        $("#delayFrom_Error").html("")
        $("#delayTo_Error").html("")
        isDelayToValid = true;
        $("#submitBtn").prop("disabled", !isAllFieldsValid());

        //if (isAllFieldsValid()) {
        //    $('#submitBtn').removeAttr('disabled');

        //}
        //else {
        //    $('#submitBtn').attr('disabled', "disabled");
        //}

    }
    if (delayFrom > delayTo) {

        $("#delayTo_Error").html("Please Enter valid date")
        $("#delayTo_Error").addClass("invalid");
        $("#noofdelaydays").val("");
        $("#delayTo").val("");
        $("#delayFrom").val("");
        isDelayToValid = false;
        return;
    }
    else {
        $("#delayTo_Error").html("")
        $("#delayFrom_Error").html("")
        isDelayToValid = true;
        $("#submitBtn").prop("disabled", !isAllFieldsValid());

    }

    let Difference_In_Time =
        delayTo.getTime() - delayFrom.getTime();

    let Difference_In_Days =
        Math.round
            (Difference_In_Time / (1000 * 3600 * 24));

    $("#noofdelaydays").val(Difference_In_Days);

    

});

$("#delayTo").on("blur", function () {

    if ($("#delayTo").val() == "") {
        $("#delayTo_Error").html("Please Enter Delay To Date")
        $("#delayTo_Error").addClass("invalid");
        isDelayToValid = false;
        $("#submitBtn").prop("disabled", !isAllFieldsValid());

        //if (isAllFieldsValid()) {
        //    $('#submitBtn').removeAttr('disabled');

        //}
        //else {
        //    $('#submitBtn').attr('disabled', "disabled");
        //}
    }
    else {
        isDelayToValid = true;
        $("#delayTo_Error").html("")
        $("#delayTo_Error").removeClass("invalid");
        $("#submitBtn").prop("disabled", !isAllFieldsValid());
    }
})


$('#noofdaysextension').keyup(function () {
    this.value = this.value.replace(/[^0-9\.]/g, '');
});
$('#noofdaysextension').blur(function () {
    if ($("#noofdaysextension").val().trim() == "") {
        $("#noofdaysextension_Error").html("Please Enter Number Of Days extension")
        $("#noofdaysextension_Error").addClass("invalid");
        isnoofdaysextensionValid = false;
    }
    else {
        isnoofdaysextensionValid = true;
        $("#noofdaysextension_Error").html("")
        $("#noofdaysextension_Error").removeClass("invalid");
        $("#submitBtn").prop("disabled", !isAllFieldsValid());

        //if (isAllFieldsValid()) {
        //    $('#submitBtn').removeAttr('disabled');

        //}
        //else {
        //    $('#submitBtn').attr('disabled', "disabled");
        //}
    }
});

$("#dateOfNotice").blur(function () {

    if ($(".is_advance_notice").val() == "Yes" && $("#dateOfNotice").val() == "") {
        $("#dateOfNotice_Error").html("Please Enter Date of notice")
        $("#dateOfNotice_Error").addClass("invalid");
        isdateofnoticeValid = false;
    }
    else {
        isdateofnoticeValid = true;
        $("#dateOfNotice_Error").html("")
        $("dateOfNotice_Error").removeClass("invalid");
        $("#submitBtn").prop("disabled", !isAllFieldsValid());

        //if (isAllFieldsValid()) {
        //    $('#submitBtn').removeAttr('disabled');

        //}
        //else {
        //    $('#submitBtn').attr('disabled', "disabled");
        //}
    }

});


$('#uploadNotice').on("change focusout",function () {
    if ($(".is_advance_notice").val() == "Yes" && $('#uploadNotice')[0].files.length == 1) {
        $("#uploadNotice_Error").html("")
        $("#uploadNotice_Error").removeClass("invalid");
        isuploadnoticeValid = true;
        $("#submitBtn").prop("disabled", !isAllFieldsValid());

        //if (isAllFieldsValid()) {
        //    $('#submitBtn').removeAttr('disabled');

        //}
        //else {
        //    $('#submitBtn').attr('disabled', "disabled");
        //}
    }

    else if ($(".is_advance_notice").val() == "Yes" && $('#uploadNotice')[0].files.length == 0) {
        $("#uploadNotice_Error").html("Please upload notice")
        $("#uploadNotice_Error").addClass("invalid");
        isuploadnoticeValid = false;
    }
});



$('#compensation_amount').keyup(function () {
    this.value = this.value.replace(/[^0-9\.]/g, '');
});

$("#compensation_amount").blur(function () {

    
    if ($(".is_advance_notice").val() == "Yes" && $("#compensation_amount").val() == "") {
        $("#compensation_amount_Error").html("Please Enter Compensation amount")
        $("#compensation_amount_Error").addClass("invalid");
        iscompensationamountValid = false;
    }
    else {
        $("#compensation_amount_Error").html("")
        $("#compensation_amount_Error").removeClass("invalid");
        iscompensationamountValid = true;
        $("#submitBtn").prop("disabled", !isAllFieldsValid());

        //if (isAllFieldsValid()) {
        //    $('#submitBtn').removeAttr('disabled');

        //}
        //else {
        //    $('#submitBtn').attr('disabled', "disabled");
        //}
    }

})

$("#clause_no").blur(function () {
    if ($("#clause_no").val().trim() == "") {
        $("#clause_no_Error").html("Please Enter Clause number")
        $("#clause_no_Error").addClass("invalid");
        isClausNoValid = false;
    }
    else {
        $("#clause_no_Error").html("")
        $("#clause_no_Error").removeClass("invalid");
        isClausNoValid = true;
        $("#submitBtn").prop("disabled", !isAllFieldsValid());

        //if (isAllFieldsValid()) {
        //    $('#submitBtn').removeAttr('disabled');

        //}
        //else {
        //    $('#submitBtn').attr('disabled', "disabled");
        //}
    }

});

$('#detailed_proposal').on("change focusout", function () {
    if ($('#detailed_proposal')[0].files.length == 1) {
        $("#detailed_proposal_Error").html("")
        $("#detailed_proposal_Error").removeClass("invalid");
        debugger;
        isDetailedProposalValid = true;
        $("#submitBtn").prop("disabled", !isAllFieldsValid());

   
    }

    else if ($('#detailed_proposal')[0].files.length == 0) {
        $("#detailed_proposal_Error").html("Please upload Detailed Proposol Justification")
        $("#detailed_proposal_Error").addClass("invalid");
        isDetailedProposalValid = false;
        
        //if (isAllFieldsValid()) {
        //    $('#submitBtn').removeAttr('disabled');

        //}
        //else {
        //    $('#submitBtn').attr('disabled', "disabled");
        //}
    }
});

$("#submitBtn").click(function () {

    //alert("clicked");

    if (!isAllFieldsValid()) {
        return false;
        console.log("SW");
    }
    else {
        alert("lets call a api to add the EOT");
    }


});



function isAllFieldsValid() {
    debugger;
    if (isBriefReasonValid &&
        isWhoseDefaultValid &&
        isEotDueToValid &&
        isEotClaimingStageValid &&
        isDelayFromValid &&
        isDelayToValid &&
        isnoofdaysextensionValid &&
        isdateofnoticeValid &&
        isuploadnoticeValid &&
        iscompensationamountValid &&
        isClausNoValid &&
        isDetailedProposalValid) {
        return true;
    }
    else {
        return false;
    }
}


