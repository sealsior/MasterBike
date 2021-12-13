<%-- 
    Document   : ListaSeguimiento
    Created on : 10-11-2021, 22:32:41
    Author     : Marco
--%>


<%@page import="Model.Seguimientoenvios"%>
<%@page import="DAO.SeguimientoenviosDAO"%>
<%@page import="Model.Venta"%>
<%@page import="java.util.List"%>
<%@page import="DAO.VentaDAO"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="es">

    <head>
        <link rel="shortcut icon" href="https://masterbike.ro/img/favicon.ico?1636634012">
        <meta charset="UTF-8">
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/c747d09760.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <style>     
            .container {


                text-align: center;

            }


        </style>
        <title>Finalizar Ventas</title>

        <!-- Required meta tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js"></script>

        <!-- Datatables -->
        <link rel="stylesheet" href="https://cdn.datatables.net/v/bs4-4.1.1/dt-1.10.18/datatables.min.css">
        <script src="https://cdn.datatables.net/v/bs4-4.1.1/dt-1.10.18/datatables.min.js"></script>

        <style>
            #mydatatable tfoot input {
                width: 50% !important;
            }

            #mydatatable tfoot {
                display: table-header-group !important;
            }
        </style>
    </head>

    <body >
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
        <div class="card-header">
            <a class="btn btn-primary " href="MenuTrabajadores.jsp">Volver</a>
            <h2 class="w3-wide w3-center text-center" >Finalizar seguimientos</h2>

        </div>
        <div class="table-responsive" id="mydatatable-container">
            <table class="records_list table table-striped table-bordered table-hover" id="mydatatable">
                <thead>
                    <tr class="encabezado">
                        <th class="text-center">CÓDIGO DE VENTA</th>

                        <th class="text-center">FECHA DE DESPACHO</th>
                        <th class="text-center">ESTADO</th>
                        <th class="text-center">PRODUCTO</th>
                        <th class="text-center">DIRECCIÓN DE ENVIO</th>
                        <th class="text-center">ACCIONES</th>

                    </tr>
                </thead>
                <%
                    SeguimientoenviosDAO vDAO = new SeguimientoenviosDAO();

                    List<Seguimientoenvios> venta = vDAO.listarSeguimientosPorEstado();
                    request.setAttribute("pro", venta);
                %>
                <tfoot>
                    <tr>
                        <th></th>
                        <th class="date col-sm-3"></th>
                    </tr>
                </tfoot>
                <tbody>
                    <c:forEach var="p" items="${pro}">

                        <tr class="text-center">
                            <td>C00${p.getVenta().getIdVenta()}</td>

                            <td>${p.getFecdespacho()}</td>
                            <td>${p.getEstadoentrega()}</td>
                            <td>${p.getEstadoentrega()}</td>
                            <td>Dirección: ${p.getVenta().getUsuario().getDireccionUsuario()}- Cliente: ${p.getVenta().getUsuario().getNombre()}</td>
                            <td>
                                <form action="ControladorAgregarSeguimiento" method="POST">
                                    <input type="hidden" name="id" value="${p.getIdSeguiEnvios()}">
                                    <input type="submit" name="accion" value="Finalizar" class="btn btn-success">

                                </form>
                            </td>

                        </tr>

                    </c:forEach>  



                </tbody>
            </table>
        </div>
        <br>
        <br>  

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


        <script type="text/javascript">
            $(document).ready(function () {
                $('#mydatatable tfoot th').each(function () {
                    var title = $(this).text();
                    if ($(this).hasClass('date')) {
                        $(this).html(
                                '<input id="date-from" type="date" placeholder="Desde.." />' +
                                '<input id="date-to" type="date" placeholder="Hasta.." />'
                                );
                    }
                });

                $.fn.dataTable.ext.search.push(
                        function (settings, data, dataIndex) {
                            var dateFrom = $('#date-from').val();
                            var dateTo = $('#date-to').val();
                            var date = data[1];

                            if ((dateFrom == '' && dateTo == '') ||
                                    (dateFrom == '' && Date.parse(date) <= Date.parse(dateTo)) ||
                                    (Date.parse(dateFrom) <= Date.parse(date) && dateTo == '') ||
                                    (Date.parse(dateFrom) <= Date.parse(date) && Date.parse(date) <= Date.parse(dateTo))) {
                                return true;
                            }
                            return false;
                        }
                );

                var table = $('#mydatatable').DataTable({
                    "dom": 'B<"float-left"i><"float-right"f>t<"float-left"l><"float-right"p><"clearfix">',
                    "responsive": false,
                    "language": {
                        "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
                    },
                    "order": [
                        [0, "desc"]
                    ],
                    "initComplete": function () {
                        this.api().columns().every(function () {
                            var that = this;

                            $('input', this.footer()).on('keyup change', function () {
                                if ($(this).closest('th').hasClass('date')) {
                                    console.log('Filtering dates..');
                                    table.draw();
                                } else {
                                    if (that.search() == this.value) {
                                        that
                                                .search(this.value)
                                                .draw();
                                    }
                                }
                            });
                        })
                    }
                });
            });

        </script>

        <!--<script >
            
            document.querySelectorAll('.Total').forEach(function (total) {
            if (total.classList.length > 1) {
                var letra = total.classList[1];
                var suma = 0;
                document.querySelectorAll('.Columna' + letra).forEach(function (celda) {
                    var valor = parseInt(celda.innerHTML);
                    suma += valor;
                });
                total.innerHTML = suma;
            }
        });
        </script>-->
</c:when></c:choose>
    </body>

</html>