<%-- 
    Document   : usuario
    Created on : 7 jun. 2023, 21:15:02
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("usuario") != null) {
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Sistema Incidencias| Inicio</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        <!-- Theme style -->
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <!-- Data table -->
        <link href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Implementacion de SweetAlert para Eliminar -->
        <link href="SweetAlert/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <!-- Main Header -->
            <c:import url="/menu_user.jsp" />

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>Página Usuarios</h1>
                </section>
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <a href="srvUsuario?accion=nuevo" class="btn btn-success">
                        <i class="fa fa-plus"></i> Nuevo Usuario </a>

                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li class="active">Usuarios</li>
                    </ol>
                </section>

                <section class="content">
                    <div class="box">    
                        <div class="box-header with-border">             
                            <h3 class="box-title">Listado de Usuarios</h3>
                        </div>
                        <div class="box-body">
                            <div class="table-responsive" >                                 
                                <table class="table table-bordered table-striped dataTable table-hover" id="tablaUsuarios" class="display">
                                    <thead>
                                        <tr>
                                            <th>IDUsuario</th>
                                            <th>Usuario</th>
                                            <th>Password</th>
                                            <th>Estado</th>
                                            <th>Cargo</th>
                                            <th>Acciones</th> 
                                        </tr>
                                    </thead>
                                    <c:forEach var="user" items="${usuarios}" varStatus="iteracion">
                                        <tr>
                                            <td>${iteracion.index + 1}</td>
                                            <td>${user.nombreUsuario}</td>
                                            <td>${user.clave}</td>
                                            <c:if test="${user.estado == true}">
                                                <td><span class="badge bg-green active">Usuario Activo</span></td> 
                                            </c:if>
                                            <c:if test="${user.estado == false}">
                                                <td><span class="badge bg-red active">Usuario Inactivo</span></td> 
                                            </c:if>

                                            <td>${user.cargo.nombreCargo}</td>
                                            <td><a href="<c:url value="srvUsuario">
                                                       <c:param name="accion" value="leer_usuario" />
                                                       <c:param name="cod" value="${user.id_usuario}" />
                                                   </c:url>"><button type="button" class="btn btn-warning" data-toggle="tooltip"  title="Editar" data-original-title="Editar">
                                                        <i class="fa fa-pencil"></i></button></a>

                                                <!-- DESACTIVAR / ACTIVAR USUARIOS -->
                                                <c:choose>
                                                    <c:when test="${user.estado == true}">
                                                        <input type="hidden" id="item" value="${user.id_usuario}">
                                                        <a id="desactivarUsuario" href="srvUsuario?cambiar=desactivar&cod=${user.id_usuario}" class="btn btn-danger"  data-toggle="tooltip" title="Desactivar" data-original-title="Desactivar">
                                                            <i class="fa fa-remove"></i></a>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <input type="hidden" id="item" value="${user.id_usuario}">
                                                        <a id="activarUsuario" href="srvUsuario?cambiar=activar&cod=${user.id_usuario}" class="btn btn-primary" data-toggle="tooltip" title="Activar" data-original-title="Activar">
                                                            <i class="glyphicon glyphicon-eye-open"></i></a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                <!-- ELIMINAR USUARIOS -->
                                                <input type="hidden" id="codigo" value="${user.id_usuario}">
                                                <a id="deleteUser" href="<c:url value="srvUsuario">
                                                       <c:param name="accion" value="eliminar_usuario" />
                                                       <c:param name="cod" value="${user.id_usuario}" />
                                                   </c:url>"><button type="button" class="btn btn-danger" data-toggle="tooltip"  title="Eliminar" data-original-title="Eliminar">
                                                        <i class="fa fa-trash"></i></button></a>

                                            </td>
                                        </tr>                                                    
                                    </c:forEach>                                               
                                </table>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <!--Pie de página-->
                        </div>
                        <!-- /.box-footer-->
                    </div>
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <!-- Main Footer -->
            <footer class="main-footer">
                <!-- To the right -->
                <div class="pull-right hidden-xs">
                    Todos los derechos reservados.
                </div>
                <!-- Default to the left -->
                <strong>Copyright &copy; 2023 </strong>
            </footer>

            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->

        <!-- jQuery 3 -->
        <script src="bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.min.js"></script>
        <!--data table -->
        <script src="bower_components/datatables.net/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <!--SweetAlert -->
        <script src="SweetAlert/sweetalert.js" type="text/javascript"></script>
        <!--Funcion js -->
        <script src="js/funcionesUsuario.js" type="text/javascript"></script>
        <c:import url="/pdf_usuario.jsp" />
        <script>
            $(document).ready(function () {
                $('#tablaUsuarios').DataTable();
            });
        </script>
    </body>
</html>
<%
    } else {
        response.sendRedirect("identificar.jsp");
    }
%>
