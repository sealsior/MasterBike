<%-- 
    Document   : CrearUsuario
    Created on : 28-10-2021, 11:48:50
    Author     : baggr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <!-- Bootstrap CSS -->
     <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
     <script src="https://kit.fontawesome.com/c747d09760.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
            <style>   
            
            HTML SCSSResult Skip Results Iframe


body {
  background: #eee !important;  
}

.wrapper {  
  margin-top: 80px;
  margin-bottom: 80px;
  
}


.form-signin {
  max-width: 380px;
  padding: 15px 35px 45px;
  margin: 0 auto;
  background-color: #fff;
  border: 1px solid rgba(0,0,0,0.1);  

  .form-signin-heading,
  .checkbox {
    margin-bottom: 30px;
  }

  .checkbox {
    font-weight: normal;
  }

  .form-control {
    position: relative;
    font-size: 16px;
    height: auto;
    padding: 10px;
    @include box-sizing(border-box);

    &:focus {
      z-index: 2;
    }
  }

  input[type="text"] {
    margin-bottom: -1px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
  }

  input[type="password"] {
    margin-bottom: 20px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    
  }
}
View Compiled


        .container {
         
                 text-align: center;
 
                }
        
        
        </style>
        
        
        <title>Crear usuario</title>
    </head>
    <body>
               <!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark main_box" >
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="inicio.jsp"><img src="https://i.ibb.co/S0J0VKs/logo.png" alt=""></a>
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
                                                                        <li class="nav-item bg-dark"><a class="nav-link">Hola <c:out value="${usuarioActivo.getPnombre()}"/></a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ListarMantencionesPorUsuario.jsp" >Mis mantenciones</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ListarArriendosPorUsuario.jsp" >Mis arriendos</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="Controlador?accion=MisCompras">Mis Compras</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ControladorLogout" style="color:red">Cerrar Sesión</a></li>
                                                                </ul>
                                                            
                                                            
							</li>
                                                            
                                                        </c:when>
                                                        
                                                        <c:when test="${perfil == 2}">
                                                            <li class="nav-item active"><a class="nav-link" href="inicio.jsp">Inicio</a></li>
							
							<li class="nav-item submenu dropdown">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Servicios</a>
								<ul class="dropdown-menu">
									<li class="nav-item bg-dark"><a class="nav-link" href="ListaStock.jsp">Ver stock</a></li>
                                                                        
								</ul>
							</li>
							
							<li class="nav-item submenu dropdown">
								<a href="login.html" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Mi Cuenta</a>
								<ul class="dropdown-menu">
                                                                        <li class="nav-item bg-dark"><a class="nav-link">Hola <c:out value="${usuarioActivo.getPnombre()}"/></a></li>
                                                                        
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ControladorLogout" style="color:red">Cerrar Sesión</a></li>
                                                                </ul>
                                                            
                                                            
							</li>
                                                            
                                                        </c:when>
                                                        
                                                        <c:when test="${perfil == 3}">
                                                            <li class="nav-item active"><a class="nav-link" href="inicio.jsp">Inicio</a></li>
							
							<li class="nav-item submenu dropdown">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Servicios</a>
								<ul class="dropdown-menu">
									<li class="nav-item bg-dark"><a class="nav-link" href="ListarSolicitudesMantenciones.jsp">Listado solicitudes taller</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ListaStock.jsp">Ver stock</a></li>
                                                                        
								</ul>
							</li>
                                                        
                                                       
							
							<li class="nav-item submenu dropdown">
								<a href="login.html" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Mi Cuenta</a>
								<ul class="dropdown-menu">
                                                                        <li class="nav-item bg-dark"><a class="nav-link">Hola <c:out value="${usuarioActivo.getPnombre()}"/></a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ControladorListarUsuarios">Listado de clientes</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ControladorLogout" style="color:red">Cerrar Sesión</a></li>
                                                                </ul>
                                                            
                                                            
							</li>
                                                            
                                                            
                                                        </c:when>
                                                        
                                                        <c:when test="${perfil == 4}">
                                                            <li class="nav-item active"><a class="nav-link" href="inicio.jsp">Inicio</a></li>
							<li class="nav-item submenu dropdown">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Productos</a>
								<ul class="dropdown-menu">
									<li class="nav-item bg-dark"><a class="nav-link" href="Controlador?accion=bicicletas">Bicicletas</a></li>
									<li class="nav-item bg-dark"><a class="nav-link" href="Accesorio.jsp">Accesorios</a></li>
									<li class="nav-item bg-dark"><a class="nav-link" href="Repuesto.jsp">Repuestos</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="Controlador?accion=home">Todo</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="verDocumento.jsp">Documentación</a></li>
									</ul>
							</li>
							<li class="nav-item submenu dropdown">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Servicios</a>
								<ul class="dropdown-menu">
									<li class="nav-item bg-dark"><a class="nav-link" href="ControladorMantencion">Solicitud Taller</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ListarSolicitudesMantenciones.jsp">Listado solicitudes taller</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="SolicitudArriendo.jsp">Arriendos</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ListarSolicitudesArriendo.jsp">Listado solicitudes arriendo</a></li>
                                                                        
								</ul>
							</li>
							
							<li class="nav-item submenu dropdown">
								<a href="login.html" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Mi Cuenta</a>
								<ul class="dropdown-menu">
                                                                        <li class="nav-item bg-dark"><a class="nav-link">Hola <c:out value="${usuarioActivo.getPnombre()}"/></a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ListarUsuarios.jsp">Listado de usuarios</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ReporteVenta.jsp" >Reportes</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ControladorLogout" style="color:red">Cerrar Sesión</a></li>
                                                                </ul>
                                                            
                                                            
							</li>
                                                            
                                                            
                                                        </c:when>
                                                        
                                                        <c:when test="${perfil == 5}">
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
							<li class="nav-item submenu dropdown">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Servicios</a>
								<ul class="dropdown-menu">
									<li class="nav-item bg-dark"><a class="nav-link" href="ListaProductos.jsp">Lista productos</a></li>
                                                                        
								</ul>
							</li>
							
							<li class="nav-item submenu dropdown">
								<a href="login.html" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Mi Cuenta</a>
								<ul class="dropdown-menu">
                                                                        <li class="nav-item bg-dark"><a class="nav-link">Hola <c:out value="${usuarioActivo.getPnombre()}"/></a></li>
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
        
        <!-- Area formulario-->
        <div class="wrapper">
            <h2 class="form-signin-heading" style="text-align:center">Ingrese datos de nuevo usuario</h2>
        <form action="<c:url value="/ControladorCrearUsuario" />" class="form-signin" method="post">
          
            <div class="mb-3 mt-3">
            <label for="txtEmailusuario" class="form-label" >Email usuario:</label>
            <input type="text" name="txtEmailusuario" id="txtEmailusuario" class="form-control" placeholder="Ingresar email" required />
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>
            </div>
            <div class="mb-3">
            <label for="txtPassword" class="form-label">Password:</label>
            <input type="password" name="txtPassword" id="txtPassword" class="form-control" placeholder="Ingresar password" required />
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>
            </div>
            <div class="mb-3">
            <label for="txtnombre" class="form-label">Primer nombre:</label>
            <input type="text" name="txtPnombre" id="txtPnombre" class="form-control" placeholder="Ingresar nombre" required/>
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>
            </div>
            <div class="mb-3">
            <label for="txtAppaterno" class="form-label">Apellido paterno:</label>
            <input type="text" name="txtAppaterno" id="txtAppaterno" class="form-control" placeholder="Ingresar apellido paterno" required/>
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>
            </div>
            <div class="mb-3">
            <label for="txtApmaterno" class="form-label">Apellido materno:</label>
            <input type="text" name="txtApmaterno" id="txtApmaterno" class="form-control" placeholder="Ingresar apellido materno" required/>   
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>    
            </div>
            <div class="mb-3">
            <label for="txtRutusuario" class="form-label">Rut:</label>
            <input type="text" name="txtRutusuario" id="txtRutusuario" class="form-control" placeholder="Ingresar rut" required/>
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>    
            </div>
            <div class="mb-3">
            <label for="txtFechanac" class="form-label">Fecha nacimiento:</label>
            <input type="date" name="txtFechanac" id="txtFechanac" class="form-control" placeholder="Ingresar fecha" required/>
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>    
            </div>
            <div class="mb-3">
            <label for="txtDireccion" class="form-label">Direccion:</label>
            <input type="text" name="txtDireccion" id="txtDireccion" class="form-control" placeholder="Ingresar direccion" required/>
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>
            </div>
            <div class="mb-3">
            <label for="txtNumtelefono" class="form-label">Telefono:</label>
            <input type="number" name="txtNumtelefono" id="txtNumtelefono" class="form-control" placeholder="Ingresar telefono" required/>
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>
            </div>
            <div class="mb-3">
                <label for="cboRol" class="form-label">Rol:</label>
                <select id="cboRol" name="cboRol" class="form-control">
                <c:forEach items="${roles}" var="d">
                    <option value="${d.getIdRol()}"> ${d.getNombre()}</option>
                </c:forEach>  
            </select> 
             </div>

             
            <button type="submit" class="btn btn-primary">Registrar usuario</button>
            <br>
            <br>    
                       
        </form>
        </div>
        <!--Fin formulario-->
       
        
        
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
              <strong>Suscribete a nuestras noticias</strong>
            </p>
          </div>
          <!--Grid column-->

          <!--Grid column-->
          <div class="col-md-5 col-12">
            <!-- Email input -->
            <div class="form-outline form-white mb-4">
              <input type="email" id="form5Example21" class="form-control" />
              <label class="form-label" for="form5Example21">Tu email</label>
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
        La fabrica de bicicletas San Diego nacio en el año 1990 en la ciudad de Santiago como respuesta a 
        la cresciente demanda de bicicletas de los habitantes de la capital, hoy, 31 años despúes bajo la
        nueva marca "Masterbik" busca nuevamente ser protagonista del ciclismo nacional ofreciendo nuevos 
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
              <a href="#!" class="text-white">Nuestros productos</a>
            </li>
            <li>
              <a href="ControladorMantencion" class="text-white">Taller de bicicletas</a>
            </li>
            <li>
              <a href="SolicitudArriendo.jsp" class="text-white">Arriendo de bicicletas</a>
            </li>
            
          </ul>
        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
          <h5 class="text-uppercase">Nuestros socios</h5>

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
              <a href="#!" class="text-white">Contáctanos</a>
            </li>
            <li>
              <a href="#!" class="text-white">Terminos y condiciones</a>
            </li>
            <li>
              <a href="#!" class="text-white">Seguimiento de envios</a>
            </li>
            <li>
              <a href="#!" class="text-white">Aviso legal</a>
            </li>
          </ul>
        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
          <h5 class="text-uppercase">Links</h5>

          <ul class="list-unstyled mb-0">
            <li>
              <a href="#!" class="text-white">Link 1</a>
            </li>
            <li>
              <a href="#!" class="text-white">Link 2</a>
            </li>
            <li>
              <a href="#!" class="text-white">Link 3</a>
            </li>
            <li>
              <a href="#!" class="text-white">Link 4</a>
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
