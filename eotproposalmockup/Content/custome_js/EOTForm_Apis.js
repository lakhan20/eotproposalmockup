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

})
