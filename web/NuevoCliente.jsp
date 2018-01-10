<%-- 
    Document   : NuevoCliente
    Created on : 19/12/2017, 07:13:53 PM
    Author     : gaboo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="http://somewebsite.com/css/bootstrap.css" rel="stylesheet">
        <title>Nuevo Cliente</title>
    </head>
    <body>
        <h1>Ingresar un Nuevo Cliente</h1>
        <form method="POST" id="formCliente" name="formCliente" action="Servlet_Cliente">
            <hr>
            <input type="text" name="txt_idCliente" class="form-control" style="display: none" value="0">
            <label>Nombre:</label>
            <input type="text" name="txt_nombreCliente" class="form-control" style="width: 20%">

            <label>Cedula:</label>
            <input type="text" name="txt_cedulaCliente" class="form-control" style="width: 20%">

            <input type="text" name="gestion" style="display:none" value="guardar" style="width: 20%"/>
            <br>
            <input type="submit" class="btn btn-success" value="Guardar" style="width: 20%" id="btnGuardar"/>

        </form>
        <br>
        <a href="listarCliente.jsp" class="btn btn-warning" style="width: 20%">Regresar</a>
    </body>
    
        <script>


        $('#btnGuardar').click(function (e) {
            e.preventDefault();
            var data = $('#formCliente').serialize();

            $.ajax({
                type: "POST",
                url: "Servlet_Cliente",
                data: data,
                success: function (responseText) {
                    alert(responseText);
                    location.href = 'listarCliente.jsp';
                }
            }).fail(function (xhr, ajaxOptions, thrownError) {
                alert('Error al Guardar Cliente');
            });

        });


    </script>
</html>
