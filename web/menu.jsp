<%-- 
    Document   : menu
    Created on : 7/10/2021, 04:18:35 PM
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
        
        <form method="POST" action="Datos" >
             <input type="text" name="txtUsuId">
            <input type="hidden" name="opcion" value="1">
            <input type="submit" value="Editar Datos">
        </form>
        
        <form method="POST" action="Datos" >
             <input type="text" name="txtUsuId">
            <input type="hidden" name="opcion" value="3">
            <input type="submit" value="Inactivar">
        </form>
        
        <a href="registrarse.jsp"><input type="submit" value="Registrar"></a>
        <%            if (request.getAttribute("mensajeError") != null) {  %>  

            ${mensajeError}
            <%} else {%>
            <div style="color: darkseagreen;">${mensajeExito}</div>
            <% }%>
    </body>
</html>
