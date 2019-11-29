/**
 * Created by feler on 7/21/2016.
 */
$(document).ready(function () {


    $('#qnext').on('click', function (e) {
        validateAnswer(e);
    });

    $('#qfinish').on('click', function (e) {
        if(validateAnswer(e)){
            redirect2Results();
        }
    });

    function validateAnswer(e) {
        if ($('input[name=q_choice]:checked').val() == null) {

            var message = '<div class="alert alert-warning" role="alert">';
            message += '<p>Questão não respondida!</p>';
            message += '<div class="clearheight30"></div>';
            message += '<div class="dotted"></div>';
            message += '<p>Deve seleccionar pelo menos uma das respostas abaixo</p>';
            message += '</div>';

            $(".failx").html(message);
            $(".failx").fadeOut(3000);

            e.preventDefault();
            return false;
        }
        return  true;
    }

});