<%-- 
    Document   : iniciarSesion
    Created on : 7/10/2021, 09:16:05 PM
    Author     : Valentina
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kavak | Sesión</title>
        <link href="assets/css/login.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>

    </head>

    <body>


        <form id="login" class="input-group-login" method="post" action="Usuario">

            <div class="login-page">
                <div class="form">

                    <img style="max-width: 200px;" class="img" src="assets/img/consensionario.jpg" alt=""/>    
                    <h2>INICIO DE SESIÓN</h2>
                    <h1>KAVAK</h1>

                    <div><%
                        if (request.getAttribute("mensajeError") != null) {  %>  

                        ${mensajeError}
                        <%} else {%>
                        <div style="color: red;">${mensajeExito}</div>
                        <% }%></div><br>

                      <input type="text"  class="txt" placeholder="Ingresar Usuario" name="textUsuario" required>

                   <input type="password"  class="txt" placeholder="Ingresar Clave" name="textClave" required>

                    <input type="hidden" id="opcion" name="opcion" value="3">
                    <button>Iniciar Sesión</button>
                    <br>   
                    <br> 
                    <a style="text-decoration: none" class="forgot-pass" href="#">Olvido su <span>contraseña</span></a>


                    <br>
                    <br>
                    




                </div>
            </div>
        </form>












    </body>
</html>
