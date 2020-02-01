var save_method; //for save method string
var table;

$(document).ready(function () {

    function init() {



        var editBtn = document.getElementsByClassName('edit');

        for (var i = 0; i < editBtn.length; i++) {
            editBtn[i].addEventListener("click", function () {
                var id = $(this).attr('rel');
                edit_candidate(id);
            }, false);
        }

        var deleteBtn = document.getElementsByClassName('delete');

        for (var i = 0; i < deleteBtn.length; i++) {
            deleteBtn[i].addEventListener("click", function () {
                var id = $(this).attr('rel');
                delete_candidate(id);
            }, false);
        }


        var viewBtn = document.getElementsByClassName('view');

        for (var i = 0; i < viewBtn.length; i++) {
            viewBtn[i].addEventListener("click", function () {
                var id = $(this).attr('rel');
                add_course(id);
            }, false);
        }

        var removeBtn = document.getElementsByClassName('remove-course');
        for (var i = 0; i < removeBtn.length; i++) {
            removeBtn[i].addEventListener("click", function () {
                var id = $(this).attr('rel');
                var user_course_year = id.split("_");
                remove_course(user_course_year[0], user_course_year[1], user_course_year[2]);
            }, false);
        }


    }

    if ($('#province').length > 0) {
        selectDistrict();
        $('#province').bind('change', function (e) {
            selectDistrict();
        });
    }

    if ($('#btn-add').length > 0) {
        ($('#btn-add').click(function () {
            add_candidate();
        }));
    }

    if ($('#btn-save').length > 0) {
        ($('#btn-save').click(function () {
            save();
        }));
    }

    if ($('#btn-add-course').length > 0) {
        ($('#btn-add-course').click(function () {
            var user = $('[name="user"]').val();
            var course = $('[name="course"]').val();
            save_course(user, course);
        }));
    }

    if ($('.close').length > 0) {
        ($('.close').click(function () {
            // window.location.href = "/ubs/preregistration";
        }));
    }

    table = $('#tbluser').DataTable({
        // "processing": true, //Feature control the processing indicator.
        "serverSide": true, //Feature control DataTables' server-side processing mode.
        "order": [], //Initial no order.

        // Load data for the table's content from an Ajax source
        "ajax": {
            "url": "/users/preregisted",
            "complete": function (xhr, responseText) {
                init();
                console.log(xhr);
                console.log(responseText); //*** responseJSON: Array[0]
            }

        },

        //Set column definition initialisation properties.
        "columnDefs": [
            {
                "targets": [-1], //last column
                "orderable": false, //set not orderable
            },
        ],
        "columns": [
            {"data": "count"},
            {"data": "code"},
            {"data": "name"},
            {"data": "email"},

            // {"data": "contact"},
            {"data": "age"},
            {"data": "province"},
            {"data": "action"}
        ],

        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ],
        "scrollY": "35vh",
        "scrollCollapse": true,

        "searching": true,
        "paging": true,
        "info": false,
        "lengthMenu": false,
        "language": {
            "lengthMenu": "Mostrar _MENU_ itens por página",
            "zeroRecords": "Não foi encontrado nenhum registo",
            "info": "Mostrando página _PAGE_ de _PAGES_",
            "infoEmpty": "Nenhum registo encontrado",
            "infoFiltered": "(fitrados apartir _MAX_ dos registos)",
            "paginate": {
                "first": "Primeiro",
                "last": "Último",
                "next": "Próximo",
                "previous": "Anterior"
            },
            "search": "Pesquisar: "
        }
    });
    $('.dataTables_length').addClass('bs-select');

    function remove_course(user, course, year) {
        $.ajax({
            url: "/course_user/delete/" + user + "/" + course + "/" + year,
            type: "POST",
            data: ({user: user, course: course, year: year}),
            dataType: "JSON",
            success: function (data) {
                if (data.status) {
                    $('#tblcourse').empty();
                    if (data.courses.length > 0) {
                        fill_table(data);
                    }
                }
                init();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert('Error deleting data');
                console.log(jqXHR.statusText);
                console.log(textStatus);
                console.log(errorThrown);
            }
        });
    }

    function save_course(user, course) {

        $.ajax({
            url: "/course/add/" + user + "/" + course,
            type: "POST",
            data: ({user: user, course: course}),
            dataType: "JSON",
            success: function (data) {
                if (data.status) {
                    $('#tblcourse').empty();
                    $("#alert").addClass("hidden");
                    if (data.courses.length > 0) {
                        fill_table(data);
                    }
                } else {
                    $("#alert").removeClass("hidden");
                }
                init();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert('Error deleting data');
                console.log(jqXHR.statusText);
                console.log(textStatus);
                console.log(errorThrown);
            }
        });
    }
});

