package Model;
// Generated 29-10-2021 20:24:25 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Seguimientoenvios generated by hbm2java
 */
public class Seguimientoenvios  implements java.io.Serializable {


     private long idSeguiEnvios;
     private Venta venta;
     private String estadoentrega;
     private Date fecdespacho;
     private Date fecentrega;

    public Seguimientoenvios() {
    }

    public Seguimientoenvios(long idSeguiEnvios, Venta venta, String estadoentrega, Date fecdespacho, Date fecentrega) {
       this.idSeguiEnvios = idSeguiEnvios;
       this.venta = venta;
       this.estadoentrega = estadoentrega;
       this.fecdespacho = fecdespacho;
       this.fecentrega = fecentrega;
    }
   
    public long getIdSeguiEnvios() {
        return this.idSeguiEnvios;
    }
    
    public void setIdSeguiEnvios(long idSeguiEnvios) {
        this.idSeguiEnvios = idSeguiEnvios;
    }
    public Venta getVenta() {
        return this.venta;
    }
    
    public void setVenta(Venta venta) {
        this.venta = venta;
    }
<<<<<<< HEAD
   
=======
    public String getTipoentrega() {
        return this.tipoentrega;
    }
    
    public void setTipoentrega(String tipoentrega) {
        this.tipoentrega = tipoentrega;
    }
    public String getTipopago() {
        return this.tipopago;
    }
    
    public void setTipopago(String tipopago) {
        this.tipopago = tipopago;
    }
    public String getDireccentrega() {
        return this.direccentrega;
    }
    
    public void setDireccentrega(String direccentrega) {
        this.direccentrega = direccentrega;
    }
>>>>>>> master
    public String getEstadoentrega() {
        return this.estadoentrega;
    }
    
    public void setEstadoentrega(String estadoentrega) {
        this.estadoentrega = estadoentrega;
    }
<<<<<<< HEAD
   
=======
    public String getEmptransporte() {
        return this.emptransporte;
    }
    
    public void setEmptransporte(String emptransporte) {
        this.emptransporte = emptransporte;
    }
>>>>>>> master
    public Date getFecdespacho() {
        return this.fecdespacho;
    }
    
    public void setFecdespacho(Date fecdespacho) {
        this.fecdespacho = fecdespacho;
    }
    public Date getFecentrega() {
        return this.fecentrega;
    }
    
    public void setFecentrega(Date fecentrega) {
        this.fecentrega = fecentrega;
    }




}