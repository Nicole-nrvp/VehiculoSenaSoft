<%-- 
    Document   : index
    Created on : 27/09/2021, 07:31:10 AM
    Author     : Valentina
--%>

<%@page import="javafx.scene.chart.PieChart.Data"%>
<%@page import="ModeloDAO.DatosPersonalesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.UsuarioDAO"%>

<%@page import="ModeloVO.DatosPersonalesVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">

        <title>Kavak | Datos</title>
        <meta content="Responsive admin theme build on top of Bootstrap 4" name="description" />
        <meta content="Themesdesign" name="author" />
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!--Morris Chart CSS -->
        <link rel="stylesheet" href="../plugins/morris/morris.css">

        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/metismenu.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css">
       <link href="assets/css/login.css" rel="stylesheet" type="text/css"/>
        <script src="Validaciones.js" type="text/javascript"></script>
        
        <link href="assets/css/style_1.css" rel="stylesheet" type="text/css"/>

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
                                <li class="breadcrumb-item active">Datos</li>
                            </ol>
                        </div>
                    </div>
                    <!-- end row -->
                </div>

                <%
                    DatosPersonalesVO datVO = new DatosPersonalesVO();
                    
                    datVO = datDAO.ConsultarRegistros(usuarioId);

                    if (datVO != null) {


                %>
                
                    <h1>Actualizar Datos</h1>
                    <form method="POST" action="Datos">
                        
                        <input type="hidden" name="txtDatId"  class="form-control" value="<%=datVO.getDatId()%>"><br><br>
                        
                        <label>Nombre</label>
                        <br>
                        <input type="text" name="txtDatNombre"  value="<%=datVO.getDatNombre()%>"><br><br>
                        <label>Apellido</label>
                        <br>
                        <input type="text" name="txtDatApellido"  value="<%=datVO.getDatApellido()%>"><br><br>
                        <label>Tipo documento</label>
                        <br>
                        <input type="text" name="txtDatTipoId" value="<%=datVO.getDatTipo()%>"><br><br>
                        <label>Documento</label>
                        <br>
                        <input type="text" name="txtDatNumeroId" value="<%=datVO.getDatNumero()%>"><br><br>
                        <label>Telefono</label>
                        <br>
                        <input type="text" name="txtDatTelefono" name="txtDatTelefono" value="<%=datVO.getDatTelefono()%>"><br><br>
                        <label>Correo</label>
                        <br>
                        <input type="text" name="txtDatCorreo" name="txtDatCorreo" value="<%=datVO.getDatCorreo()%>"><br><br>
                        <label>IdUsuario</label>
                        <br>
                        <input type="text" name="txtUsuId" name="txtUsuId" value="<%=datVO.getUsuId()%>"><br><br>
                        <button>Actualizar</button>
                        <br>
                        <input type="hidden" name="opcion" value="1">


                    </form>
                    <%}%>
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