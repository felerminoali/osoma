/**
 * Created by feler on 9/2/2016.
 */
$(document).ready(function () {

    initBinds();


    function initBinds() {

        // $('input').on('click', function () {
        $('.tickbox').on('click', function () {
            var params = [];
            $('.tickbox input:checked').each(function () {

                var values = $(this).val();
                var item = values.split('_');
                var param = item[0] + "=" + item[1] + "&";

                params.push(param);
            });

            var url = "/?";
            for (i = 0; i < params.length; i++) {
                url = url + params[i];
            }

            url = url.substring(0, url.length - 1);
            //alert(document.URL);
            redirect(url);
        });

    }

    function redirect(url) {
        window.location = url;
    }

    if ($('.btn_more_years').length > 0) {
        ($('.btn_more_years').click(function () {

            var last_year = $(this).data("year");

            $.ajax({
                url: "/mod/load_more_years.php",
                method: "POST",
                data: {last_year: last_year},
                dataType: "html",
                success: function (data) {
                    if (data != '') {
                        $('.remove_row_year').remove();
                        var content = document.getElementById("years_more").innerHTML;
                        $('.load_more_years').html(content + data);
                        initBinds();
                    }
                    else {
                        $('.btn_more_years').html("No Data");
                    }
                },
                error: function () {
                    alert('An error has occurred');
                }
            });
        }));
    }


    if ($('.btn_more_unis').length > 0) {
        ($('.btn_more_unis').click(function () {

            var last_uni = $(this).data("uni");

            $.ajax({
                url: "/mod/load_more_uni.php",
                method: "POST",
                data: {last_uni: last_uni},
                dataType: "html",
                success: function (data) {
                    if (data != '') {
                        $('.remove_row_uni').remove();
                        var content = document.getElementById("uni_more").innerHTML;
                        $('.load_more_uni').html(content + data);
                        initBinds();
                    }
                    else {
                        $('.btn_more_unis').html("No Data");
                    }
                },
                error: function () {
                    alert('An error has occurred');
                }
            });
        }));
    }

    if ($('.btn_more_exams').length > 0) {
        ($('.btn_more_exams').click(function () {

            var last_exam = $(this).data("exam");

            $.ajax({
                url: "/mod/load_more_exams.php",
                method: "POST",
                data: {last_exam: last_exam},
                dataType: "html" +
                    "+4",
                success: function (data) {
                    if (data != '') {
                        $('.remove_row_exam').remove();
                        var content = document.getElementById("exam_more").innerHTML;
                        $('.load_more_exam').html(content + data);
                        initBinds();
                    }
                    else {
                        $('.btn_more_exams').html("No Data");
                    }
                },
                error: function () {
                    alert('An error has occurred');
                }
            });
        }));
    }


    if ($('.change-lang').length > 0) {
        ($('.change-lang').click(function () {


            var trigger = $(this);

            var selectedOption = trigger.attr("hreflang");
            if (selectedOption != '') {
                window.location.replace('?lang=' + selectedOption);
            }
            return false;

        }));
    }



});