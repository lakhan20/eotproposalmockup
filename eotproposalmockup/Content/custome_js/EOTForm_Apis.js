$(document).ready(function () {

    var getroleId = localStorage.getItem("role_id");

    if (getroleId == null || getroleId != 2) {
        window.location.href = "/";
    }
    $.get("/ClaimingWhoseDefault/getAllWhoseDefault", (data) => {
        if (data.status) {
            const selectElement = $('#whoseDefault');
            data.whosedefaultlst.forEach(item => {
                const option = $('<option>', {
                    id: item.id,
                    value: item.whosedefault_id,
                    text: item.whosedefault_description
                });
                selectElement.append(option);
            });
        } else {
            console.error("Error fetching data");
        }
    });

    //$.get("/EOTId/getNextEotId", (data) => {
    //    //debugger;
    //    //alert("alert box called...!!");
    //    $("#eot_no").val("NHAI/000"+data.id);
    //});
});



$("#submitBtn").click(function () {

    //alert("clicked");

    if (!isAllFieldsValid()) {
        return false;
        //alert("Please check validations : ")

    }
    else {
        //alert("lets call a api to add the EOT" + $("#whoseDefault").val());

        let formData = new FormData();

        formData.append("eot_reason", $("#briefReason").val())

        formData.append("whosedefault_id", $("#whoseDefault").val())
        formData.append("eot_dueto", $("#eotDueTo").val())

        if ($("#eotDueTo").val() == 4) {
            formData.append("eot_dueto", $("#eotDueTo").val())

        }
        
        formData.append("eot_claimingstage", $("#eotClaimingStage").val())

        formData.append("delay_from", $("#delayFrom").val())

        formData.append("delay_to", $("#delayTo").val())
        formData.append("extention_applied_days", $("#noofdaysextension").val())

        formData.append("is_abletoabsorb_delay", $('input[name="is_absorb_delay"]:checked').val() == "Yes" ? true : false);

        formData.append("is_advancenotice", $('input[name="is_advance_notice"]:checked').val() == "Yes" ? true : false);

        if ($('input[name="is_advance_notice"]:checked').val() == "Yes")
        {       
            formData.append("dateofnotice", $("#dateOfNotice").val());
            formData.append("upload_notice", $("#uploadNotice")[0].files[0]);
        }

        formData.append("is_dprapplicable", $('input[name="is_additionalCost"]:checked').val() == "Yes" ? true : false);
        if ($('input[name="is_additionalCost"]:checked').val() == "Yes") {
            formData.append("compensation_amount", $("#compensation_amount").val());
        }
        formData.append("clause_no", $("#clause_no").val());
        formData.append("upload_detailedproposal", $("#detailed_proposal")[0].files[0]);

        var user_id = localStorage.getItem("user_id");

        formData.append("user_id", user_id);


        //console.log("formdata : ", formData);

        $.ajax({
            type: "POST",
            url: "/AddEotForm/AddEot",
            data: formData,
            processData: false,  // Don't process the data
            contentType: false,  // Don't set contentType
            success: function (response) {
                console.log(response)

                if (response.status) {
                    alert(response.message)
                }
                else {

                    if (response.error_code == 121) {
                        console.log("resperr : ", response.errors);
                        $("#" + response.ErrorField).html(response.errors);
                        $("#" + response.ErrorField).addClass("invalid");
                       
                    }
                    else if (response.error_code == 122) {
                        //console.log("errors......... ", response.errors);
                        for (let i = 0; i < response.errors.length; i++) {
                            //console.log("errores",resi)
                            $("#" + response.errors[i].DisplayName).html(response.errors[i].ErrorMessage);
                            $("#" + response.errors[i].DisplayName).addClass("invalid");
                        }


                    }
                    else {
                        alert(response.message)
                    }
                }
                //if (response.success) {
                //    alert(response.message);
                //    //console.log("response : ", response);
                //    localStorage.setItem("role_id", response.loginResponse.role_id);
                //    var url = "/UserHome/UserHomeView";
                //    window.location.href = url;

                //} else {
                //    console.log(response)
                //    //alert(response.message);
                //    window.location.href = "/";
                //}
            },
            error: function (err) {
                //alert("SW");
            }
        });

    }


});
