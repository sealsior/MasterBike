<<<<<<< HEAD
$(function() {
  var oTable = $('#datatable').DataTable({
    "oLanguage": {
      "sSearch": "Filter Data"
    },
    "iDisplayLength": -1,
    "sPaginationType": "full_numbers",

  });




  $("#datepicker_from").datepicker({
    showOn: "button",
    buttonImage: "images/calendar.gif",
    buttonImageOnly: false,
    "onSelect": function(date) {
      minDateFilter = new Date(date).getTime();
      oTable.fnDraw();
    }
  }).keyup(function() {
    minDateFilter = new Date(this.value).getTime();
    oTable.fnDraw();
  });

  $("#datepicker_to").datepicker({
    showOn: "button",
    buttonImage: "images/calendar.gif",
    buttonImageOnly: false,
    "onSelect": function(date) {
      maxDateFilter = new Date(date).getTime();
      oTable.fnDraw();
    }
  }).keyup(function() {
    maxDateFilter = new Date(this.value).getTime();
    oTable.fnDraw();
  });

});

// Date range filter
minDateFilter = "";
maxDateFilter = "";

$.fn.dataTableExt.afnFiltering.push(
  function(oSettings, aData, iDataIndex) {
    if (typeof aData._date == 'undefined') {
      aData._date = new Date(aData[0]).getTime();
    }

    if (minDateFilter && !isNaN(minDateFilter)) {
      if (aData._date < minDateFilter) {
        return false;
      }
    }

    if (maxDateFilter && !isNaN(maxDateFilter)) {
      if (aData._date > maxDateFilter) {
        return false;
      }
    }

    return true;
  }
);
=======
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
>>>>>>> master
