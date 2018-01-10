<%@page import="Daos.Entidad_Cliente"%>
<%@page import="Modelos.Modelo_Cliente"%>
<%
    Modelo_Cliente modelo_Cliente = new Modelo_Cliente();
    Entidad_Cliente cliente = modelo_Cliente.buscarId(Integer.parseInt(request.getParameter("idCliente")));
%>

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
        <title>Modificar Cliente</title>
    </head>
    <body>
        <h1>Modificar Cliente</h1>
        <form method="POST" id="formCliente" name="formCliente" action="Servlet_Cliente">
            <hr>

            <input type="text" name="IdCliente" class="form-control" style="width: 20%; display: none" value="<%= cliente.getIdCliente()%>">

            <label>Nombre:</label>
            <input type="text" name="txt_nombreCliente" class="form-control" style="width: 20%" value="<%= cliente.getNom_cliente()%>">

            <label>Cedula:</label>
            <input type="text" name="txt_cedulaCliente" class="form-control" style="width: 20%" value="<%= cliente.getNom_cedula()%>">

            <input type="text" name="gestion" style="display:none" value="modificar"/>
            <br>
            <input type="submit" class="btn btn-warning" value="Modificar" style="width: 20%" id="btnModificar"/>

        </form>
        <br>
        <a href="listarCliente.jsp" class="btn btn-danger" style="width: 20%">Regresar</a>
    </body>

    <script>


        $('#btnModificar').click(function (e) {
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
                alert('Error al Modificar Cliente');
            });

        });


    </script>
</html>
