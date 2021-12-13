<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

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

            #myCarousel .carousel-item .mask {
                position: absolute;
                top: 0;
                left:0;
                height:100%;
                width: 100%;
                background-attachment: fixed;
            }
            #myCarousel h4{
                font-size:50px;
                margin-bottom:15px;
                color:#FFF;
                line-height:100%;
                letter-spacing:0.5px;
                font-weight:600;
            }
            #myCarousel p{
                font-size:18px;
                margin-bottom:15px;
                color:#d5d5d5;
            }
            #myCarousel .carousel-item a{background:#F47735; font-size:14px; color:#FFF; padding:13px 32px; display:inline-block; }
            #myCarousel .carousel-item a:hover{background:#394fa2; text-decoration:none;  }

            #myCarousel .carousel-item h4{-webkit-animation-name:fadeInLeft; animation-name:fadeInLeft;} 
            #myCarousel .carousel-item p{-webkit-animation-name:slideInRight; animation-name:slideInRight;} 
            #myCarousel .carousel-item a{-webkit-animation-name:fadeInUp; animation-name:fadeInUp;}
            #myCarousel .carousel-item .mask img{-webkit-animation-name:slideInRight; animation-name:slideInRight; display:block; height:auto; max-width:100%;}
            #myCarousel h4, #myCarousel p, #myCarousel a, #myCarousel .carousel-item .mask img{-webkit-animation-duration: 1s;
                                                                                               animation-duration: 1.2s;
                                                                                               -webkit-animation-fill-mode: both;
                                                                                               animation-fill-mode: both;
            }
            #myCarousel .container {max-width: 1430px;  }
            #myCarousel .carousel-item{height:100%; min-height:550px; }
            #myCarousel{position:relative; z-index:1; background:url(https://i.imgur.com/6axE29k.jpg) center center no-repeat; background-size:cover; }

            .carousel-control-next, .carousel-control-prev{height:40px; width:40px; padding:12px; top:50%; bottom:auto; transform:translateY(-50%); background-color: #f47735; }


            .carousel-item {
                position: relative;
                display: none;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                width: 100%;
                transition: -webkit-transform .6s ease;
                transition: transform .6s ease;
                transition: transform .6s ease,-webkit-transform .6s ease;
                -webkit-backface-visibility: hidden;
                backface-visibility: hidden;
                -webkit-perspective: 1000px;
                perspective: 1000px;
            }
            .carousel-fade .carousel-item {
                opacity: 0;
                -webkit-transition-duration: .6s;
                transition-duration: .6s;
                -webkit-transition-property: opacity;
                transition-property: opacity
            }
            .carousel-fade .carousel-item-next.carousel-item-left, .carousel-fade .carousel-item-prev.carousel-item-right, .carousel-fade .carousel-item.active {
                opacity: 1
            }
            .carousel-fade .carousel-item-left.active, .carousel-fade .carousel-item-right.active {
                opacity: 0
            }
            .carousel-fade .carousel-item-left.active, .carousel-fade .carousel-item-next, .carousel-fade .carousel-item-prev, .carousel-fade .carousel-item-prev.active, .carousel-fade .carousel-item.active {
                -webkit-transform: translateX(0);
                -ms-transform: translateX(0);
                transform: translateX(0)
            }
           /* @supports (transform-style:preserve-3d) {*/
                .carousel-fade .carousel-item-left.active, .carousel-fade .carousel-item-next, .carousel-fade .carousel-item-prev, .carousel-fade .carousel-item-prev.active, .carousel-fade .carousel-item.active {
                    -webkit-transform:translate3d(0, 0, 0);
                    transform:translate3d(0, 0, 0)
                }

                .carousel-fade .carousel-item-left.active, .carousel-fade .carousel-item-next, .carousel-fade .carousel-item-prev, .carousel-fade .carousel-item-prev.active, .carousel-fade .carousel-item.active {
                    -webkit-transform: translate3d(0,0,0);
                    transform: translate3d(0,0,0);
                }



                @-webkit-keyframes fadeInLeft {
                    from {
                        opacity: 0;
                        -webkit-transform: translate3d(-100%, 0, 0);
                        transform: translate3d(-100%, 0, 0);
                    }

                    to {
                        opacity: 1;
                        -webkit-transform: translate3d(0, 0, 0);
                        transform: translate3d(0, 0, 0);
                    }
                }

                @keyframes fadeInLeft {
                    from {
                        opacity: 0;
                        -webkit-transform: translate3d(-100%, 0, 0);
                        transform: translate3d(-100%, 0, 0);
                    }

                    to {
                        opacity: 1;
                        -webkit-transform: translate3d(0, 0, 0);
                        transform: translate3d(0, 0, 0);
                    }
                }

                .fadeInLeft {
                    -webkit-animation-name: fadeInLeft;
                    animation-name: fadeInLeft;
                }

                @-webkit-keyframes fadeInUp {
                    from {
                        opacity: 0;
                        -webkit-transform: translate3d(0, 100%, 0);
                        transform: translate3d(0, 100%, 0);
                    }

                    to {
                        opacity: 1;
                        -webkit-transform: translate3d(0, 0, 0);
                        transform: translate3d(0, 0, 0);
                    }
                }

                @keyframes fadeInUp {
                    from {
                        opacity: 0;
                        -webkit-transform: translate3d(0, 100%, 0);
                        transform: translate3d(0, 100%, 0);
                    }

                    to {
                        opacity: 1;
                        -webkit-transform: translate3d(0, 0, 0);
                        transform: translate3d(0, 0, 0);
                    }
                }

                .fadeInUp {
                    -webkit-animation-name: fadeInUp;
                    animation-name: fadeInUp;
                }

                @-webkit-keyframes slideInRight {
                    from {
                        -webkit-transform: translate3d(100%, 0, 0);
                        transform: translate3d(100%, 0, 0);
                        visibility: visible;
                    }

                    to {
                        -webkit-transform: translate3d(0, 0, 0);
                        transform: translate3d(0, 0, 0);
                    }
                }

                @keyframes slideInRight {
                    from {
                        -webkit-transform: translate3d(100%, 0, 0);
                        transform: translate3d(100%, 0, 0);
                        visibility: visible;
                    }

                    to {
                        -webkit-transform: translate3d(0, 0, 0);
                        transform: translate3d(0, 0, 0);
                    }
                }

                .slideInRight {
                    -webkit-animation-name: slideInRight;
                    animation-name: slideInRight;
                }




            </style>
            <title>Masterbike</title>

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
                                                        <li class="nav-item bg-dark"><a class="nav-link" href="ControladorUsuario">Regístrate</a></li>


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




                <div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="mask flex-center">
                                <div class="container">
                                    <div class="row align-items-center">
                                        <div class="col-md-7 col-12 order-md-1 order-2">
                                            <h4>Todo en bicicletas<br>
                                                para principiantes y profesionales</h4>
                                            <p>Tenemos disponibles bicicletas recreativas, Enduro <br>
                                                Mountain bikes, Downhill, Cross Country y más.</p>
                                            <a href="Controlador?accion=bicicletas">¡COMPRA AHORA!</a> </div>
                                        <div class="col-md-5 col-12 order-md-2 order-1"><img src="https://i.ibb.co/KrRhjR8/bici3.png" class="mx-auto" alt="slide"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="mask flex-center">
                                <div class="container">
                                    <div class="row align-items-center">
                                        <div class="col-md-7 col-12 order-md-1 order-2">
                                            <h4>Tenemos todo en<br>
                                                accesorios de seguridad</h4>
                                            <p>Cascos para principiantes, integrales y enduro, <br>
                                                además de gran cantidad de otros accesorios para mejorar tu experiencia .</p>
                                            <a href="Accesorio.jsp">¡COMPRA AHORA!</a> </div>
                                        <div class="col-md-5 col-12 order-md-2 order-1"><img src="https://i.ibb.co/DVHvQj6/casco2.png" class="mx-auto" alt="slide"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="mask flex-center">
                                <div class="container">
                                    <div class="row align-items-center">
                                        <div class="col-md-7 col-12 order-md-1 order-2">
                                            <h4>Los mejores repuestos<br>
                                                para tu bicicleta</h4>
                                            <p>Somos representantes directos por lo que ofrecemos los mejores precios<br>
                                                y una gran variedad de alternativas.</p>
                                            <a href="Repuesto.jsp">¡COMPRA AHORA!</a> </div>
                                        <div class="col-md-5 col-12 order-md-2 order-1"><img src="https://i.ibb.co/PgK4tpG/frenodisc.png" class="mx-auto" alt="slide"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span> </a> </div>
                <!--slide end--> 
                <br>


                <!-- start features Area -->
                <section class="features-area section_gap">
                    <div class="container">
                        <div class="row features-inner">
                            <!-- single features -->
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="single-features">
                                    <div class="f-icon">
                                        <img src="https://i.ibb.co/SrFhxjN/f-icon1.png" alt=""/>
                                    </div>
                                    <h6>Envío gratuito</h6>
                                    <p>Dentro de región metropolitana</p>
                                </div>
                            </div>
                            <!-- single features -->
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="single-features">
                                    <div class="f-icon">
                                        <img src="https://i.ibb.co/NsSXnf0/f-icon2.png" alt="">
                                    </div>
                                    <h6>Política de reembolso</h6>
                                    <p>Hasta 90 días</p>
                                </div>
                            </div>
                            <!-- single features -->
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="single-features">
                                    <div class="f-icon">
                                        <img src="https://i.ibb.co/x3rHg8Q/f-icon3.png" alt="">
                                    </div>
                                    <h6>Servicio al cliente</h6>
                                    <p>Respondemos tus dudas</p>
                                </div>
                            </div>
                            <!-- single features -->
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="single-features">
                                    <div class="f-icon">
                                        <img src="https://i.ibb.co/wB1z1CT/f-icon4.png" alt="">
                                    </div>
                                    <h6>Todo medio de pago</h6>
                                    <p>Crédito sin intereses</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- end features Area -->



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
