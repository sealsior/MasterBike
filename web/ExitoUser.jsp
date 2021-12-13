<%-- 
    Document   : ExitoUser
    Created on : 13-10-2021, 18:10:15
    Author     : baggr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html>
        <head>
            <link rel="shortcut icon" href="https://masterbike.ro/img/favicon.ico?1636634012">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta http-equiv="Refresh" content="3;URL=Login.jsp">
            
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
                
                * {
    box-sizing: border-box;
    padding: 0;
    margin: 0;
}
/* center in the viewport */
body {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
body > svg {
    display: block;
    width: 80vw;
    max-width: 500px;
    height: auto;
}

/* animate the group describing the bicycle along a prescribed path */
#bicycle {
    offset-path: path("M 0 0 l 200 -200 a 50 50 0 0 1 50 0 l 100 100 a 50 50 0 0 0 50 0 l 125 -125");
    offset-distance: 0%;
    animation: offsetDistance 4s cubic-bezier(0.645, 0.045, 0.355, 1) infinite alternate;
}
@keyframes offsetDistance {
    to {
        offset-distance: 100%;
    }
}

        
        
        </style>
            <title>Usuario registrado</title>
        </head>
        <body>
            
            <div><a class="navbar-brand logo_h" href="inicio.jsp"><img src="https://i.ibb.co/CH3Ln98/logo.png" alt=""></a></div>
            
            <br>
        <div class="container mt-3">
        <h2>Registro exitoso!</h2>
        </div>
          
            <!-- be warned: messy syntax -->
<svg viewBox="0 0 700 500" width="700" height="500">
    <defs>
        <!-- group element describing the bicycle
        the icon was actually designed for a different project :P
        -->
        <g id="bicycle">
            <svg viewBox="0 0 100 60" x="-75" y="-45" width="150" height="90">
                <g fill="none" stroke-width="4" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="21" cy="39" r="19" />
                    <circle cx="21" cy="39" r="7" />

                    <circle cx="48" cy="39" r="6" />

                    <path d="M 40 39 h -19 l 15 -25 h 29 l 15 25 m -13.2 -22 l -14 15" />
                    <path d="M 44 32 l -12 -27 h -6 h 10 q 5 0 5 2" />
                    <path d="M 65 13 l -5 -12 h -2 h 15 a 6 6 0 0 1 0 12" />

                    <circle cx="79" cy="39" r="19" />
                    <circle cx="79" cy="39" r="7" />
                </g>
            </svg>
        </g>

        <!-- rectangles clipping the visible area for the bike icon -->
        <clipPath id="clip--blue" clipUnits="userSpaceOnUse">
            <rect transform="rotate(-45)" x="-75" width="300" y="-50" height="100" />
        </clipPath>
        <clipPath id="clip--red">
            <rect transform="rotate(45)" x="-50" width="220" y="-362.5" height="140" />
        </clipPath>
        <clipPath id="clip--yellow">
            <rect transform="rotate(-45)" x="217.5" width="217.5" y="167.5" height="100" />
        </clipPath>
    </defs>
    <g transform="translate(75 400)">
        <!-- path element describing the path picked up by CSS -->
        <!-- <path id="motion-path" fill="none" stroke="currentColor" stroke-width="2" stroke-dasharray="5" d="M 0 0 l 200 -200 a 50 50 0 0 1 50 0 l 100 100 a 50 50 0 0 0 50 0 l 125 -125" /> -->

        <!-- include four variants of the bike group, with a different color and a clip hiding the variant past a defined threshold  -->
        <use href="#bicycle" stroke="#34a853" />
        <use clip-path="url(#clip--yellow)" href="#bicycle" stroke="#fabb05" />
        <use clip-path="url(#clip--red)" href="#bicycle" stroke="#ea4335" />
        <use clip-path="url(#clip--blue)" href="#bicycle" stroke="#4285f4" />

        <!-- colored rectangles included below the bicycle, and very loosely matching the clipPath elements -->
        <g transform="translate(37.5 22.5) rotate(-45)">
            <rect fill="#4285f4" rx="10" width="262.5" height="50" />
            <g transform="translate(262.5 0)">
                <g transform="rotate(90)">
                    <rect fill="#ea4335" rx="10" width="262.5" height="50" />
                    <g transform="translate(212.5 50)">
                        <g transform="rotate(-90)">
                            <rect fill="#fabb05" rx="10" width="212.5" height="50" />
                            <g transform="translate(212.5 50)">
                                <path fill="#34a853" stroke="#34a853" stroke-width="10" stroke-linejoin="round" stroke-linecap="round" d="M 0 0 v 50 l 80 -75 -80 -75 z" />
                            </g>
                        </g>
                    </g>
                </g>
            </g>
        </g>
    </g>
</svg>
            
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
