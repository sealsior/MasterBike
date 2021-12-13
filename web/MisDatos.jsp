<%-- 
    Document   : MisDatos
    Created on : 14-11-2021, 14:15:59
    Author     : baggr
--%>

<%@page import="java.util.List"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="Model.Usuario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="https://masterbike.ro/img/favicon.ico?1636634012">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Bootstrap CSS -->

        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">

        <script src="https://kit.fontawesome.com/c747d09760.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>


        <style>     
            .container {


                text-align: center;

            }


        </style>
        <style>
            /*Main CSS*/


            /*Login Signup Page*/
            a:focus,a:hover,a{
                outline:none;
                text-decoration: none;
            }
            li,ul{
                list-style: none;
                padding: 0;
                margin: 0;
            }
            .header-top i {
                font-size: 18px;
            }
            .bg-image {
                background: url(../images/background-login.jpg) no-repeat 0 0 / cover;
                position: relative;
                width: 100%;
                height: 100vh;
                display: table;
            }

            .login-header {
                display: inline-block;
                width: 100%;
                background: #0e1a35;
            }

            .login-signup {
                display: table-cell;
                vertical-align: middle;
                width: 100%;
            }

            .login-logo img {
                cursor: pointer;
                max-width: 171px;
                padding: 23px 15px 22px;
                width: 100%;
            }

            .login-header .navbar-right {
                margin-right: 0px;
            }

            .login-header .nav-tabs > li.active > a,
            .login-header .nav-tabs > li.active > a:focus,
            .login-header .nav-tabs > li.active > a:hover {
                background-color: transparent;
                border: none;
                color: #fff;
            }

            .login-header .nav-tabs > li > a {
                border: medium none;
                border-radius: 0;
                font-size: 14px;
                font-weight: 500;
                line-height: 48px;
                padding: 15px 30px;
                color: #fff;
            }

            .login-header .nav-tabs {
                border-bottom: none;
            }

            .login-header .nav-tabs > li {
                margin-bottom: 0px;
            }

            .login-header .nav > li > a:focus,
            .login-header .nav > li > a:hover {
                background: none;
                text-decoration: none;
            }

            .login-header .nav-tabs > li.active {
                border-bottom: 6px solid #5584ff;
            }

            .login-inner h1 {
                color: #8492af;
                font-size: 48px;
                font-weight: 300;
                text-align: center;
                margin-top: 0;
                margin-bottom: 20px;
            }

            .login-inner h1 span {
                color: #5584ff;
            }

            .login-form {
                text-align: center;
            }

            .login-form input {
                -moz-border-bottom-colors: none;
                -moz-border-left-colors: none;
                -moz-border-right-colors: none;
                -moz-border-top-colors: none;
                background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
                border-color: -moz-use-text-color -moz-use-text-color #d4d9e3;
                border-image: none;
                border-style: none none solid;
                border-width: medium medium 1px;
                font-size: 13px;
                font-weight: 300;
                width: 100%;
                color: #8492af;
                padding: 15px 50px;
                font-size: 17px;
                max-width: 550px;
            }

            .login-form label {
                margin-bottom: 30px;
                width: 100%;
            }

            .user input {
                background: rgba(0, 0, 0, 0) url("../images/user.png") no-repeat scroll 7px 12px;
            }

            .pass input {
                background: rgba(0, 0, 0, 0) url("../images/password.png") no-repeat scroll 7px 12px;
            }

            .mail input {
                background: rgba(0, 0, 0, 0) url("../images/mail.png") no-repeat scroll 4px 12px;
            }

            .login-signup .tab-content {
                background: #ffffff none repeat scroll 0 0;
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.176);
                display: inline-block;
                margin-top: -8px;
                width: 100%;
            }

            .form-btn {
                background: #5584ff none repeat scroll 0 0;
                border: medium none;
                border-radius: 100px;
                color: #ffffff;
                font-weight: 400;
                max-width: 250px;
                padding: 10px 0;
                position: relative;
                width: 100%;
                margin: 40px 0;
                box-shadow: 0 2px 8px #d2d2d2;
                -moz-box-shadow: 0 2px 8px #d2d2d2;
                -webkit-box-shadow: 0 2px 8px #d2d2d2;
            }

            .form-btn::before {
                content: "";
                font-family: FontAwesome;
                position: absolute;
                right: 17px;
                top: 9px;
            }

            .form-details {
                padding: 35px 0;
            }

            .tab-content .tab-pane {
                padding: 70px 0;
            }


            /*Login Signup Page*/


            /*Home Page*/

            .home {
                background: #f6f7fa;
            }

            #navigation {
                background: #212429;
            }

            #navigation {
                padding: 0;
            }

            .display-table {
                display: table;
                padding: 0;
                height: 100%;
                width: 100%;
            }

            .display-table-row {
                display: table-row;
                height: 100%;
            }

            .display-table-cell {
                display: table-cell;
                float: none;
                height: 100%;
            }

            .v-align {
                vertical-align: top;
            }

            .logo img {
                max-width: 180px;
                padding: 16px 0 17px;
                width: 100%;
            }

            .header-top {
                margin: 0;
                padding-top: 2px;
            }

            .header-top img {
                border-radius: 50%;
                max-width: 48px !important;
                width: 100%;
            }

            .add-project {
                background: #5584ff none repeat scroll 0 0;
                border-radius: 100px;
                color: #ffffff;
                font-size: 14px;
                font-weight: 600;
                padding: 10px 27px 10px 45px;
                position: relative;
            }

            .header-rightside .nav > li > a:focus,
            .header-rightside .nav > li > a:hover {
                background: none;
                text-decoration: none;
            }

            .add-project::before {
                background: rgba(0, 0, 0, 0) url("../images/plus.png") no-repeat scroll 0 0;
                content: "";
                ;
                height: 12px;
                left: 17px;
                position: absolute;
                top: 12px;
                width: 12px;
            }

            .add-project:hover {
                color: #ffffff;
            }

            .header-top i {
                color: #0e1a35;
            }

            .icon-info {
                position: relative;
            }
            .navi i {
                font-size: 20px;
            }
            .label.label-primary {
                border-radius: 50%;
                font-size: 9px;
                left: 8px;
                position: absolute;
                top: -9px;
            }

            .icon-info .label {
                border: 2px solid #ffffff;
                font-weight: 500;
                padding: 3px 5px;
                text-align: center;
            }

            .header-top li {
                display: inline-block;
                text-align: center;
            }

            .header-top .dropdown-toggle {
                color: #0e1a35;
            }

            .header-top .dropdown-menu {
                border: medium none;
                left: -85px;
                padding: 17px;
            }
            .view {
                background: #5584ff none repeat scroll 0 0;
                border-radius: 100px;
                color: #ffffff;
                display: inline-block;
                font-size: 14px;
                font-weight: 600;
                margin-top: 10px;
                padding: 10px 15px;
            }

            .navbar-content > span {
                font-size: 13px;
                font-weight: 700;
            }

            .img-responsive {
                width: 100%;
            }
            #navigation{
                -webkit-transition: all 0.5s ease;
                -moz-transition: all 0.5s ease;
                -o-transition: all 0.5s ease;
                transition: all 0.5s ease;
            }
            .search input {
                border: none;
                font-size: 15px;
                padding: 15px 9px;
                width: 100%;
                background: rgba(0, 0, 0, 0) url("../images/search.png") no-repeat scroll 99% 12px;
                color: #8492af;
            }

            /*header {
                background: #ffffff none repeat scroll 0 0;
                box-shadow: 0 1px 12px rgba(0, 0, 0, 0.04);
                display: inline-block !important;
                line-height: 23px;
                padding: 15px;
                transition: all 0.5s ease 0s;
                width: 100%;
                -webkit-transition: all 0.5s ease;
                -moz-transition: all 0.5s ease;
                -o-transition: all 0.5s ease;
                transition: all 0.5s ease;
            }*/

            .logo {
                text-align: center;
            }

            .navi a {
                border-bottom: 1px solid #0d172e;
                border-top: 1px solid #0d172e;
                color: #ffffff;
                display: block;
                font-size: 17px;
                font-weight: 500;
                padding: 28px 20px;
                text-decoration: none;
            }

            .navi i {
                margin-right: 15px;
                color: #f6f7fa;
            }

            .navi .active a {
                background: #676767;
                border-left: 5px solid #676767;
                padding-left: 15px;
            }

            .navi a:hover {
                background: #676767 none repeat scroll 0 0;
                border-left: 5px solid #676767;
                display: block;
                padding-left: 15px;
            }

            .navbar-default {
                background-color: #ffffff;
                border-color: #ffffff;
            }

            .navbar-toggle {
                border: none;
            }

            .navbar-default .navbar-toggle:focus,
            .navbar-default .navbar-toggle:hover {
                background-color: rgba(0, 0, 0, 0);
            }

            .navbar-default .navbar-toggle .icon-bar {
                background-color: #0e1a35;
            }

            .circle-logo {
                margin: 0 auto;
                max-width: 30px !important;
                text-align: center;
            }
            .hidden-xs{
                -webkit-transition: all 0.5s ease;
                -moz-transition: all 0.5s ease;
                -o-transition: all 0.5s ease;
                transition: all 0.5s ease;
            }

            .user-dashboard {
                padding: 0 20px;
            }

            .user-dashboard h1 {
                color: #0e1a35;
                font-size: 30px;
                font-weight: 500;
                margin: 0;
                padding: 21px 0;
            }
            .sales {
                background: #ffffff none repeat scroll 0 0;
                border: 1px solid #d4d9e3;
                display: inline-block;
                padding: 15px;
                width: 100%;
            }
            .sales button {
                background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
                border: 1px solid #dadee7;
                border-radius: 100px;
                font-size: 15px;
                letter-spacing: 0.5px;
                padding-right: 32px;
                color: #0e1a35;
            }

            .sales button::before {
                content: "";
                font-family: FontAwesome;
                position: absolute;
                right: 12px;
                top: 11px;
            }
            .sales  .btn-group {
                float: right;
            }
            .sales h2 {
                color: #8492af;
                float: left;
                font-size: 21px;
                font-weight: 600;
                margin: 0;
                padding: 9px 0 0;
            }
            .btn.btn-secondary.btn-lg.dropdown-toggle > span {
                font-size: 15px;
                font-weight: 600;
                letter-spacing: 0.5px;
            }
            .sales .dropdown-menu{
                margin: 0px;
                padding: 0px;
                border: 0px;
                border-radius: 8px;
                width: 100%;
                color: #0e1a35;
            }
            .sales .btn-group.open .dropdown-toggle, .btn.active, .btn:active{
                box-shadow: none;
            }
            .sales .dropdown-menu > a {
                color: #0e1a35;
                display: inline-block;
                font-weight: 800;
                padding: 9px 0;
                text-align: center;
                width: 100%;
            }
            #my-cool-chart svg {
                width: 100%;
            }
            .sales .dropdown-menu > a:hover{
                color: #5584FF;   
            }
            .shield-buttons {
                display: none;
            }
            .close, .close:focus, .close:hover {
                color: #fff;;
                opacity: 1;
                text-shadow: none;
            }
            .modal-body input {
                border: 1px solid #d4d9e3;
                font-size: 14px;
                font-weight: 300;
                margin: 5px 0;
                padding: 14px 10px;
                width: 100%;
                color: #8492af;
            }
            .modal-body textarea {
                border: 1px solid #d4d9e3;
                font-size: 14px;
                font-weight: 300;
                height: 200px;
                margin-top: 5px;
                padding: 9px 10px;
                width: 100%;
                color: #8492af;
            }
            .modal-header.login-header h4 {
                color: #ffffff;
            }
            .modal-footer .add-project {
                background: #5584ff none repeat scroll 0 0;
                border: medium none;
                border-radius: 100px;
                color: #ffffff;
                font-size: 14px;
                font-weight: 600;
                padding: 10px 30px;
                position: relative;
            }
            .modal-footer .add-project::before{display: none;}
            .modal-footer {
                border: 0 none;
                padding: 10px 15px 26px;
                text-align: right;
            }
            .cancel {
                background: #0E1A35     ;
                border: medium none;
                border-radius: 100px;
                color: #ffffff;
                font-size: 14px;
                font-weight: 600;
                padding: 10px 30px;
                position: relative;

            }
            .modal{
                top: 20%; 
            }
            .modal-header .close {
                margin-top: 2px;
            }
            .search input:focus{
                border-bottom: 1px solid #BDC4D4;
                line-height:22px;
                transition: 0.1s all;
            }
            .modal-header.login-header {
                border-top-left-radius: 5px;
                border-top-right-radius: 5px;
                /*Main CSS*/






                @media only screen and (max-device-width: 767px) {
                    .login-logo img {
                        margin: 0 auto;
                    }
                    .login-details .nav-tabs > li {
                        text-align: center;
                        width: 50%;
                    }
                    .login-signup .login-inner h1 {
                        font-size: 26px;
                        margin-bottom: 0;
                        margin-top: 10px;
                    }
                    .login-inner .login-form input {
                        font-size: 15px;
                        max-width: 100%;
                        padding: 15px 45px;
                    }
                    .login-inner .form-details {
                        padding: 25px;
                    }
                    .login-inner .login-form label {
                        margin-bottom: 20px;
                        width: 100%;
                    }
                    .login-inner .form-btn {
                        margin: 0;
                        max-width: 180px;
                    }
                    .tab-content .tab-pane {
                        padding: 20px 0;
                    }
                    #navigation .navi a {
                        font-size: 14px;
                        padding: 20px;
                        text-align: center;
                    }
                    #navigation .navi i {
                        margin-right: 0px;
                    }
                    #navigation .navi a:hover,
                        #navigation .navi .active a {
                        background: #122143 none repeat scroll 0 0;
                        border-left: none;
                        display: block;
                        padding-left: 20px;
                    }
                    header .header-top img {
                        max-width: 38px !important;
                    }
                    .v-align header {
                        padding: 12px 15px;
                    }
                    header .header-top li {
                        padding-left: 13px;
                        padding-right: 6px;
                    }
                    .navbar-default .navbar-toggle {
                        border-color: rgba(0, 0, 0, 0);
                    }
                    .navbar-header .navbar-toggle {
                        float: left;
                        margin: 0;
                        padding: 0;
                        top: 12px;
                    }
                    button,
                    html [type="button"],
                    [type="reset"],
                    [type="submit"] {
                        outline: medium none;
                    }
                    .user-dashboard .sales h2 {
                        color: #8492af;
                        float: left;
                        font-size: 14px;
                        font-weight: 600;
                        margin: 0;
                        padding: 13px 0 0;
                    }
                    .user-dashboard .btn.btn-secondary.btn-lg.dropdown-toggle > span {
                        font-size: 11px;
                    }
                    .user-dashboard .sales button {
                        font-size: 11px;
                        padding-right: 23px;
                    }  
                    .user-dashboard .sales h2 {
                        font-size: 12px;
                    }
                    .gutter{
                        padding: 0;
                    }


                    @media only screen and (max-device-width: 992px) {
                        header .header-top li {
                            padding-left: 20px !important;
                            padding-right: 0;
                        }
                        header .logo img {
                            max-width: 125px !important;
                        }

                    }

                    @media only screen and (min-device-width: 767px) and (max-device-width: 998px){
                        .user-dashboard .header-top {
                            padding-top: 5px;
                        }
                        .user-dashboard .header-rightside {
                            display: inline-block;
                            float: left;
                            width: 100%;
                        }
                        .user-dashboard .header-rightside .header-top img {
                            max-width: 41px !important;
                        } 
                        .user-dashboard .sales button {
                            font-size: 10px;
                        }
                        .user-dashboard .btn.btn-secondary.btn-lg.dropdown-toggle > span {
                            font-size: 12px;
                        }
                        .user-dashboard .sales h2 {
                            font-size: 15px;
                        }
                    }
                    @media only screen and (min-device-width:998px) and (max-device-width: 1350px){
                        #navigation .logo img {
                            max-width: 130px;
                            padding: 16px 0 17px;
                            width: 100%;
                        }
                    }
                </style>
                <title>Mis Datos</title>
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


                    <div class="container-fluid display-table">
                        <div class="row display-table-row">
                            <c:choose> 

                                <c:when test="${perfil == 2}"><!--Rol 2 Vendedor -->

                                    <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">

                                        <div class="navi">
                                            <ul>
                                                <li><a href="MenuTrabajadores.jsp"><i class="fa fa-home" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Inicio</span></a></li>
                                                <li><a href="ControladorMantencion"><i class="fas fa-hammer" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Solicitar Taller</span></a></li>
                                                        <li><a href="SolicitudArriendo.jsp"><i class="fa fa-calendar" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Solicitar Arriendos</span></a></li>
                                                        <li><a href="ListarSolicitudesArriendo.jsp"><i class="fa fa-calendar" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Arriendos</span></a></li>
                                                <li><a href="ListaStock.jsp"><i class="fab fa-stack-exchange" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Stock</span></a></li>
                                                <li><a href="EnviarPromocion.jsp"><i class="fas fa-envelope-square" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Enviar Promociones</span></a></li>
                                                <li  class="active"><a href="MisDatos.jsp"><i class="fa fa-cog" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Configuración</span></a></li>
                                            </ul>
                                        </div>
                                    </div>


                                </c:when>
                                <c:when test="${perfil == 3}"><!--Rol 3 Tecnico -->

                                    <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">

                                        <div class="navi">
                                            <ul>
                                                <li><a href="MenuTrabajadores.jsp"><i class="fa fa-home" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Inicio</span></a></li>
                                                <li><a href="ListarSolicitudesMantenciones.jsp"><i class="fa fa-tasks" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Solicitudes</span></a></li>

                                                <li><a href="ListaStock.jsp"><i class="fab fa-stack-exchange" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Stock</span></a></li>
                                                <li><a href="ListaDocumentos.jsp"><i class="fas fa-file-pdf" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Documentos</span></a></li>
                                                <li  class="active"><a href="MisDatos.jsp"><i class="fa fa-cog" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Configuración</span></a></li>
                                            </ul>
                                        </div>
                                    </div>


                                </c:when>

                                <c:when test="${perfil == 4}"><!--Rol 4 Supervisor -->

                                    <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">

                                        <div class="navi">
                                            <ul>
                                                <li><a href="MenuTrabajadores.jsp"><i class="fa fa-home" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Inicio</span></a></li>
                                                <li><a href="ListarSolicitudesMantenciones.jsp"><i class="fas fa-hammer" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Lista Solicitudes</span></a></li>
                                                <li><a href="ListarSolicitudesArriendo.jsp"><i class="fa fa-calendar" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Arriendos</span></a></li>
                                                <li><a href="EnviarSeguimiento.jsp"><i class="fas fa-shipping-fast" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Enviar compras</span></a></li>
                                                <li><a href="ListaSeguimiento.jsp"><i class="fas fa-clipboard-check" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Finalizar compras</span></a></li>
                                                <li><a href="ListaProducto.jsp"><i class="fas fa-bicycle" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Productos</span></a></li>
                                                <li><a href="ListarUsuarios.jsp"><i class="fas fa-user" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Usuarios</span></a></li>
                                                <li><a href="DetalleReportes.jsp"><i class="far fa-chart-bar" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Reportes de venta</span></a></li>
                                                <li><a href="EnviarPromocion.jsp"><i class="fas fa-envelope-square" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Enviar Promociones</span></a></li>
                                                <li  class="active"><a href="MisDatos.jsp"><i class="fa fa-cog" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Configuración</span></a></li>
                                            </ul>
                                        </div>
                                    </div>


                                </c:when>

                                <c:when test="${perfil == 5}"><!--Rol 5 Bodeguero -->

                                    <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">

                                        <div class="navi">
                                            <ul>
                                                <li><a href="MenuTrabajadores.jsp"><i class="fa fa-home" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Inicio</span></a></li>
                                                <li><a href="ListaProducto.jsp"><i class="fas fa-clipboard-check" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Productos</span></a></li>
                                                <li><a href="ListaDocumentos.jsp"><i class="fas fa-file-pdf" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Documentos</span></a></li>
                                                <li class="active"><a href="MisDatos.jsp"><i class="fa fa-cog" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Configuración</span></a></li>
                                            </ul>
                                        </div>
                                    </div>


                                </c:when>

                            </c:choose>
                            <div class="container">
                                <br>
                                <br>

                                <div class="container mt-3">     
                                    <h1>Mis Datos 👤</h1>
                                    <br>
                                    <form action="<c:url value="/ControladorListarMisDatos" />" method="post" >
                                        <table class="table table-striped" id="table_id">
                                            <thead>
                                                <tr>
                                                    <th>Email</th>
                                                    <th>Nombres</th>
                                                    <th>Rut</th>
                                                    <th>Fecha nacimiento</th>
                                                    <th>Dirección</th>
                                                    <th>Número teléfono</th>
                                                    <th>Convenio</th>
                                                    <th>📝</th>



                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    Usuario user = new Usuario();
                                                    user = (Usuario) session.getAttribute("usuarioActivo");
                                                    UsuarioDAO uDAO = new UsuarioDAO();
                                                    List<Usuario> usuarios = uDAO.buscarUsuarioModificar(user);
                                                    for (Usuario d : usuarios) {
                                                        out.println("<tr>");
                                                        out.println("<td>" + d.getEmailUsuario() + "</td>");
                                                        out.println("<td>" + d.getNombre() + " " + d.getApellidos() + "</td>");
                                                        out.println("<td>" + d.getRutUsuario() + "</td>");
                                                        out.println("<td>" + d.getFechanac() + "</td>");
                                                        out.println("<td>" + d.getDireccionUsuario() + "</td>");
                                                        out.println("<td>" + d.getNumtelefono() + "</td>");
                                                        out.println("<td>" + d.getConvenio() + "</td>");
                                                        out.println("<td><button type='submit' class='btn btn-success' name='accion' value='aprobar-" + d.getIdUsuario() + "' style=';max-width:100%;'>Modificar</button></td>");
                                                        out.println("</tr>");

                                                    }

                                                %>


                                            </tbody>
                                        </table>
                                    </form>
                                </div>

                            </div>
                        </div>
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

                <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

                <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>



            </body>
        </html>