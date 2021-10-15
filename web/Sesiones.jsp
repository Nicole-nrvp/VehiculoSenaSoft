<%-- 
    Document   : sesiones
    Created on : 7/10/2021, 09:58:43 PM
    Author     : Valentina
--%>

<%@page import="ModeloDAO.DatosPersonalesDAO"%>
<%@page import="ModeloVO.UsuarioVO"%>
<%@page import="ModeloVO.DatosPersonalesVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
    response.setDateHeader("Expires", 0);

%>

<%    HttpSession buscarSesion = (HttpSession) request.getSession();
    String usuario = "";
    String usuarioId = "";
    String Nombre = "";
    String Apellido = "";
    String Telefono = "";
    String Correo = "";

    if (buscarSesion.getAttribute("UsuarioConsultado") == null) {
        request.getRequestDispatcher("iniciarSesion.jsp").forward(request, response);
    } else {

        UsuarioVO usuVO2 = (UsuarioVO) buscarSesion.getAttribute("UsuarioConsultado");
        usuarioId = usuVO2.getUsuId();
    }

%>

<%    DatosPersonalesVO datpVO = new DatosPersonalesVO();
        DatosPersonalesDAO datDAO = new DatosPersonalesDAO(datpVO);
        datpVO = datDAO.ConsultarRegistros(usuarioId);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </head>
    <body>


    </body>
</html>

