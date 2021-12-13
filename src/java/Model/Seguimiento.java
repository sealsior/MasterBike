/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Marco
 */
public class Seguimiento {
    
     private long idSeguiEnvios;
     private Venta venta;
     private String estadoentrega;
     private String fecdespacho;
     private String fecentrega;

    public Seguimiento() {
    }

    public Seguimiento(long idSeguiEnvios, Venta venta, String estadoentrega, String fecdespacho, String fecentrega) {
        this.idSeguiEnvios = idSeguiEnvios;
        this.venta = venta;
        this.estadoentrega = estadoentrega;
        this.fecdespacho = fecdespacho;
        this.fecentrega = fecentrega;
    }

    public long getIdSeguiEnvios() {
        return idSeguiEnvios;
    }

    public void setIdSeguiEnvios(long idSeguiEnvios) {
        this.idSeguiEnvios = idSeguiEnvios;
    }

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
    }

    public String getEstadoentrega() {
        return estadoentrega;
    }

    public void setEstadoentrega(String estadoentrega) {
        this.estadoentrega = estadoentrega;
    }

    public String getFecdespacho() {
        return fecdespacho;
    }

    public void setFecdespacho(String fecdespacho) {
        this.fecdespacho = fecdespacho;
    }

    public String getFecentrega() {
        return fecentrega;
    }

    public void setFecentrega(String fecentrega) {
        this.fecentrega = fecentrega;
    }
     
    
     
    
}
