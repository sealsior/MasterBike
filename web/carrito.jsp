
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="https://masterbike.ro/img/favicon.ico?1636634012">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito</title>
            <style>     
            .container {


                     text-align: center;

                    }


            </style>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
       
        <script src="https://kit.fontawesome.com/2ee177ef66.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
    
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
             <div class="container mt-4">
                 <h3>Carrito<i class="fas fa-cart-plus"></i></h3>
                 <br>
                 <div class="row">
                     <div class="col-sm-8">
                         <table class="table table-hover">
                             <thead>
                                 <tr>
                                     <th>Item</th>
                                     <th>Nombre</th>
                                     <th>Descripción</th>
                                     <th>Precio</th>
                                     <th>Cantidad</th>
                                     <th>Subtotal</th>
                                     <th>Acciones</th>
                                    
                                 </tr>
                             </thead>
                             <tbody>
                                 <c:forEach var="car" items="${carrito}">
                                 <tr>
                                     <td>${car.getItem()}
                                         <img src="https://previews.123rf.com/images/arcady31/arcady311505/arcady31150500073/39940971-satisfacci%C3%B3n-del-sello-de-garant%C3%ADa-de-caucho.jpg" width="100" height="100">

                                     </td>
                                     <td>${car.getNombres()}
                                     </td>
                                     <td>${car.getDescripcion()}</td>
                                     <td>$.${car.getPrecio()}</td>
                                     <td>
                                         <input type="hidden" id="idpro" value="${car.getIdProducto()}">
                                         <input type="number" id="Cantidad" value="${car.getCantidad()}" class="form-control text-center" min="1" >
                                     </td>
                                     <td>$.${car.getSubtotal()}</td>
                                     <td>
                                         <input type="hidden" id="idp" value="${car.getIdProducto()}">
                                         <a href="#" id="btnDelete"><i class="fas fa-trash-alt"></i></a>
                                         
                                     </td>
                                    
                                 </tr>
                            </c:forEach>
                             </tbody>
                         </table>

                     </div>
                     <div class="col-sm-4">
                         <c:choose> 
                                
                                <c:when test="${perfil == 1}"><!--Rol 1 Cliente -->

                                    <div class="card">
                             <div class="card-header">
                                 <h3>Generar Compra</h3>
                             </div>
                             <div class="card-body">
                                 <label>Subtotal</label>
                                 <input type="text" value="$.${totalPagar}" readonly="" class="form-control">
                                 <label>Descuento</label>
                                 <input type="text" value="$.0" readonly="" class="form-control">
                                 <label>Total a pagar</label>
                                 <input type="text" value="$.${totalPagar}" readonly="" class="form-control">
                             </div>
                             <div class="card-footer">
                                 
                                 <a type="button" class="btn btn-danger btn-block" data-toggle="modal" data-target="#exampleModal">Comprar</a>

                                 <!-- Modal -->
                                 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                     <div class="modal-dialog" role="document">
                                         <div class="modal-content">
                                             <div class="modal-header">
                                                 <h5 class="modal-title" id="exampleModalLabel">DATOS DE LA TARJETA</h5>
                                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                     <span aria-hidden="true">&times;</span>
                                                 </button>
                                             </div>
                                             <div class="modal-body">
                                                 <p class="table table-bordered table-striped">NUMERO DE LA TARJETA</p>
                                                 <p>1234 5678 5499 XXXX</p>
                                                 <p class="table table-bordered table-striped">FECHA DE CADUCIDAD</p>
                                                 <p>07/2023</p>
                                                 <p class="table table-bordered table-striped">TITULAR</p>
                                                 <p>${usuarioActivo.getNombre()} ${usuarioActivo.getApellidos()}</p>
                                                 <p class="table table-bordered table-striped">EMISOR</p>
                                                 <p>VISA</p>
                                                 <p class="table table-bordered table-striped">CVV</p>
                                                 <p>069</p>
                                             </div>
                                             <div class="modal-footer">
                                                 <a href="Controlador?accion=GenerarCompra" class="btn btn-danger btn-block">Pagar</a>
                                                 <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal">Cancelar</button>
                                    
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                                 
                                 <a href="Controlador?accion=home" class="btn btn-success btn-block">Seguir Comprando</a>
                             </div>
                         </div>


                                </c:when>
                                <c:when test="${perfil == 2}"></c:when>
                                <c:when test="${perfil == 3}"></c:when>
                                <c:when test="${perfil == 4}"></c:when>
                                <c:when test="${perfil == 5}"></c:when>
                                <c:otherwise>
                                    <div class="card-body">
                                        <br>
                                        <br>
                                        <br>
                                        <br><br>
                                        
                                        
                                    <a href="Login.jsp" class="btn btn-success btn-block">Iniciar Sesion</a>
                                    </div>
                                    
                                </c:otherwise> 
                                
                            </c:choose>
                         
                     </div>
                 </div>
             </div>
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
      <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script> 
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
      
      <script>
          
          $(document).ready(function (){
    $("tr #btnDelete").click(function (){
        var idp=$(this).parent().find("#idp").val();
            swal({
                title: "Eliminar producto del carrito?",
                text: "Una vez eliminado podra volver a ingresar el producto al carrito cuando quieras!",
                icon: "warning",
                buttons: true,
                dangerMode: true,
                })
                    .then((willDelete) => {
                      if (willDelete) {
                          eliminar(idp);
                            swal("Poof! Producto eliminado!", {
                            icon: "success",
                        }).then((willDelete)=>{
                            if (willDelete) {
                                parent.location.href="Controlador?accion=Carrito";
                            }
                        });
                      } else {
                        swal("Exelente!!");
                      }
                                            });
        
    });
    function eliminar(idp){
        var url="Controlador?accion=Delete";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp="+idp,
            success: function (data, textStatus, jqXHR) {
                
            }
        });
    }
    
    $("tr #Cantidad").click(function (){
        var idp=$(this).parent().find("#idpro").val();
        var cantidad =$(this).parent().find("#Cantidad").val();
        var url="Controlador?accion=ActualizarCantidad";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp="+idp+"&Cantidad="+cantidad,
            success: function (data, textStatus, jqXHR) {
                location.href="Controlador?accion=Carrito"
            }
        });
    });
    
});
      </script>
      
    </body>
</html>
