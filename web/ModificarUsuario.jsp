<%-- 
    Document   : ModificarUsuario
    Created on : 01-11-2021, 19:04:33
    Author     : baggr
--%>

<<<<<<< HEAD
<%@page import="Model.Usuario"%>
=======
>>>>>>> master
<%@page import="java.util.List"%>
<%@page import="DAO.RolDAO"%>
<%@page import="Model.Rol"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
<<<<<<< HEAD
        <link rel="shortcut icon" href="https://masterbike.ro/img/favicon.ico?1636634012">
=======
>>>>>>> master
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
        
        
        <title>Modificar usuario</title>
    </head>
    <body>
<<<<<<< HEAD
        <c:choose>
            <c:when test="${perfil == 4 || perfil == 3 || perfil == 2 || perfil == 5 }">
        <%
            
            Usuario u = (Usuario)request.getAttribute("usuario");
            
            %>
   
        
        
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
=======
        
   
        
        
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
>>>>>>> master
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
<<<<<<< HEAD
                                                                        <li class="nav-item bg-dark"><a class="nav-link">Hola <c:out value="${usuarioActivo.getNombre()}"/></a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ListarMantencionesPorUsuario.jsp" >Mis mantenciones</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ListarArriendosPorUsuario.jsp" >Mis arriendos</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="Controlador?accion=MisCompras">Mis compras</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="MisDatos.jsp" >Mis datos</a></li>
=======
                                                                        <li class="nav-item bg-dark"><a class="nav-link">Hola <c:out value="${usuarioActivo.getPnombre()}"/></a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ListarMantencionesPorUsuario.jsp" >Mis mantenciones</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ListarArriendosPorUsuario.jsp" >Mis arriendos</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="Controlador?accion=MisCompras">Mis Compras</a></li>
>>>>>>> master
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ControladorLogout" style="color:red">Cerrar Sesión</a></li>
                                                                </ul>
                                                            
                                                            
							</li>
                                                            
                                                        </c:when>
<<<<<<< HEAD

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
=======
                                                        
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
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ControladorTaller">Taller</a></li>
									<li class="nav-item bg-dark"><a class="nav-link" href="ListarSolicitudesArriendo.jsp">Listado solicitudes arriendo</a></li>
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
									</ul>
							</li>
							<li class="nav-item submenu dropdown">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Servicios</a>
								<ul class="dropdown-menu">
									<li class="nav-item bg-dark"><a class="nav-link" href="ControladorMantencion">Solicitud Taller</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ListarSolicitudesMantenciones.jsp">Listado solicitudes taller</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="SolicitudArriendo.jsp">Arriendos</a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ControladorListarSolicitudesArriendo">Listado solicitudes arriendo</a></li>
                                                                        
								</ul>
							</li>
							
							<li class="nav-item submenu dropdown">
								<a href="login.html" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Mi Cuenta</a>
								<ul class="dropdown-menu">
                                                                        <li class="nav-item bg-dark"><a class="nav-link">Hola <c:out value="${usuarioActivo.getPnombre()}"/></a></li>
                                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ControladorListarUsuarios">Listado de usuarios</a></li>
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
>>>>>>> master
    
        
        <!-- Area formulario-->
        <div class="wrapper">
<<<<<<< HEAD
            <h2 class="form-signin-heading" style="text-align:center">Modificar datos de usuario 👤</h2>
        <form action="<c:url value="/ControladorModificarUsuario" />" class="form-signin" method="post">
            
            <div class="mb-3 mt-3">
            <strong for="txtId" class="form-label" >Id usuario:</strong>
            <input type="text" value="<%=u.getIdUsuario()%>" name="txtId"  id="txtId" class="form-control"  readonly="" />
