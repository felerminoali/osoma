/**
 * Created by feler on 7/21/2016.
 */
$(document).ready(function () {


    initComponents();


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

    function initComponents() {

        $('#qnext').on('click', function (e) {
            validateAnswer(e);
        });

        //$('#qfinish').on('click', function (e) {
        //if (validateAnswer(e)) {}
        //});


        if ($('.showlist').length > 0) {
            ($('.showlist').click(function () {

                // var divSide = document.getElementById("side");
                //
                // if (hasClass(divSide, 'hidden')) {
                //
                //
                //
                //     if ($('#main').hasClass('col-md-12')) {
                //         alert('entrei');
                //         $("#main").removeClass('col-md-12');
                //     }
                //
                //
                //     $("#main").addClass("col-md-10");
                //     $("#side").removeClass("hidden");
                // } else {
                //     $("#main").removeClass("col-md-10");
                //     $("#main").addClass("col-md-12");
                //     $("#side").addClass("hidden");
                // }

            }));
        }

        if ($('.t_finish').length > 0) {
            ($('.t_finish').click(function () {
                saveAnswer();

            }));
        }

        if ($('.next').length > 0) {
            ($('.next').click(function () {
                fetchQuestions(1);
                saveAnswer();
            }));
        }

        if ($('.prev').length > 0) {
            ($('.prev').click(function () {
                fetchQuestions(-1);
                saveAnswer();
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

        var modalConfirm = function (callback) {

            $(".t_finish").on("click", function () {
                $("#mi-modal").modal('show');
            });

            $("#modal-btn-si").on("click", function () {
                callback(true);
                $("#mi-modal").modal('hide');
            });

            $("#modal-btn-no").on("click", function () {
                callback(false);
                $("#mi-modal").modal('hide');
            });
        };

        modalConfirm(function (confirm) {
            if (confirm) {
                saveAnswer();
                redirect2Results();
            } else {
            }
        });
    }



    function fetchQuestions(pointer) {

        var answerId = /*[[${session.313}]*/ null;

        alert(answerId);

        var examID = $('#examid').val();
        var index = parseInt($('#index').val()) + pointer;
        var url = "/exam/" + examID;

        $.ajax({
            url: url,
            method: "GET",
            // data: {examID: examID, index: index},
            data: {examID: examID},
            dataType: "json",
            success: function (data) {

                $("#index").val(index);
                $("#q_index").html(index+1);


                var media_img = '';
                if (data.questionList[index].image != null) {
                    media_img = '<a href="#"><img class="media-object" src="' + data.questionList[index].image + '" alt="questions.image"></a>';
                }

                $(".q_img").html(media_img);
                $('.q_question').html(data.questionList[index].question);


                var htmlCaseOfStudy = data.questionList[index].caseofstudy;
                var shortText = '';
                if (htmlCaseOfStudy !== null) {
                    var noHtmlCaseOfStudy = $(htmlCaseOfStudy);
                    shortText = noHtmlCaseOfStudy.text().substring(0, 120);
                    $('#q_caseofstudy').html(data.questionList[index].caseofstudy);
                    shortText += '<a href="#" data-toggle="modal" data-target="myModal">Monstrar mais</a>';
                }

                $('.casestudy').html(shortText);

                var str = '<table width="100%">';

                for (var i = 0; i < data.questionList[index].choiceList.length; i++) {
                    var obj = data.questionList[index].choiceList[i];

                    str += '<div class="media">';
                    str += '<div class="media-body">';
                    str += '<div class="clear"></div>';
                    str += '<div class="ans_select">';
                    str += '<input type="radio" id="q_' + data.questionList[index].id + '_' + obj.id + '_' + String.fromCharCode(65 + i) + '" name="q_choice"/>';
                    str += '</div>';
                    str += '<div class="ans_content editor">';
                    str += '<label for="q_' + data.questionList[index].id + '_' + obj.id + '_' + String.fromCharCode(65 + i) + '">';
                    str += '<span id="' + obj.id + '" rel="' + String.fromCharCode(65 + i) + '">' + String.fromCharCode(65 + i) + '.' + obj.answer + '</span>';
                    str += '</label>';
                    str += '</div>';
                    str += '</div>';
                    str += '</div>';
                }

                str += '</table>';
                $(".answersDiv").html(str);

                var q_response = '';
                for (var i = 0; i < data.questionList.length; i++) {
                    q_response += '<a href="#" class="list-group-item">';
                    q_response += '<span class="badge pull-left">' + (i + 1) + '</span>&nbsp;';
                    q_response += '<span id="answer_' + data.questionList[i].id + '"></span>';
                    q_response += '</a>';
                }

                $(".q_response").html(q_response);


                var btn_prev = '';

                if(index !== 0){
                    btn_prev += '<a id="qprev" class="btn btn-danger prev"><i class="glyphicon glyphicon-chevron-left"></i> Anterior</a>';
                }
                $('.prevbox').html(btn_prev);

                var div_next = '';
                if(data.questionList.length-1 !== index){
                    div_next += '<a id="qnext" class="btn btn-danger next">Seguinte<i class="glyphicon glyphicon-chevron-right"></i></a>';
                }
                div_next += '<a href="#" id="qfinish" class="btn btn-success t_finish">Terminar<i class="glyphicon glyphicon-chevron-up"></i></a>';
                div_next += '<a href="#" class="btn btn-info showlist" id="btnShow">Respostas</a>';
                $('.nextbox').html(div_next);

                initComponents();
            },
            error: function (xhr, textStatus, error) {
                // alert('An error has occurred ::from save answer ajax call --> ' + error);
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });


    }

});



