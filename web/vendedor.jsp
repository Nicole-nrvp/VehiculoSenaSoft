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

        <title>Kavak | Vendedor</title>
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
                            <h6 style="color: #ffffff;">Bienvenid@ Vendedor:  <%=datpVO.getDatNombre() + " " + datpVO.getDatApellido()%></h6>

                            <ul class="navbar-right ml-auto list-inline float-right mb-0">
                                <!-- language-->
                                <li class="dropdown notification-list list-inline-item d-none d-md-inline-block">

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





                                </li>


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
                            <h4 class="page-title">Home</h4>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-right">
                                <li class="breadcrumb-item"><a href="javascript:void(0);">Kavak</a></li>
                                <li class="breadcrumb-item active">Vendedor</li>
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
                                    <h5 class="font-16"><a href="consultarVehiculo.jsp">Vender Vehiculos </a></h5>
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
                                    <h5 class="font-16"><a href="consultarDatos.jsp">Datos Cargados</a></h5>
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
                                <h4 class="mt-0 header-title mb-4">Sugerencias de amigos       </h4>
                                <div class="friends-suggestions">
                                    <a href="#" class="friends-suggestions-list">
                                        <div class="border-bottom position-relative">
                                            <div class="float-left mb-0 mr-3">
                                                <img src="assets/img/users/user-2.jpg" alt="" class="rounded-circle thumb-md">
                                            </div>
                                            <div class="suggestion-icon float-right mt-2 pt-1">
                                                <i class="mdi mdi-plus"></i>
                                            </div>

                                            <div class="desc">
                                                <h5 class="font-14 mb-1 pt-2 text-dark">Camilo Blanquicet</h5>
                                                <p class="text-muted">3 Sugerencias de amigos</p>
                                            </div>
                                        </div>
                                    </a>

                                    <a href="#" class="friends-suggestions-list">
                                        <div class="border-bottom position-relative">
                                            <div class="float-left mb-0 mr-3">
                                                <img src="assets/img/users/user-3.jpg" alt="" class="rounded-circle thumb-md">
                                            </div>
                                            <div class="suggestion-icon float-right mt-2 pt-1">
                                                <i class="mdi mdi-plus"></i>
                                            </div>

                                            <div class="desc">
                                                <h5 class="font-14 mb-1 pt-2 text-dark">Nicole Romero</h5>
                                                <p class="text-muted">17 Sugerencias de amigos</p>
                                            </div>
                                        </div>
                                    </a>

                                    <a href="#" class="friends-suggestions-list">
                                        <div class="border-bottom position-relative">
                                            <div class="float-left mb-0 mr-3">
                                                <img src="assets/img/users/user-4.jpg" alt="" class="rounded-circle thumb-md">
                                            </div>
                                            <div class="suggestion-icon float-right mt-2 pt-1">
                                                <i class="mdi mdi-plus"></i>
                                            </div>

                                            <div class="desc">
                                                <h5 class="font-14 mb-1 pt-2 text-dark">Viviana Rosillo</h5>
                                                <p class="text-muted">12 Sugerencias de amigos</p>
                                            </div>
                                        </div>
                                    </a>

                                    <a href="#" class="friends-suggestions-list">
                                        <div class="border-bottom position-relative">
                                            <div class="float-left mb-0 mr-3">
                                                <img src="assets/img/users/user-5.jpg" alt="" class="rounded-circle thumb-md">
                                            </div>
                                            <div class="suggestion-icon float-right mt-2 pt-1">
                                                <i class="mdi mdi-plus"></i>
                                            </div>

                                            <div class="desc">
                                                <h5 class="font-14 mb-1 pt-2 text-dark">Mellany Herrera</h5>
                                                <p class="text-muted">18 Sugerencias de amigos</p>
                                            </div>
                                        </div>
                                    </a>



                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-4">
                        <div class="card m-b-30">
                            <div class="card-body">
                                   <img class="carroM" src="https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2019/11/audi-tron-sportback.jpg?itok=Oammof3Z" style="margin-bottom: 10px">
                            </div>
                        </div>

                    </div>

                    <div class="col-xl-4">
                        <div class="card m-b-30">
                            <div class="card-body">

                                <h4 class="mt-0 header-title mb-4">Actividad Reciente</h4>
                                <ol class="activity-feed mb-0">
                                    <li class="feed-item">
                                        <div class="feed-item-list">
                                            <p class="text-muted mb-1">Ahora</p>
                                            <p class="font-15 mt-0 mb-0">Asignacion de nuevas solicitudes: <b class="text-primary">Para Clase De Ensayo</b></p>
                                        </div>
                                    </li>
                                    <li class="feed-item">
                                        <p class="text-muted mb-1">Ayer</p>
                                        <p class="font-15 mt-0 mb-0">Nueva grafica de analitica: <b class="text-primary">Desarrolaldor Camilo</b></p>
                                    </li>
                                    <li class="feed-item">
                                        <p class="text-muted mb-1">2:30PM</p>
                                        <p class="font-15 mt-0 mb-0">Modificico calendario, <b class="text-primary"> Desarrolaldora Viviana</b></p>
                                    </li>

                                </ol>

                            </div>
                        </div>
                    </div>
                </div>

                

            </div>
            <!-- end container-fluid -->
        </div>
        <!-- end wrapper -->

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