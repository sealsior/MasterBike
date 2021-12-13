<%-- 
    Document   : TerminosCondiciones
    Created on : 25-10-2021, 18:00:20
    Author     : baggr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="https://masterbike.ro/img/favicon.ico?1636634012">
   <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
     <!-- Bootstrap CSS -->
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
    <title>Términos y condiciones</title>
    </head>
    <body>
        
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
        <br>
        <br>
        <div class="container">
            <h1>TÉRMINOS Y CONDICIONES</h1>
            <p>
                El uso de este sitio web se rige por los términos y condiciones descritos a continuación, así como por la legislación que se aplique en la República de Chile. En consecuencia, todas las visitas, como asimismo sus efectos jurídicos, quedarán regidos por estas reglas y sometidas a esa legislación. Los términos y condiciones contenidos en este instrumento se aplicarán y se entenderán formar parte de todos los actos y contratos que se ejecuten o celebren mediante los sistemas de oferta y comercialización comprendidos en este sitio web entre los usuarios de este sitio y Masterbike Limitada.<br>

 

 

 

1.     Las imágenes exhibidas son con fines publicitarios y meramente ilustrativas. Pueden existir diferencias entre las imágenes y las dimensiones y/o características reales de los mismos.<br>

 

2.     Las descripciones que aparecen en este sitio son entregadas por nuestras marcas asociadas. Bicicletas Masterbike no se hace responsable por variaciones que puedan efectuarse sin previo aviso.<br>

 

3.     Los productos están destinados al mercado chileno y la garantía se rige por las normativas chilenas vigentes.<br>

 

4.     Los precios contenidos en el presente sitio Web se encuentran sujetos a modificación sin previo aviso. Toda información sobre valores de productos o servicios podrá ser obtenida en cualquiera de nuestras tiendas.<br>

 

5.     Sólo se emiten boletas para las ventas en nuestro sitio online; si necesita factura debe contactar a serviciocliente@Masterbike.cl para realizar Transferencia.<br>

 

6.     Bicicletas Masterbike se reserva el derecho de modificar la información contenida en el presente sitio Web, sin previo aviso. El detalle sobre especificaciones, equipamiento, disponibilidad, colores y la línea de accesorios dependen también de los requisitos y disposiciones locales y / o modificaciones de los fabricantes sin aviso previo.<br>

 

7.     Bicicletas Masterbike no será responsable por los daños y perjuicios que pudieran derivarse del conocimiento / desconocimiento o utilización de la información contenida en el presente sitio Web.<br>

 

 

8.   Masterbike dispone de hasta 5 días hábiles para realizar los despachos (Desde recepción de pago). El tiempo de envío respecto del transportista externo (Starken, Chilexpress, TSA), dependerá del lugar de destino. Bicicletas son enviadas en caja y semiarmadas (90%). Requiere armado final por parte de un técnico calificado. No hacerlo puede derivar en anulación de su garantía y potencialmente provocar lesiones.<br>

 

9.     Al seleccionar el transportista, usted acepta y tiene conocimiento de que su envío será por un servicio de transporte ajeno a nuestra empresa.<br>

 

10.     El presente sitio Web podrá ser suprimido en cualquier momento y la información aquí difundida podrá ser objeto de modificación total o parcial en cualquier forma por Bicicletas Masterbike.<br>
            </p>
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
 <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
  </body>

</html>