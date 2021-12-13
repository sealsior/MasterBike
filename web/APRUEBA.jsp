<%-- 
    Document   : APRUEBA
    Created on : 03-12-2021, 18:37:10
    Author     : Marco
--%>
<%@page import="Model.Detalleventa"%>
<%@page import="java.util.List"%>
<%@page import="DAO.DetalleventaDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte de ventas</title>
    </head>
    <body>
    <center><h1>Reporte de ventas</h1></center>
    <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th class="text-center">ID COMPRA</th>
                <th class="text-center">FECHA</th>
                <th class="text-center">PRECIO UNITARIO</th>
                <th class="text-center">CANTIDAD</th>
                <th class="text-center">TOTAL</th>
                <th class="text-center">PRODUCTO</th>
                <th class="text-center">USUARIO</th>

                <th class="text-center">ESTADO</th>
                <th class="text-center">Total</th>
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
                    <td>${p.getPrecioventa()}</td>
                    <td>${p.getCantidad()}</td>
                    <td>$.${p.getVenta().getTotalventa()}</td>
                    <td>${p.getProducto().getNombreproducto()}</td>
                    <td>${p.getVenta().getUsuario().getNombre()} ${p.getVenta().getUsuario().getApellidos()}</td>

                    <td>${p.getVenta().getEstadoventa()}</td>
                    <td>$.${p.getVenta().getTotalventa()}</td>


                </tr>
            </c:forEach>  

        </tbody>
    </table>
</body>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.1.0/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/2.1.0/js/buttons.html5.min.js"></script>

<link href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/buttons/2.1.0/css/buttons.dataTables.min.css" rel="stylesheet">
<script>


    $.extend(true, $.fn.dataTable.defaults, {
        "language": {
            "decimal": ",",
            "thousands": ".",
            "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "infoPostFix": "",
            "infoFiltered": "(filtrado de un total de _MAX_ registros)",
            "loadingRecords": "Cargando...",
            "lengthMenu": "Mostrar _MENU_ registros",
            "paginate": {
                "first": "Primero",
                "last": "Último",
                "next": "Siguiente",
                "previous": "Anterior"
            },
            "processing": "Procesando...",
            "search": "Buscar:",
            "searchPlaceholder": "Término de búsqueda",
            "zeroRecords": "No se encontraron resultados",
            "emptyTable": "Ningún dato disponible en esta tabla",
            "aria": {
                "sortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sortDescending": ": Activar para ordenar la columna de manera descendente"
            },
            //only works for built-in buttons, not for custom buttons
            "buttons": {
                "create": "Nuevo",
                "edit": "Cambiar",
                "remove": "Borrar",
                "copy": "Copiar",
                "csv": "fichero CSV",
                "excel": "tabla Excel",
                "pdf": "PDF",
                "print": "Imprimir",
                "colvis": "Visibilidad columnas",
                "collection": "Colección",
                "upload": "Seleccione fichero...."
            },
            "select": {
                "rows": {
                    _: '%d filas seleccionadas',
                    0: 'clic fila para seleccionar',
                    1: 'una fila seleccionada'
                }
            }
        }
    });
    $(document).ready(function () {
        $('#example').DataTable({
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'pdfHtml5',
                    download: 'open'
                }
            ],
            "order": [
                [0, "desc"]
            ]
        });
    });
</script>

<script>
   
</script>

</html>
