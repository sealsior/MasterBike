<%-- 
    Document   : ListaProducto
    Created on : 15-10-2021, 19:45:51
    Author     : Marco
--%>

<%@page import="modelo.Producto1"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="Model.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <script src="https://kit.fontawesome.com/2ee177ef66.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link rel="shortcut icon" href="https://masterbike.ro/img/favicon.ico?1636634012">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <!-- esta linea y una de abajo es para el buscar y la paginacion-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <title>Lista de productos</title>
    </head>
    <body>
        <c:choose>
        <c:when test="${perfil == 4 || perfil == 3 || perfil == 2 || perfil == 5 }">
            
        
        <!-- Start Header Area -->
        <header class="header_area sticky-header">
            <div class="main_menu">
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark main_box" >
                    <div class="container">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <a class="navbar-brand logo_h" href="inicio.jsp"><img src="https://i.ibb.co/3Fm1YdV/MBLOGO1.png" alt=""></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                            <ul class="nav navbar-nav menu_nav ml-auto">
                                <c:choose>
                                    <c:when test="${perfil == 1}">
                                        <li class="nav-item active"><a class="nav-link" href="inicio.jsp">Inicio</a></li>
                                        <li class="nav-item submenu dropdown">
                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                               aria-expanded="false">Comprar</a>
                                            <ul class="dropdown-menu">
                                                <li class="nav-item bg-dark"><a class="nav-link" href="Controlador?accion=bicicletas">Bicicletas</a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="Accesorio.jsp">Accesorios</a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="Repuesto.jsp">Repuestos</a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="Controlador?accion=home">Todo</a></li>
                                            </ul>
                                        </li>
                                        <li class="nav-item submenu dropdown">
                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                               aria-expanded="false">Servicios</a>
                                            <ul class="dropdown-menu">
                                                <li class="nav-item bg-dark"><a class="nav-link" href="ControladorMantencion">Solicitud Taller</a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="SolicitudArriendo.jsp">Solicitud Arriendo</a></li>

                                            </ul>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="Controlador?accion=Carrito"><i class="fas fa-cart-plus"><label style="color: darkorange">${contador}</label></i>Carrito</a>
                                        </li>
                                        <li class="nav-item submenu dropdown">
                                            <a href="login.html" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                               aria-expanded="false">Mi Cuenta</a>
                                            <ul class="dropdown-menu">
                                                <li class="nav-item bg-dark"><a class="nav-link">Hola <c:out value="${usuarioActivo.getNombre()}"/></a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="ListarMantencionesPorUsuario.jsp" >Mis mantenciones</a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="ListarArriendosPorUsuario.jsp" >Mis arriendos</a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="Controlador?accion=MisCompras">Mis compras</a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="MisDatos.jsp" >Mis datos</a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="ControladorLogout" style="color:red">Cerrar Sesión</a></li>
                                            </ul>


                                        </li>

                                    </c:when>

                                    <c:when test="${perfil == 2}">
                                        <li class="nav-item active"><a class="nav-link" href="inicio.jsp">Inicio</a></li>

                                        <li class="nav-item submenu dropdown">
                                            <a href="login.html" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                               aria-expanded="false">Mi Cuenta</a>
                                            <ul class="dropdown-menu">
                                                <li class="nav-item bg-dark"><a class="nav-link">Hola <c:out value="${usuarioActivo.getNombre()}"/></a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="MenuTrabajadores.jsp">Corporativo</a></li>

                                                <li class="nav-item bg-dark"><a class="nav-link" href="ControladorLogout" style="color:red">Cerrar Sesión</a></li>
                                            </ul>


                                        </li>

                                    </c:when>

                                    <c:when test="${perfil == 3}">
                                        <li class="nav-item active"><a class="nav-link" href="inicio.jsp">Inicio</a></li>

                                        <li class="nav-item submenu dropdown">
                                            <a href="login.html" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                               aria-expanded="false">Mi Cuenta</a>
                                            <ul class="dropdown-menu">
                                                <li class="nav-item bg-dark"><a class="nav-link">Hola <c:out value="${usuarioActivo.getNombre()}"/></a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="MenuTrabajadores.jsp">Corporativo</a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="ControladorLogout" style="color:red">Cerrar Sesión</a></li>
                                            </ul>


                                        </li>


                                    </c:when>

                                    <c:when test="${perfil == 4}">
                                        <li class="nav-item active"><a class="nav-link" href="inicio.jsp">Inicio</a></li>


                                        <li class="nav-item submenu dropdown">
                                            <a href="login.html" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                               aria-expanded="false">Mi Cuenta</a>
                                            <ul class="dropdown-menu">
                                                <li class="nav-item bg-dark"><a class="nav-link">Hola <c:out value="${usuarioActivo.getNombre()}"/></a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="MenuTrabajadores.jsp">Corporativo</a></li>

                                                <li class="nav-item bg-dark"><a class="nav-link" href="ControladorLogout" style="color:red">Cerrar Sesión</a></li>
                                            </ul>


                                        </li>




                                    </c:when>

                                    <c:when test="${perfil == 5}">
                                        <li class="nav-item active"><a class="nav-link" href="inicio.jsp">Inicio</a></li>



                                        <li class="nav-item submenu dropdown">
                                            <a href="login.html" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                               aria-expanded="false">Mi Cuenta</a>
                                            <ul class="dropdown-menu">
                                                <li class="nav-item bg-dark"><a class="nav-link">Hola <c:out value="${usuarioActivo.getNombre()}"/></a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="MenuTrabajadores.jsp">Corporativo</a></li>

                                                <li class="nav-item bg-dark"><a class="nav-link" href="ControladorLogout" style="color:red">Cerrar Sesión</a></li>
                                            </ul>

                                        </li>

                                    </c:when>
                                    <c:otherwise>   
                                        <li class="nav-item active"><a class="nav-link" href="inicio.jsp">Inicio</a></li>
                                        <li class="nav-item submenu dropdown">
                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                               aria-expanded="false">Productos</a>
                                            <ul class="dropdown-menu">
                                                <li class="nav-item bg-dark"><a class="nav-link" href="Controlador?accion=bicicletas">Bicicletas</a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="Accesorio.jsp">Accesorios</a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="Repuesto.jsp">Repuestos</a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="Controlador?accion=home">Todo</a></li>
                                            </ul>
                                        </li>

                                        <li class="nav-item">
                                            <a class="nav-link" href="Controlador?accion=Carrito"><i class="fas fa-cart-plus"><label style="color: darkorange">${contador}</label></i>Carrito</a>
                                        </li>

                                        <li class="nav-item submenu dropdown">
                                            <a href="login.html" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                               aria-expanded="false">Mi Cuenta</a>
                                            <ul class="dropdown-menu">
                                                <li class="nav-item bg-dark"><a class="nav-link" href="Login.jsp">Iniciar Sesión</a></li>
                                                <li class="nav-item bg-dark"><a class="nav-link" href="ControladorUsuario">Registrate</a></li>


                                            </ul>


                                        </li>

                                    </c:otherwise>
                                </c:choose>

                            </ul>

                        </div>
                    </div>
                </nav>
            </div>

        </header>
        <!-- End Header Area -->


        <div class="container">
            <table class="table table-bordered table-striped" id="table_id">
                <div class="card-header">
                    <a class="btn btn-primary " href="MenuTrabajadores.jsp">Volver</a>
                    <a href="Producto.jsp" class="btn btn-success">+ AGREGAR</a>  

                    <h2 class="w3-wide w3-center text-center" >Lista de Productos</h2>

                </div>
                <thead>
                    <tr class="text-center">
                        <th class="text-center">ID</th>
                        <th class="text-center">NOMBRE</th>
                        <th class="text-center">TIPO</th>
                        <th class="text-center">DESCRIPCIÓN</th>
                        <th class="text-center">PROVEEDOR</th>
                        <th class="text-center">VALOR</th>
                        <!--<th class="text-center">MARCA</th>
                        <th class="text-center">MODELO</th>-->
                        <th class="text-center">STOCK</th>
                        <th>IMAGEN</th>
                        <th class="text-center">ACCIÓN</th>
                        <th class="text-center">DOCUMENTACIÓN</th>
                    </tr>
                </thead>

                <%
                    Producto p = new Producto();
                    ProductoDAO pDAO = new ProductoDAO();
                    List<Producto> productos = pDAO.listarProductos();
                    request.setAttribute("pro", productos);
                %>
                <tbody id="myTable">
                    <c:forEach var="p" items="${pro}">
                        <tr class="text-center">
                            <td>${p.getIdProducto()}</td>
                            <td>${p.getNombreproducto()}</td>
                            <td>${p.getTipoproducto()}</td>
                            <td>${p.getDescripcion()}</td>
                            <td>${p.getFabricpropia()}</td>
                            <td>${p.getValproducto()}</td>
                            <!--<td>${p.getMarca()}</td>
                            <td>${p.getModelo()}</td>-->
                            <td>${p.getStock()}</td>

                            <td><img src="${p.getImagen()}" height="100" width="100"></td>

                            <td class="d-flex">
                                <form action="ControladorEditarProducto" method="POST">
                                    <input type="hidden" name="id" value="${p.getIdProducto()}">
                                    <input type="submit" name="accion" value="Editar" class="btn btn-success">

                                </form>
                                <a href="ControladorProducto?accion=eliminar&id=${p.getIdProducto()}" class="btn btn-danger" onclick="javascript:if (!confirm('¿Desea eliminar el producto ${p.getNombreproducto()}?${p.getIdProducto()}'))
                                                return false">Eliminar</a>           
                            </td>

                            <td>
                                <a href="ControladorDocumentos?accion=add&id=${p.getIdProducto()}" class="btn btn-primary">Agregar</a>
                            </td>
                        </tr>
                    </c:forEach>                    
                </tbody>
            </table>                         
        </div>
        <!-- Footer -->
        <footer class="bg-dark text-center text-white">
            <!-- Grid container -->
            <div class="container p-4">
                <!-- Section: Social media -->
                <section class="mb-4">
                    <!-- Facebook -->
                    <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-facebook-f"></i
                        ></a>

                    <!-- Twitter -->
                    <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-twitter"></i
                        ></a>

                    <!-- Google -->
                    <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-google"></i
                        ></a>

                    <!-- Instagram -->
                    <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-instagram"></i
                        ></a>

                    <!-- Linkedin -->
                    <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-linkedin-in"></i
                        ></a>

                    <!-- Github -->
                    <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                       ><i class="fab fa-github"></i
                        ></a>
                </section>
                <!-- Section: Social media -->

                <!-- Section: Form -->
                <section class="">
                    <form action="">
                        <!--Grid row-->
                        <div class="row d-flex justify-content-center">
                            <!--Grid column-->
                            <div class="col-auto">
                                <p class="pt-2">
                                    <strong>Suscríbete a nuestras noticias</strong>
                                </p>
                            </div>
                            <!--Grid column-->

                            <!--Grid column-->
                            <div class="col-md-5 col-12">
                                <!-- Email input -->
                                <div class="form-outline form-white mb-4">
                                    <input type="email" id="form5Example21" class="form-control" />
                                    <label class="form-label" for="form5Example21">Tú email</label>
                                </div>
                            </div>
                            <!--Grid column-->

                            <!--Grid column-->
                            <div class="col-auto">
                                <!-- Submit button -->
                                <button type="submit" class="btn btn-outline-light mb-4">
                                    Suscribir
                                </button>
                            </div>
                            <!--Grid column-->
                        </div>
                        <!--Grid row-->
                    </form>
                </section>
                <!-- Section: Form -->

                <!-- Section: Text -->
                <section class="mb-4">
                    <p>
                        La fábrica de bicicletas San Diego nació en el año 1990 en la ciudad de Santiago como respuesta a 
                        la creciente demanda de bicicletas de los habitantes de la capital, hoy, 31 años después bajo la
                        nueva marca "Masterbike" busca nuevamente ser protagonista del ciclismo nacional ofreciendo nuevos 
                        servicios de acuerdo a las necesidades de los riders chilenos.
                    </p>
                </section>
                <!-- Section: Text -->

                <!-- Section: Links -->
                <section class="">
                    <!--Grid row-->
                    <div class="row">
                        <!--Grid column-->
                        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                            <h5 class="text-uppercase">Categorias</h5>

                            <ul class="list-unstyled mb-0">
                                <li>
                                    <a href="Controlador?accion=bicicletas" class="text-white">Bicicletas</a>
                                </li>
                                <li>
                                    <a href="Accesorio.jsp" class="text-white">Accesorios</a>
                                </li>
                                <li>
                                    <a href="Repuesto.jsp" class="text-white">Repuestos</a>
                                </li>


                            </ul>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                            <h5 class="text-uppercase">Representamos a</h5>

                            <ul class="list-unstyled mb-0">
                                <li>
                                    <a href="https://bike.shimano.com/" class="text-white">Shimano</a>
                                </li>
                                <li>
                                    <a href="https://www.ridefox.com/" class="text-white">Fox</a>
                                </li>
                                <li>
                                    <a href="https://www.sram.com/" class="text-white">Sram</a>
                                </li>

                            </ul>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                            <h5 class="text-uppercase">Atención al cliente</h5>

                            <ul class="list-unstyled mb-0">
                                <li>
                                    <a href="FormularioContacto.jsp" class="text-white">Contáctanos</a>
                                </li>
                                <li>
                                    <a href="TerminosCondiciones.jsp" class="text-white">Términos y condiciones</a>
                                </li>
                                <li>
                                    <a href="AvisoLegal.jsp" class="text-white">Aviso legal</a>
                                </li>
                            </ul>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                            <h5 class="text-uppercase">Tu Masterbike</h5>

                            <ul class="list-unstyled mb-0">
                                <li>
                                    <a href="RegistroUsuario.jsp" class="text-white">Regístrate</a>
                                </li>
                                <li>
                                    <a href="Login.jsp" class="text-white">Iniciar sesión</a>
                                </li>
                                <li>
                                    <a href="Login.jsp" class="text-white">Seguimiento de envíos</a>
                                </li>
                            </ul>
                        </div>
                        <!--Grid column-->
                    </div>
                    <!--Grid row-->
                </section>
                <!-- Section: Links -->
            </div>
            <!-- Grid container -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                © 2021 Copyright:
                <a class="text-white" href="">Sealsior</a>
            </div>
            <!-- Copyright -->
        </footer>
        <!-- Footer -->  
        <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>

        <script>


                                       $.extend(true, $.fn.dataTable.defaults, {
                                           "language": {
                                               "decimal": ",",
                                               "thousands": ".",
                                               "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                                               "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                                               "infoPostFix": "",
                                               "infoFiltered": "(filtrado de un total de _MAX_ registros)",
                                               "loadingRecords": "Cargando...",
                                               "lengthMenu": "Mostrar _MENU_ registros",
                                               "paginate": {
                                                   "first": "Primero",
                                                   "last": "Último",
                                                   "next": "Siguiente",
                                                   "previous": "Anterior"
                                               },
                                               "processing": "Procesando...",
                                               "search": "Buscar:",
                                               "searchPlaceholder": "Término de búsqueda",
                                               "zeroRecords": "No se encontraron resultados",
                                               "emptyTable": "Ningún dato disponible en esta tabla",
                                               "aria": {
                                                   "sortAscending": ": Activar para ordenar la columna de manera ascendente",
                                                   "sortDescending": ": Activar para ordenar la columna de manera descendente"
                                               },
                                               //only works for built-in buttons, not for custom buttons
                                               "buttons": {
                                                   "create": "Nuevo",
                                                   "edit": "Cambiar",
                                                   "remove": "Borrar",
                                                   "copy": "Copiar",
                                                   "csv": "fichero CSV",
                                                   "excel": "tabla Excel",
                                                   "pdf": "documento PDF",
                                                   "print": "Imprimir",
                                                   "colvis": "Visibilidad columnas",
                                                   "collection": "Colección",
                                                   "upload": "Seleccione fichero...."
                                               },
                                               "select": {
                                                   "rows": {
                                                       _: '%d filas seleccionadas',
                                                       0: 'clic fila para seleccionar',
                                                       1: 'una fila seleccionada'
                                                   }
                                               }
                                           }
                                       });

                                       $(document).ready(function () {
                                           $('#table_id').DataTable();
                                       });
        </script>
        </c:when>
        </c:choose>
    </body>
</html>
