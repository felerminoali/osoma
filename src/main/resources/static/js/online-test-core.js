/**
 * Created by feler on 7/21/2016.
 */
$(document).ready(function () {


    $('#qnext').on('click', function (e) {
        validateAnswer(e);
    });

    //$('#qfinish').on('click', function (e) {
        //if (validateAnswer(e)) {}
    //});

    function validateAnswer(e) {
        // if ($('input[name=q_choice]:checked').val() == null) {
        //
        //     var message = '<div class="alert alert-warning" role="alert">';
        //     message += '<p>Questão não respondida!</p>';
        //     message += '<div class="clearheight30"></div>';
        //     message += '<div class="dotted"></div>';
        //     message += '<p>Deve seleccionar pelo menos uma das respostas abaixo</p>';
        //     message += '</div>';
        //
        //     $(".failx").html(message);
        //     $(".failx").fadeOut(3000);
        //
        //     e.preventDefault();
        //     return false;
        // }
        return true;
    }

    function hasClass(element, className) {
        return ('' + element.className + '').indexOf('' + className + '') > -1;
    }


    if ($('.showlist').length > 0) {
        ($('.showlist').click(function () {

            var divSide = document.getElementById("side");

            if (hasClass(divSide, 'hidden')) {

                $("#main").removeClass("col-md-12");
                $("#main").addClass("col-md-10");

                $("#side").removeClass("hidden");

            } else {
                $("#main").removeClass("col-md-10");
                $("#main").addClass("col-md-12");

                $("#side").addClass("hidden");
            }

        }));
    }


    if ($('input[name=q_choice]').length > 0) {
        ($('input[name=q_choice]').change(function () {
            var q_choice = $('input[name=q_choice]:checked');
            var id = q_choice.attr('id');
            var item = id.split('_');

            var label = item[3];
            $('#answer_' + item[1]).html(label);
        }));
    }

    if ($('.t_finish').length > 0) {
        ($('.t_finish').click(function () {
            saveAnswer();

        }));
    }

    if ($('.next').length > 0) {
        ($('.next').click(function () {
            saveAnswer();
        }));
    }

    if ($('.prev').length > 0) {
        ($('.prev').click(function () {
            saveAnswer();
        }));
    }

    var modalConfirm = function(callback){

        $(".t_finish").on("click", function(){
            $("#mi-modal").modal('show');
        });

        $("#modal-btn-si").on("click", function(){
            callback(true);
            $("#mi-modal").modal('hide');
        });

        $("#modal-btn-no").on("click", function(){
            callback(false);
            $("#mi-modal").modal('hide');
        });
    };

    modalConfirm(function(confirm){
        if(confirm){
            saveAnswer();
            redirect2Results();
        }else{
        }
    });

});