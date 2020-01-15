/**
 * Created by feler on 7/19/2016.
 */




var timer;

function getEndTime(timeInSec) {
    var currentTime = Date.parse(new Date());
//                    var deadline = new Date(currentTime + timeInMin*60*1000);
    var deadline = new Date(currentTime + timeInSec * 1000);
    return deadline;
}

function getTimeRemaining(endtime) {
    var t = Date.parse(endtime) - Date.parse(new Date());
    var seconds = Math.floor((t / 1000) % 60);
    var minutes = Math.floor((t / 1000 / 60) % 60);
    var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
    var days = Math.floor(t / (1000 * 60 * 60 * 24));
    return {
        'total': t,
        'days': days,
        'hours': hours,
        'minutes': minutes,
        'seconds': seconds
    };
}

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function deleteCookie(cname) {
    document.cookie = cname + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
}


function countDown(secs, secsMax, elem) {

    var element = document.getElementById(elem);

    var t = getTimeRemaining(getEndTime(secs));
    element.innerHTML = "<strong>Tempo remanescente: </strong>";

    element.innerHTML += ('0' + t.hours).slice(-2);
    element.innerHTML += ":" + ('0' + t.minutes).slice(-2);
    element.innerHTML += ":" + ('0' + t.seconds).slice(-2);

    var perc = (secs * 100) / secsMax;
    perc = "" + (-1) * (perc - 100);

    element.innerHTML += "<br/>";
    element.innerHTML += '<div class="progress"><div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="' + perc + '" aria-valuemin="0" aria-valuemax="100" style="width:' + perc + '%"></div></div>';

    setCookie("seconds", secs, 1);

    if (secs < 1) {



        // element.innerHTML = '<h2><p style="text-align: center; color: red;">Terminou</p></h2>';

        // var image = "<div style=\"text-align:center\">";
        // image = image + "<img src=\"images/loadinfo.net.gif\"";
        // image = image + " alt=\"Proceeding to PayPal\" />";
        // image = image + "<br />Por favor espere enquanto o reediciona para os resultados...";
        // image = image + "</div>";

        var message = '<div style="text-align: center">';
        message = message + "<br /><p>Por favor espere enquanto o reediciona para os resultados...</p>";
        message = message + '</div>';

        $('#ajax-container').fadeOut(200, function () {
            // $(this).html(message).fadeIn(200, function () {
            saveAnswer();
            redirect2Results();
            // });
        });

    }

    secs--;

    timer = setTimeout('countDown(' + secs + ',' + secsMax + ',"' + elem + '")', 1000);
}


function redirect2Results() {

    clearTimeout(timer);
    deleteCookie("seconds");

    $("#timeoutinput").attr("name", "timeout");
    $("#timeoutinput").attr("value", "timeout");
    $("#finishnowinput").attr("name", "finish");
    $("#finishnowinput").attr("value", "finish");
    $('form#questionform').submit();

    // $("form#questionform").submit(function() {
    //     $(this).find('input[type="submit"]').prop("disabled", true);
    // })

    // $("#finishnowinput").attr("disabled", "disabled");


}

function checkAndSave() {
     //if ($('input[name=q_choice]:checked').val() != null) {
        saveAnswer();
     //}
}

function saveAnswer() {

    var q_choice = $('input[name=q_choice]:checked');

    if(q_choice.val() != null){
        var id = q_choice.attr('id');
        var item = id.split('_');

        $.ajax({
            type: 'POST',
            url: '/mod/save_answer',
            data: ({qid: item[1], answerid: item[2], label:item[3]}),
            success: function (data) {
                // alert("test "+data);
            },
            error: function(xhr, textStatus, error){
                // alert('An error has occurred ::from save answer ajax call --> ' + error);
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    }

}


