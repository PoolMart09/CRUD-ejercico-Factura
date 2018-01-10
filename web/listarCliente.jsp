<%-- 
    Document   : listarCliente
    Created on : 20/12/2017, 05:14:31 PM
    Author     : gaboo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link href="Librerias/datatables.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="Librerias/datatables.min.js" type="text/javascript"></script>
    </head>
    <body>
        <br>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover" cellspacing="5" cellpadding="5" id="tbCliente">
                <thead>
                    <tr>
                        <th>Codigo</th>
                        <th>Nombre</th>
                        <th>Cedula</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
            </table>
            <h3><a href="NuevoCliente.jsp" class="btn btn-success">Agregar Cliente</a></h3>
            <script>

                BuscarCliente();
                function BuscarCliente() {

                    var table = $('#tbCliente').DataTable({
                        "ajax": "Servlet_ClienteBuscar",
                        destroy: true,
                        empty: true,
                        "columnDefs": [{
                                "targets": -2,
                                "data": null,
                                "width": "1%",
                                "defaultContent": "<button id='btnModificar' class='btn btn-warning' type='button'><i class='fa fa-pencil'></i> Modificar</button>"
                            },
                            {
                                "targets": -1,
                                "data": null,
                                "width": "1%",
                                "defaultContent": "<button id='btnEliminar' class='btn btn-danger' type='button'><i class='fa fa-trash'></i> Eliminar</button>"
                            },
                            {
                                "targets": [0],
                                "visible": false,
                                "searchable": false
                            }],
                        "language": {

                            "sProcessing": "Procesando...",
                            "sLengthMenu": "Mostrar _MENU_ registros",
                            "sZeroRecords": "No se encontraron resultados",
                            "sEmptyTable": "Ningún dato disponible en esta tabla",
                            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                            "sInfoPostFix": "",
                            "sSearch": "Buscar:",
                            "sUrl": "",
                            "sInfoThousands": ",",
                            "sLoadingRecords": "Cargando...",
                            "oPaginate": {
                                "sFirst": "Primero",
                                "sLast": "Último",
                                "sNext": "Siguiente",
                                "sPrevious": "Anterior"
                            },
                            "oAria": {
                                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                            }

                        }
                    });

                    $('#tbCliente tbody').on('click', '#btnModificar', function () {
                        var data = table.row($(this).parents('tr')).data();
                        location.href = 'ModificarCliente.jsp?idCliente=' + data[0];

                    });

                    $('#tbCliente tbody').on('click', '#btnEliminar', function () {
                        var data = table.row($(this).parents('tr')).data();

                        $.ajax({
                            type: "POST",
                            url: "Servlet_Cliente",
                            data: {txt_idCliente: data[0], gestion: 'eliminar'},
                            success: function (responseText) {
                                alert(responseText);
                                location.href = 'listarCliente.jsp';
                            }
                        }).fail(function (xhr, ajaxOptions, thrownError) {
                            alert('Error al Eliminar Cliente');
                        });
                    });
                }
            </script>
    </body>
</html>