=======
            <h2 class="form-signin-heading" style="text-align:center">Ingrese datos de nuevo usuario</h2>
        <form action="<c:url value="/ModificarUsuario" />" class="form-signin" method="post">
            
            <div class="mb-3 mt-3">
            <label for="txtId" class="form-label" >Id usuario:</label>
            <input type="text" value="${usuario.getIdUsuario}" name="txtId" id="txtId" class="form-control"  readonly="" />
>>>>>>> master
          
            </div>
            
          
            <div class="mb-3 mt-3">
<<<<<<< HEAD
            <strong for="txtEmailusuario" class="form-label" >Email usuario:</strong>
            <input type="text" name="txtEmailusuario" value="<%=u.getEmailUsuario()%>" id="txtEmailusuario" class="form-control"  required />
=======
            <label for="txtEmailusuario" class="form-label" >Email usuario:</label>
            <input type="text" name="txtEmailusuario" value="${usuario.getEmailUsuario}" id="txtEmailusuario" class="form-control"  required />
>>>>>>> master
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>
            </div>
            
<<<<<<< HEAD
           <div class="row">
                <div class="container">
            <strong for="txtPassword" class="form-label">Password:</strong>
            <div class="input-group">
            <input type="password" name="txtPassword" minlength="8" id="txtPassword" class="form-control"  required />
            <div class="input-group-append">
            <button id="show_password" class="btn btn-primary" type="button" onclick="mostrarPassword()"> <span class="fa fa-eye-slash icon"></span> </button>
            </div>
            <small id="passwordHelpBlock" class="form-text text-muted">
            Debe reingresar o cambiar la contraseña para guardar los cambios.
            </div>
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Reingrese o cambie la contraseña.</div>
            </div>
            </div>

            
            <div class="mb-3">
            <strong for="txtNombre" class="form-label">Primer nombre:</strong>
            <input type="text" name="txtNombre" value="<%=u.getNombre()%>" id="txtNombre" class="form-control" required/>
=======
            <div class="mb-3">
            <label for="txtPassword" class="form-label">Password:</label>
            <input type="password" name="txtPassword" value="${usuario.getPassword}" id="txtPassword" class="form-control"  required />
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>
            </div>
            
            <div class="mb-3">
            <label for="txtnombre" class="form-label">Primer nombre:</label>
            <input type="text" name="txtPnombre" value="${usuario.getPnombre}" id="txtPnombre" class="form-control" required/>
>>>>>>> master
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>
            </div>
            
            <div class="mb-3">
<<<<<<< HEAD
            <strong for="txtApellidos" class="form-label">Apellidos:</strong>
            <input type="text" name="txtApellidos" value="<%=u.getApellidos()%>" id="txtApellidos" class="form-control" required/>
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>
            </div>
                      
            <div class="mb-3">
            <strong for="txtRutusuario" class="form-label">Rut:</strong>
            <input type="text" name="txtRutusuario" value="<%=u.getRutUsuario()%>" id="txtRutusuario" class="form-control-plaintext" readonly=""/>
            
            </div>
            
            <div class="mb-3">
            <strong for="txtFechanac" class="form-label">Fecha nacimiento:</strong>
            <input type="date" name="txtFechanac" value="<%=u.getFechanac()%>" id="txtFechanac" class="form-control" required/>
=======
            <label for="txtAppaterno" class="form-label">Apellido paterno:</label>
            <input type="text" name="txtAppaterno" value="${usuario.getAppaterno}" id="txtAppaterno" class="form-control" required/>
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>
            </div>
            
            <div class="mb-3">
            <label for="txtApmaterno" class="form-label">Apellido materno:</label>
            <input type="text" name="txtApmaterno" value="${usuario.getAppaterno}" id="txtApmaterno" class="form-control" required/>   
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>    
            </div>
            
            <div class="mb-3">
            <label for="txtRutusuario" class="form-label">Rut:</label>
            <input type="text" name="txtRutusuario" value="${usuario.getAppaterno}" id="txtRutusuario" class="form-control" required/>
>>>>>>> master
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>    
            </div>
            
            <div class="mb-3">