//datepicker
$('.datepicker').datepicker({
    autoclose: true,
    format: "yyyy-mm-dd",
    todayHighlight: true,
    orientation: "top auto",
    todayBtn: true,
    todayHighlight: true,
});


function fill_table(data) {

    for (var i = 0; i < data.courses.length; i++) {
        var html = '<tr>';
        html += '<td>' + data.courses[i].course.name + ' ' + data.courses[i].course.period.description + '</td>';
        html += '<td style="text-align: center"><a class="btn btn-sm btn-danger remove-course" href="#" rel="' + data.courses[i].user.id + '_' + data.courses[i].course.id + '_' + data.courses[i].userCoursePK.year + '" title="Remover"><i class="glyphicon glyphicon-remove"></i> Remover</a></td>';
        html += '</tr>';
        $('#tblcourse').prepend(html);
    }
}



function add_course(id) {

    $('[name="user"]').val(id);

    $('.form-group').removeClass('has-error has-feedback');
    $('.form-group').find('small.help-block').hide();
    $('.form-group').find('i.form-control-feedback').hide();
    $("#alert").addClass("hidden");

    $('.help-block').empty(); // clear error string
    $('#formModalCourses').modal('show'); // show bootstrap modal
    $('.modal-title').text('Adicionar Cursos'); // Set Title to Bootstrap modal title


}

function reload_table() {
    window.location.href = "/ubs/preregistration";
    //table.ajax.reload(null, false); //reload datatable ajax
    // $('#tbluser').ajax.reload(null, false); //reload datatable ajax
    // $('#tbluser').DataTable().ajax.reload();
}

function delete_candidate(id) {
    if (confirm('Tem certeza que deseja remover este dado?')) {
        // ajax delete data to database
        $.ajax({
            url: "/user/delete/" + id,
            type: "POST",
            dataType: "JSON",
            success: function (data) {
                //if success reload ajax table
                $('#formModal').modal('hide');
                reload_table();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert('Error deleting data');
            }
        });

    }
}

function save() {

    var url = "/user/" + save_method;

    $('.form-group').removeClass('has-error has-feedback');
    $('.form-group').find('small.help-block').hide();
    $('.form-group').find('i.form-control-feedback').hide();
    $('.help-block').empty(); // clear error string

    $('#btn-save').text('saving...'); //change button text
    $('#btn-save').attr('disabled', true); //set button disable

    // ajax adding data to database
    $.ajax({
        url: url,
        type: "POST",
        data: $('#form').serialize(),
        dataType: "JSON",
        success: function (data) {

            if (data.status) //if success close modal and reload ajax table
            {
                $('#formModal').modal('hide');
                reload_table();
            }

            else {
                for (var i = 0; i < data.inputerror.length; i++) {
                    $('[name="' + data.inputerror[i].field + '"]').parent().addClass('has-error'); //select parent twice to select div form-group class and add has-error class
                    $('[name="' + data.inputerror[i].field + '"]').next().text(data.inputerror[i].defaultMessage); //select span help-block class set text error string
                }
            }

            $('#btn-save').text('save'); //change button text
            $('#btn-save').attr('disabled', false); //set button enable


        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert('Error adding / update data');
            console.log(jqXHR.statusText);
            console.log(textStatus);
            console.log(errorThrown);
            $('#btn-save').text('save'); //change button text
            $('#btn-save').attr('disabled', false); //set button enable

        }
    });
}

