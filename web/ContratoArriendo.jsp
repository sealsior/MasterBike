<%-- 
    Document   : ContratoArriendo
    Created on : 01-12-2021, 20:21:53
    Author     : baggr
--%>

<%@page import="Model.Usuario"%>
<%@page import="DAO.SolicitudarriendoDAO"%>
<%@page import="Model.Solicitudarriendo"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Contrato de arriendo</title>


        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <!-- Bootstrap core CSS     -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="assets/css/animate.min.css" rel="stylesheet"/>

        <!--  Light Bootstrap Table core CSS    -->
        <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet"/>


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="assets/css/demo.css" rel="stylesheet" />


        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
        <style>
            .container {


                text-align: center;

            }
        </style>

    </head>
    <body>
    <center>
        <div class="container">
            <div class="container" id="div_print">
                <img src="https://i.ibb.co/CH3Ln98/logo.png" alt="">

                <%
                    Solicitudarriendo s = (Solicitudarriendo) request.getAttribute("solicitudarriendo");
                    out.println("<p><b>Id de arriendo: </b>" + s.getIdSolArriendo() + "</p>");
                    out.println("<h2><b>Contrato de arriendo  de bicicleta</h2>");
                    out.println("<p><b>***************</b>");
                    out.println("<br>");
                    out.println("<p>Se celebra el presente contrato entre Masterbike Ltda. y el Sr. " + s.getUsuario().getNombre() + " " + s.getUsuario().getApellidos() + ", rut " + s.getUsuario().getRutUsuario() + "<br>"
                            + "desde el dia: " + s.getFeciniArriendo() + " hasta el: " + s.getFecfinArriendo() + " por bicicleta tipo " + s.getTipobicicleta() + ".  </p>");
                    out.println("<p>Masterbike es el propietario de las bicicletas de alquiler y del equipamiento que se exponen <br>"
                            + "en este contrato de arrendamiento el cual es del tipo " + s.getUsuario().getConvenio() + " de acuerdo a acuerdo colectivo<br>"
                            + "para asegurar que la bicicleta y el equipo se utiliza correctamente y para garantizar que cada usuario <br>"
                            + "se comporta de manera responsable, y tiene la mejor experiencia posible, el arrendatario está de acuerdo en:<br>"
                            + "<br>"
                            + "1. Ser responsable del cuidado y devolución de la bicicleta y los accesorios (candados, casco, etc.).<br>"
                            + " Las bicicletas serán inspeccionadas al momento de su entrega. Han de ser devueltas en el mismo estado <br>"
                            + "que al ser alquiladas, haciéndose cargo el usuario de cualquier desperfecto ocasionado. En caso de robo<br>"
                            + " o pérdida del material, el usuario deberá abonar a Masterbike el importe del material perdido.<br>"
                            + "<br>"
                            + "2. El usuario conoce y se compromete a respetar las leyes y normas de tráfico y es responsable de todo<br>"
                            + " daño causado como consecuencia de cualquier accidente durante el uso de la bicicleta.<br>"
                            + "<br>"
                            + "3. Masterbike no se hace responsable de ningún tipo de reclamaciones. El usuario está obligado en todo <br>"
                            + " momento a candar correctamente las bicicletas. Para evitar robos es recomendable candarla siempre del <br>"
                            + "cuadro y rueda en lugares fijos.<br>"
                            + "<br>"
                            + "4. En caso de robo de la bicicleta, el arrendador deberá pagar el importe total de la misma.<br>"
                            + "<br>"
                            + "5. Se requiere una garantía en efectivo por bicicleta, que será devuelto en el momento de la devolución<br>"
                            + " de la bicicleta una vez comprobado el estado.<br>"
                            + "<br>"
                            + "6. No se efectuará reembolso por devolución antes de la hora estipulada en el contrato.<br>"
                            + "<br>"
                            + "7. El retraso en la devolución supondrá el abono de la tarifa correspondiente.</p>");
                    out.println("<p><br></p>");
                    out.println("<p><br></p>");
                    out.println("<p><br></p>");
                    out.println("<p>Firma Cliente</p>");


                %> 
            </div>
            <input name="b_print" type="button" class="ipt" onClick="printdiv('div_print');" value=" Imprimir Contrato "></center>

        </div>


    </body>
    <!--   Core JS Files   -->
    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

    <!--  Checkbox, Radio & Switch Plugins -->
    <script src="assets/js/bootstrap-checkbox-radio-switch.js"></script>

    <!--  Charts Plugin -->
    <script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="assets/js/light-bootstrap-dashboard.js"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="assets/js/demo.js"></script>

    <!-- Impresion del DIV  -->
    <script language="javascript">
                function printdiv(printpage)
                {
                    var headstr = "<html><head><title></title></head><body>";
                    var footstr = "</body>";
                    var newstr = document.all.item(printpage).innerHTML;
                    var oldstr = document.body.innerHTML;
                    document.body.innerHTML = headstr + newstr + footstr;
                    window.print();
                    document.body.innerHTML = oldstr;
                    return false;
                }
    </script>


</html>