<%-- 
    Document   : index
    Created on : 27/09/2021, 07:31:10 AM
    Author     : Valentina
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">

        <title>Kavak | Home</title>
        <meta content="Responsive admin theme build on top of Bootstrap 4" name="description" />
        <meta content="Themesdesign" name="author" />
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!--Morris Chart CSS -->
        <link rel="stylesheet" href="../plugins/morris/morris.css">

        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/metismenu.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css">
        <link href="assets/css/style_1.css" rel="stylesheet" type="text/css"/>
        <script src="Validaciones.js" type="text/javascript"></script>

    </head>

    <body> 

        <div class="header-bg">
            <!-- Navigation Bar-->
            <header id="topnav">
                <div class="topbar-main">
                    <div class="container-fluid">

                        <!-- Logo-->
                        <div>



                            <a href="index.jsp" class="logo">
                                <span class="logo-light">
                                    <i class="mdi mdi-camera-control"></i> Kavak
                                </span>
                            </a>
                        </div>
                        <!-- End Logo-->

                        <div class="menu-extras topbar-custom navbar p-0">
                            <h6 style="color: #ffffff;">Bienvenid@:  <%=datpVO.getDatNombre() + " " + datpVO.getDatApellido()%></h6>

                            <ul class="navbar-right ml-auto list-inline float-right mb-0">
                                <!-- language-->
                                <li class="dropdown notification-list list-inline-item d-none d-md-inline-block">

                                    <form>
                                        <label style="color: #ffffff;">Roles:</label>
                                        <select name="textCatId" onchange="redireccion(value)">
                                            <option>Seleccione...</option>
                                            <%                            UsuarioDAO usuDAO = new UsuarioDAO();
                                                UsuarioVO usuVO = new UsuarioVO();
                                                ArrayList<UsuarioVO> listaRol = (ArrayList<UsuarioVO>) buscarSesion.getAttribute("rol");
                                                for (int i = 0; i < listaRol.size(); i++) {
                                                    usuVO = listaRol.get(i);
                                            %>
                                            <option value="<%=usuVO.getRol()%>"><%=usuVO.getRol()%></option>
                                            <%}%>
                                        </select>
                                    </form>

                                </li>

                                <!-- full screen -->
                                <li class="dropdown notification-list list-inline-item d-none d-md-inline-block">
                                    <a class="nav-link waves-effect" href="#" id="btn-fullscreen">
                                        <i class="mdi mdi-arrow-expand-all noti-icon"></i>
                                    </a>
                                </li>

                                <!-- notification -->
                                <li class="dropdown notification-list list-inline-item">
                                    <a class="nav-link dropdown-toggle arrow-none waves-effect" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                        <i class="mdi mdi-bell-outline noti-icon"></i>
                                        <span class="badge badge-pill badge-danger noti-icon-badge">3</span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated dropdown-menu-lg px-1">
                                        <!-- item-->
                                        <h6 class="dropdown-item-text">
                                            Notificaciones
                                        </h6>
                                        <div class="slimscroll notification-item-list">
                                            <!-- item-->
                                            <a href="javascript:void(0);" class="dropdown-item notify-item active">
                                                <div class="notify-icon bg-success"><i class="mdi mdi-cart-outline"></i></div>
                                                <p class="notify-details"><b>Su tarea ha sido asignada</b><span class="text-muted">Se han registrado nuevos autos</span></p>
                                            </a>

                                            <!-- item-->
                                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                                <div class="notify-icon bg-danger"><i class="mdi mdi-message-text-outline"></i></div>
                                                <p class="notify-details"><b>Nuevo mensaje</b><span class="text-muted">Usted tiene 10 mensajes</span></p>
                                            </a>


                                        </div>
                                        <!-- All-->
                                        <a href="javascript:void(0);" class="dropdown-item text-center notify-all text-primary">
                                            Ver Todo <i class="fi-arrow-right"></i>
                                        </a>
                                    </div>
                                </li>

                                <li class="dropdown notification-list list-inline-item">
                                    <div class="dropdown notification-list nav-pro-img">
                                        <a class="dropdown-toggle nav-link arrow-none nav-user" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                            <img src="assets/img/users/user-4.jpg" alt="user" class="rounded-circle">
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                                            <!-- item-->
                                            <a class="dropdown-item" href="#"><i class="mdi mdi-account-circle"></i> Perfil</a>
                                            <a class="dropdown-item d-block" href="#"><span class="badge badge-success float-right">1</span><i class="mdi mdi-settings"></i> Configuración</a>
                                            <a class="dropdown-item" href="#"><i class="mdi mdi-lock-open-outline"></i> Bloquear Pantalla</a>
                                            <div class="dropdown-divider"></div>

                                            <form method="post" action="Sesiones">
                                                <a class="dropdown-item text-danger" href="iniciarSesion.jsp"><i class="mdi mdi-power text-danger"></i><input type="submit" value="Cerrar Sesión" name="Cerrar Sesión"></a>
                                            </form>
                                        </div>
                                    </div>
                                </li>

                                <li class="menu-item dropdown notification-list list-inline-item">
                                    <!-- Mobile menu toggle-->
                                    <a class="navbar-toggle nav-link">
                                        <div class="lines">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </div>
                                    </a>
                                    <!-- End mobile menu toggle-->
                                </li>

                            </ul>

                        </div>
                        <!-- end menu-extras -->

                        <div class="clearfix"></div>

                    </div>
                    <!-- end container -->
                </div>
                <!-- end topbar-main -->

                <!-- MENU Start -->
                <div class="navbar-custom">
                    <div class="container-fluid">
                        <audio controls autoplay  style="max-height:  30px;  float: right; ">
                            <source  src="assets/audio/inicio.ogg" type="audio/ogg" >
                            Your browser does not support the <code>audio</code> tag.
                       </audio>
                                    

                        <div id="navigation">
                            
                                

                            <!-- Navigation Menu-->
                            <ul class="navigation-menu">

                                <li class="has-submenu">
                                    <a href="index.jsp"><i class="icon-accelerator"></i> Home</a>

                                </li>

                                <li class="has-submenu">
                                    <a href="#"><i class="icon-life-buoy"></i> Modulos <i class="mdi mdi-chevron-down mdi-drop"></i></a>
                                    <ul class="submenu">


                                        <li>
                                            <a href="agregarUsuario.jsp">Usuarios </a>
                                        </li>

                                        <li>
                                            <a href="editarDatos.jsp">Editar Datos </a>
                                        </li>


                                        <li>
                                            <a href="consultarVehiculo.jsp">Vehiculos </a>
                                        </li>

                                        <li>
                                            <a href="consultarDatos.jsp">Datos </a>
                                        </li>



                                    </ul>
                                </li>



                                <div>
                                    <%
                                    if (request.getAttribute("mensajeError") != null) {  %>  

                                    ${mensajeError}
                                    <%} else {%>
                                    <div style="color: #000;">${mensajeExito}</div>
                                    <% }%>
                                </div>


                            </ul>
                            <!-- End navigation menu -->
                        </div>
                        <!-- end #navigation -->
                    </div>
                    <!-- end container -->
                </div>
                <!-- end navbar-custom -->
            </header>
            <!-- End Navigation Bar-->

        </div>
        <!-- header-bg -->

        <div class="wrapper">
            <div class="container-fluid">
                <!-- Page-Title -->
                <div class="page-title-box">
                    <div class="row align-items-center">
                        <div class="col-sm-6">
                            <h4 class="page-title">Modulos Principales</h4>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-right">
                                <li class="breadcrumb-item"><a href="javascript:void(0);">Kavak</a></li>
                                <li class="breadcrumb-item active">Inicio</li>
                            </ol>
                        </div>
                    </div>
                    <!-- end row -->
                </div>
              
                                            
                                        
                <div class="row">

                    <div class="col-sm-6 col-xl-3">
                        <div class="card">
                            <div class="card-heading p-4">
                                <div class="mini-stat-icon float-right">
                                    <i class="mdi mdi-cube-outline bg-primary  text-white"></i>
                                </div>
                                <div>
                                    <h5 class="font-16"><a href="agregarUsuario.jsp">Usuarios</a></h5>
                                </div>
                              
                                
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-3">
                        <div class="card">
                            <div class="card-heading p-4">
                                <div class="mini-stat-icon float-right">
                                    <i class="mdi mdi-briefcase-check bg-success text-white"></i>
                                </div>
                                <div>
                                    <h5 class="font-16"><a href="editarDatos.jsp">Datos Personales </a></h5>
                                </div>
                              
                                
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-3">
                        <div class="card">
                            <div class="card-heading p-4">
                                <div class="mini-stat-icon float-right">
                                    <i class="mdi mdi-tag-text-outline bg-warning text-white"></i>
                                </div>
                                <div>
                                    <h5 class="font-16"><a href="consultarVehiculo.jsp">Comprar Vehiculos </a></h5>
                                </div>
                               
                              
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-3">
                        <div class="card">
                            <div class="card-heading p-4">
                                <div class="mini-stat-icon float-right">
                                    <i class="mdi mdi-buffer bg-danger text-white"></i>
                                </div>
                                <div>
                                    <h5 class="font-16"><a href="consultarDatos.jsp">Datos Vendedores</a></h5>
                                </div>
                                
                               
                                
                            </div>
                        </div>
                    </div>

                </div>


                <!-- end row -->

                



                <div class="row">
                    <div class="col-xl-4">
                        <div class="card m-b-30">
                            <div class="card-body">
                                <h4 class="mt-0 header-title mb-4">Motos que te pueden gustar      </h4>
                                
                            
                              
                                <div id="morris-line-example" class="morris-chart" style="height: 500px">
                                    <img class="carroM" src="https://gestion.pe/resizer/XU29JFBUGFHBqpxfDgESNvynflA=/980x0/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/5W4IHFWLVBECTJPFSTHB7RIU24.jpg" style="margin-bottom: 10px; height: 247px">
                                    <img class="carroM" src="https://www.turismoviajar.com/wp-content/uploads/2020/06/moto-usada.jpg" style=" height: 206px">
                                </div>
                                
                            
                       
                               
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-4">
                        <div class="card m-b-30">
                            <div class="card-body">
                                <h4 class="mt-0 header-title mb-4">Carros de moda!</h4>
                                <div id="morris-line-example" class="morris-chart" style="height: 500px">
                                    <img class="carroM" src="https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2019/11/audi-tron-sportback.jpg?itok=Oammof3Z" style="margin-bottom: 10px">
                                    <img class="carroM" src="https://www.autofacil.es/wp-content/uploads/2020/01/audi_a3_sportback_2021.jpg">
                                </div>
                                
                            </div>
                        </div>

                    </div>

                    <div class="col-xl-4">
                        <div class="card m-b-30">
                            <div class="card-body">

                                <h4 class="mt-0 header-title mb-4">Camperos </h4>
                                
                                  <div id="morris-line-example" class="morris-chart" style="height: 500px">
                                    <img class="carroM" src="https://http2.mlstatic.com/D_NQ_NP_770966-MCO44198504013_112020-O.jpg" style="margin-bottom: 10px; height: 247px">
                                    <img class="carroM" src="https://definicion.de/wp-content/uploads/2020/12/camioneta.jpg" style=" height: 206px">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

               

            </div>
        <!-- Footer -->
        <footer class="footer">
            © 2019 - 2020 Stexo <span class="d-none d-sm-inline-block"> - Crafted with <i class="mdi mdi-heart text-danger"></i> by Themesdesign</span>.
        </footer>

        <!-- End Footer -->

        <!-- jQuery  -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/waves.min.js"></script>

        <!--Morris Chart-->
        <script src="../plugins/morris/morris.min.js"></script>
        <script src="../plugins/raphael/raphael.min.js"></script>

        <script src="assets/pages/dashboard.init.js"></script>

        <!-- App js -->
        <script src="assets/js/app.js"></script>

    </body>

</html>