<<<<<<< HEAD
            <strong for="txtDireccion" class="form-label">Dirección:</strong>
            <input type="text" name="txtDireccion" value="<%=u.getDireccionUsuario()%>" id="txtDireccion" class="form-control" required/>
            <div class="valid-feedback">Válido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>
            </div>
            
            <div class="mb-3">
            <strong for="txtNumtelefono" class="form-label">Teléfono:</strong>
            <input type="number" name="txtNumtelefono" value="<%=u.getNumtelefono()%>" id="txtNumtelefono" class="form-control" required/>
            <div class="valid-feedback">Válido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>
            </div>
            
             <div class="mb-3">
            <strong for="txtConvenio" class="form-label">Convenio:</strong>
            <input type="text" name="txtConvenio" value="<%=u.getConvenio()%>" id="txtConvenio" class="form-control" required/>   
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>    
=======
            <label for="txtFechanac" class="form-label">Fecha nacimiento:</label>
            <input type="date" name="txtFechanac" value="${usuario.getAppaterno}" id="txtFechanac" class="form-control" required/>
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>    
            </div>
            
            <div class="mb-3">
            <label for="txtDireccion" class="form-label">Direccion:</label>
            <input type="text" name="txtDireccion" value="${usuario.getAppaterno}" id="txtDireccion" class="form-control" required/>
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>
            </div>
            
            <div class="mb-3">
            <label for="txtNumtelefono" class="form-label">Telefono:</label>
            <input type="number" name="txtNumtelefono" value="${usuario.getAppaterno}" id="txtNumtelefono" class="form-control" required/>
            <div class="valid-feedback">Valido.</div>
            <div class="invalid-feedback">Por favor llene este campo.</div>
>>>>>>> master
            </div>
            
             <%
              Rol r = new Rol();
              RolDAO  rDAO = new RolDAO();
<<<<<<< HEAD
              List<Rol> roles = rDAO.listarRoles();
              request.setAttribute("rolito", roles);
=======
              List<Rol> mantenciones = rDAO.listarRoles();
              request.setAttribute("rolito", mantenciones);
>>>>>>> master
            
            %>
            
            <div class="mb-3">
<<<<<<< HEAD
                <strong for="cboRol" class="form-label">Rol:</strong>
                <select id="cboRol" name="cboRol" class="custom-select my-1 mr-sm-2">
=======
                <label for="cboRol" class="form-label">Rol:</label>
                <select id="cboRol" name="cboRol" class="form-control">
>>>>>>> master
                <c:forEach items="${rolito}" var="d">
                    <option value="${d.getIdRol()}"> ${d.getNombre()}</option>
                </c:forEach>  
            </select> 
             </div>

<<<<<<< HEAD
                <div>
                <button type="submit" class="btn btn-primary" onclick="javascript:if (!confirm('¿Desea actualizar el usuario <%=u.getNombre()%> <%=u.getApellidos()%>'))return false">Modificar usuario</button>
                <a class="btn btn-danger " href="ListarUsuarios.jsp">Cancelar</a>
              </div>
=======
             
            <button type="submit" class="btn btn-primary">Registrar usuario</button>
            <br>
            <br>    
>>>>>>> master
                       
        </form>
        </div>
        <!--Fin formulario-->
       
<<<<<<< HEAD
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
=======
        
        
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
>>>>>>> master

    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<<<<<<< HEAD
   <script type="text/javascript">
function mostrarPassword(){
		var cambio = document.getElementById("txtPassword");
		if(cambio.type == "password"){
			cambio.type = "text";
			$('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
		}else{
			cambio.type = "password";
			$('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
		}
	} 
	
	$(document).ready(function () {
	//CheckBox mostrar contraseña
	$('#ShowPassword').click(function () {
		$('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');
	});
});
</script>
</c:when></c:choose>
    </body>
=======
  </body>
>>>>>>> master
</html>
