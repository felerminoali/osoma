

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

    if ($('#closeModal').length > 0) {
        ($('#closeModal').click(function () {
            // window.location.href = "/ubs/preregistration";
        }));
    }


    if ($('.close').length > 0) {
        ($('.close').click(function () {
            // window.location.href = "/ubs/preregistration";
        }));
    }


    function reload_table() {
        window.location.href = "/ubs/preregistration";
        // table.ajax.reload(null, false); //reload datatable ajax
    }


    function save() {

        var url = "/user/" + save_method;

        // var valid = $('#form').bootstrapValidator({
        //     message: 'This value is not valid',
        //     feedbackIcons: {
        //         valid: 'glyphicon glyphicon-ok',
        //         invalid: 'glyphicon glyphicon-remove',
        //         validating: 'glyphicon glyphicon-refresh'
        //     },
        //     fields: {
        //         fname: {
        //             validators: {
        //                 notEmpty: {
        //                     message: 'Este campo não deve estar vazio'
        //                 },
        //             }
        //         },
        //         lname: {
        //             validators: {
        //                 notEmpty: {
        //                     message: 'Este campo não deve estar vazio'
        //                 },
        //             }
        //         },
        //         province: {
        //             validators: {
        //                 notEmpty: {
        //                     message: 'Este campo não deve estar vazio'
        //                 },
        //             }
        //         },
        //         district: {
        //             validators: {
        //                 notEmpty: {
        //                     message: 'Este campo não deve estar vazio'
        //                 },
        //             }
        //         },
        //         dob: {
        //             validators: {
        //                 notEmpty: {
        //                     message: 'Este campo não deve estar vazio'
        //                 },
        //             }
        //         },
        //         gender: {
        //             validators: {
        //                 notEmpty: {
        //                     message: 'Este campo não deve estar vazio'
        //                 },
        //             }
        //         },
        //         contact: {
        //             validators: {
        //                 notEmpty: {
        //                     message: 'Este campo não deve estar vazio'
        //                 },
        //                 callback: {
        //                     message: 'Este contacto já está registado no sistema',
        //                     callback: function (value, validator) {
        //                         return find('contact', value);
        //                     }
        //                 }
        //             }
        //         },
        //         institution: {
        //             validators: {
        //                 notEmpty: {
        //                     message: 'Este campo não deve estar vazio'
        //                 },
        //             }
        //         },
        //         gpa: {
        //             validators: {
        //                 integer: {
        //                     message: 'O Nota final deve ser um número inteiro'
        //                 }
        //             }
        //         },
        //         email: {
        //             validators: {
        //                 notEmpty: {
        //                     message: 'Este campo não deve estar vazio'
        //                 },
        //                 emailAddress: {
        //                     message: 'Fornceu um email inválido'
        //                 },
        //
        //                 callback: {
        //                     message: 'Este email já está registado no sistema',
        //                     callback: function (value, validator) {
        //                         return find('email', value);
        //                     }
        //                 }
        //
        //             }
        //         },
        //     }
        // }).isValid();


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

                // else {
                //     for (var i = 0; i < data.inputerror.length; i++) {
                //         $('[name="' + data.inputerror[i] + '"]').parent().parent().addClass('has-error'); //select parent twice to select div form-group class and add has-error class
                //         $('[name="' + data.inputerror[i] + '"]').next().text(data.error_string[i]); //select span help-block class set text error string
                //     }
                // }

                $('#btnSave').text('save'); //change button text
                $('#btnSave').attr('disabled', false); //set button enable


            },
            error: function (jqXHR, textStatus, errorThrown) {
                // alert('Error adding / update data');
                // $('#btnSave').text('save'); //change button text
                // $('#btnSave').attr('disabled', false); //set button enable

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
                $('[name="fname"]').val(data.name);
                $('[name="lname"]').val(data.lastName);
                $('[name="gender"]').val(data.gender.id);
                $('[name="email"]').val(data.email);
                $('[name="contact"]').val(data.contact);

                if(data.gpa!=null) {
                    $('[name="gpa"]').val(data.gpa);
                }

                if(data.highSchoolName!=null){
                    $('[name="instituion"]').val(data.highSchoolName);
                }

                if(data.maritalStatus!=null) {
                    $('[name="ms"]').val(data.maritalStatus.id);
                }

                if(data.district.province!=null) {
                    $('[name="province"]').val(data.district.province.id);
                    $('[name="district"]').val(data.district.id);
                }

                if(data.dob!=null) {
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
        // $('.form-group').removeClass('has-error'); // clear error class
        // $('.form-control-feedback').removeClass('glyphicon glyphicon-remove');

        $('.form-group').removeClass('has-error has-feedback');
        $('.form-group').find('small.help-block').hide();
        $('.form-group').find('i.form-control-feedback').hide();

        // $('.help-block').empty(); // clear error string
        $('#formModal').modal('show'); // show bootstrap modal
        $('.modal-title').text('Adicionar Candidato'); // Set Title to Bootstrap modal title
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
        // "columnDefs": [
        //     {
        //         "targets": [ -1 ], //last column
        //          // "orderable": false, //set not orderable
        //     },
        // ],

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
    // $("div.toolbar").html('<h2>Contas</h2>');
});

//datepicker
$('.datepicker').datepicker({
    autoclose: true,
    format: "dd/mm/yyyy",
    todayHighlight: true,
    orientation: "top auto",
    todayBtn: true,
    todayHighlight: true,
});


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

function validate() {

}


