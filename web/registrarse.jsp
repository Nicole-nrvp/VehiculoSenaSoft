<%-- 
    Document   : registrarse
    Created on : 7/10/2021, 06:18:20 PM
    Author     : Camilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Datos" method="POST">
            <center>
                <h1>Registrarse</h1>
             <input type="hidden" name="txtDatId" value="nulo"><br><br>
            <label>Nombre</label>
           
            <input type="text" name="txtDatNombre"><br><br>
            <label>Apellido</label>
            <input type="text" name="txtDatApellido"><br><br>
            <label>Tipo documento</label>
            <input type="text" name="txtDatTipoId"><br><br>
            <label>Documento</label>
            <input type="text" name="txtDatNumeroId"><br><br>
            <label>Telefono</label>
            <input type="text" name="txtDatTelefono"><br><br>
            <label>Correo</label>
            <input type="text" name="txtDatCorreo"><br><br>
            <label>IdUsuario</label>
            <input type="text" name="txtUsuId"><br><br>
            <button>Registrarse</button>
            <input type="hidden" name="opcion" value="3">
            </center>
        </form>
    </body>
</html>