function edit_candidate(id) {
    save_method = 'update';

    $('.form-group').removeClass('has-error'); // clear error class
    $('.form-group').removeClass('has-error'); // clear error class
    $('.form-control-feedback').removeClass('glyphicon glyphicon-remove');
    $('.help-block').empty(); // clear error string


    //Ajax Load data from ajax
    $.ajax({
        url: "/user/" + id,
        type: "GET",
        dataType: "JSON",
        success: function (data) {
            $('[name="id"]').val(data.id);
            $('[name="name"]').val(data.name);
            $('[name="lastName"]').val(data.lastName);
            $('[name="gender"]').val(data.gender.id);
            $('[name="email"]').val(data.email);
            $('[name="contact"]').val(data.contact);

            if (data.gpa != null) {
                $('[name="gpa"]').val(data.gpa);
            }

            if (data.highSchoolName != null) {
                $('[name="highSchoolName"]').val(data.highSchoolName);
            }

            if (data.maritalStatus != null) {
                $('[name="maritalStatus"]').val(data.maritalStatus.id);
            }

            if (data.district.province != null) {
                $('[name="province"]').val(data.district.province.id);
                selectDistrict();
                $('[name="district"]').val(data.district.id);
            }

            if (data.dob != null) {
                $('[name="dob"]').datepicker('update', data.dob);
            }

            $('#formModal').modal('show'); // show bootstrap modal
            $('.modal-title').text('Editar Candidato'); // Set Title to Bootstrap modal title

        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR.statusText);
            console.log(textStatus);
            console.log(errorThrown);
        }
    });

}

function add_candidate() {

    save_method = 'add';

    $('#form')[0].reset(); // reset form on modals
    $('select').prop('selectedIndex', -1);

    $('.form-group').removeClass('has-error has-feedback');
    $('.form-group').find('small.help-block').hide();
    $('.form-group').find('i.form-control-feedback').hide();
    $('.help-block').empty(); // clear error string
    $('#formModal').modal('show'); // show bootstrap modal
    $('.modal-title').text('Adicionar Candidato'); // Set Title to Bootstrap modal title
}

function find(type, value) {

    if (type == 'email' && !validateEmail(value)) {
        return false;
    }

    if (type == 'contact' && !validateContact(value)) {
        return false;
    }

    var url = '/users/' + type + "/" + value;
    var score = false;

    $.ajax({
        url: url,
        method: "GET",
        data: ({type: type, value: value}),
        async: false,
        dataType: "json",
        success: function (data) {
            score = true;
            if (Object.keys(data).length != 0) {
                score = false;
            }
        },
        error: function (xhr, textStatus, error) {
            // alert('An error has occurred ::from save answer ajax call --> ' + error);
            console.log(xhr.statusText);
            console.log(textStatus);
            console.log(error);
        }
    });
    return score;
}

function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function validateContact(contact) {
    return contact.length >= 9;
}

function selectDistrict() {

    var id = $('#province').val();
    var url = "/districts/" + id;

    $.ajax({
        url: url,
        method: "GET",
        data: {id: id},
        dataType: "json",
        success: function (data) {
            $('#district').empty();
            $.each(data, function (index, value) {
                // APPEND OR INSERT DATA TO SELECT ELEMENT.
                $('#district').append('<option value="' + value.id + '">' + value.district + '</option>');
            });
        },
        error: function (xhr, textStatus, error) {
            // alert('An error has occurred ::from save answer ajax call --> ' + error);
            console.log(xhr.statusText);
            console.log(textStatus);
            console.log(error);
        }
    });
}



