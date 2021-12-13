<%@page import="Model.Detalleventa"%>
<%@page import="DAO.DetalleventaDAO"%>
<%@page import="Model.Venta"%>
<%@page import="java.util.List"%>
<%@page import="DAO.VentaDAO"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="es">

    <head>
        <link rel="shortcut icon" href="https://masterbike.ro/img/favicon.ico?1636634012">

        <meta charset="UTF-8">
        <title>Reportes de venta</title>

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

        <!--cdn para diseño y tipo de letra -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


        <style>
            body {
                font: 90%/1.45em "Helvetica Neue", HelveticaNeue, Verdana, Arial, Helvetica, sans-serif;
                margin: 0;
                padding: 0;
                color: #333;
                background-color: #fff;
            }

        </style>
        <style>
            #mydatatable tfoot input {
                width: 70% !important;
            }

            #mydatatable tfoot {
                display: table-header-group !important;
            }
        </style>
    </head>

    <body class="container-fluid p-5">
        <div class="card-header">
            <a class="btn btn-primary " href="MenuTrabajadores.jsp">Volver</a>
            <a class="btn btn-success " href="MantencionReportes.jsp">Reporte de mantención</a>
            <h2 class="w3-wide w3-center text-center" >Reportes de ventas</h2>

        </div>
        <div class="table-responsive" id="mydatatable-container">
            <table class="records_list table table-striped table-bordered table-hover" id="mydatatable">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">FECHA</th>
                        <th class="text-center">PRECIO UNITARIO</th>
                        <th class="text-center">CANTIDAD</th>
                        <th class="text-center">TOTAL</th>
                        <th class="text-center">PRODUCTO</th>
                        <th class="text-center">USUARIO</th>

                        <th class="text-center">ESTADO</th>

                    </tr>
                </thead>
                <%
                    DetalleventaDAO dDAO = new DetalleventaDAO();

                    List<Detalleventa> venta = dDAO.listarDetalleventa();
                    request.setAttribute("pro", venta);
                %>
                <tfoot>
                    <tr>
                        <th></th>
                        <th class="date"></th>
                    </tr>
                </tfoot>
                <tbody>
                    <c:forEach var="p" items="${pro}">
                        <tr class="text-center">
                            <td>${p.getVenta().getIdVenta()}</td>
                            <td>${p.getVenta().getFechora()}</td>
                            <td>$.${p.getPrecioventa()}</td>
                            <td>${p.getCantidad()}</td>
                            <td>$.${p.getVenta().getTotalventa()}</td>
                            <td>${p.getProducto().getNombreproducto()}</td>
                            <td>${p.getVenta().getUsuario().getNombre()} ${p.getVenta().getUsuario().getApellidos()}</td>

                            <td>${p.getVenta().getEstadoventa()}</td>



                        </tr>
                    </c:forEach>  

                </tbody>
                <tfoot>
                <td class="bg-grays-active color-palette"><b>TOTAL</b></td>
                <td class="bg-teals-active color-palette text-center"></td>
                <td class="bg-teals-active color-palette text-center">
                    <strong></strong>
                </td>
                <td class="bg-teals-active color-palette text-center"></td>

                <td class="bg-teals-active color-palette text-center">
                    <b>$. </b><strong id="monto" class="badge"></strong>
                </td>
                <td class="bg-teals-active color-palette text-center">
                    <strong></strong>
                </td>
                <td class="bg-teals-active color-palette text-center">
                    
                </td>
                <td class="bg-teals-active color-palette text-center"></td>
                </tfoot>
            </table>
        </div>

                <!-- Scripts de PDF-->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.1.0/js/dataTables.buttons.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.1.0/js/buttons.html5.min.js"></script>

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
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'pdfHtml5',
                            download: 'open'
                        }
                    ],
                    drawCallback: function () {
                        var api = this.api();
                       
                        var monto = api.column(4, {"filter": "applied"}).data().sumSpan();
                        $('#monto').html(monto);
                    },
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



            $(document).ready(function () {
               
                jQuery.fn.dataTable.Api.register('sumSpan()', function ( ) {
                    return this.flatten().reduce(function (a, b) {
                        if (typeof a === 'string') {
                            a = a.replace(/[^\d.-]/g, '') * 1;
                        }
                        if (typeof b === 'string') {
                            var regex = /(\d+)/g;
                            b = b.match(regex)[0];
                            b = b.replace(/[^\d.-]/g, '') * 1;
                        }
                        return a + b;
                    }, 0);
                });

            });
        </script>
    </body>

</html>