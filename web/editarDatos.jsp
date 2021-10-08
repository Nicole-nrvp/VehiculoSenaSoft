<%-- 
    Document   : editarDatos
    Created on : 7/10/2021, 03:23:37 PM
    Author     : Camilo
--%>

<%@page import="ModeloVO.DatosPersonalesVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%        
            DatosPersonalesVO datVO = (DatosPersonalesVO) request.getAttribute("DatosUsuario");
        if (datVO != null) {
                
            
        %>
        <center>
        <h1>Actualizar Datos</h1>
        <form method="POST" action="Datos">
            <label>DatoId</label>
            <input type="text" name="txtDatId"   value="<%=datVO.getDatId()%>"><br><br>
             <label>Nombre</label>
            <input type="text" name="txtDatNombre"  value="<%=datVO.getDatNombre()%>"><br><br>
            <label>Apellido</label>
            <input type="text" name="txtDatApellido"  value="<%=datVO.getDatApellido()%>"><br><br>
            <label>Tipo documento</label>
            <input type="text" name="txtDatTipoId" value="<%=datVO.getDatTipoId()%>"><br><br>
            <label>Documento</label>
            <input type="text" name="txtDatNumeroId" value="<%=datVO.getDatNumeroId()%>"><br><br>
            <label>Telefono</label>
            <input type="text" name="txtDatTelefono" name="txtDatTelefono" value="<%=datVO.getDatTelefono()%>"><br><br>
            <label>Correo</label>
            <input type="text" name="txtDatCorreo" name="txtDatCorreo" value="<%=datVO.getDatCorreo()%>"><br><br>
            <label>IdUsuario</label>
            <input type="text" name="txtUsuId" name="txtUsuId" value="<%=datVO.getUsuId()%>"><br><br>
            <button>Actualizar</button>
            <input type="hidden" name="opcion" value="2">
       
        
        </form></center>
           
    </body>
</html>
