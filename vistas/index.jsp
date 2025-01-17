
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- apartado de java dentro del JSP para hacer el ingreso correcto al Index -->
<%
    if (session.getAttribute("usuario") != null) {
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Sistema Incidencias| Inicio</title>
        <!-- apartado responsive -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Iconos -->
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        <!-- Theme style -->
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <!-- seleccion de la skin del adminLTE -->
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
        
        
        
       
        
        
        
        
        
        
    </head>

    <body class="hold-transition skin-yellow sidebar-mini">
        <div class="wrapper">

            <!-- Main -->
             <c:import url="/menu_user.jsp" />

             
             
             
             
             
             
             
             
            <!-- Detalles de la envoltura para los accesos rapidos a reportes -->
            <div class="content-wrapper">
                <!-- envoltura header -->
                <section class="content-header">
                    <h1>
                        Pagina Principal
                        <small>Accesos rapidos</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li class="active">Panel Administrativo</li>
                    </ol>
                </section>

                <section class="content">
                    <!-- Apartado de accesos rapidos -->
                    
                </section>
            </div>

            <!-- Firma inferior footer -->
            <footer class="main-footer">
                <!-- codigo para poner a la derecha -->
                <div class="pull-right hidden-xs">
                    Todos los derechos reservados.
                </div>
                <!-- por defecto a la izquierda -->
                <strong>Copyright &copy; 2023 </strong>
            </footer>
            <div class="control-sidebar-bg"></div>
        </div>

        <!-- REQUIRED JS SCRIPTS -->
        <!-- jQuery 3 -->
        <script src="bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.min.js"></script>
        

        
        

        
        
    </body>
</html>
<%
    } else {
        response.sendRedirect("identificar.jsp");
    }
%>
