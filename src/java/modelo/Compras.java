/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import Model.Usuario;
import java.util.List;

/**
 *
 * @author Marco
 */
public class Compras {//recordar q cambien el tipo de dato de monto de int a long 
    
    private int id;
    private Usuario usuario;
    //private int id_pago;
    private String fecha;
    private long monto;
    private String estado;
    
    private List<Carrito>detallecompras;

    public Compras() {
    }

    public Compras( Usuario usuario, String fecha, long monto, String estado, List<Carrito> detallecompras) {
        
        this.usuario = usuario;
        //this.id_pago = id_pago;
        this.fecha = fecha;
        this.monto = monto;
        this.estado = estado;
        this.detallecompras = detallecompras;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

   

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public long getMonto() {
        return monto;
    }

    public void setMonto(long monto) {
        this.monto = monto;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public List<Carrito> getDetallecompras() {
        return detallecompras;
    }

    public void setDetallecompras(List<Carrito> detallecompras) {
        this.detallecompras = detallecompras;
    }
    
    
    
    
}
