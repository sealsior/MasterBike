/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Marco
 */
public class Carrito {
    
<<<<<<< HEAD
    long item;
    long idProducto;
    String nombres;
    String descripcion;
    long precio;
    long cantidad;
    long subtotal;
=======
    int item;
    int idProducto;
    String nombres;
    String descripcion;
    int precio;
    int cantidad;
    int subtotal;
>>>>>>> master

    public Carrito() {
    }

<<<<<<< HEAD
    public Carrito(long item, long idProducto, String nombres, String descripcion, long precio, long cantidad, long subtotal) {
=======
    public Carrito(int item, int idProducto, String nombres, String descripcion, int precio, int cantidad, int subtotal) {
>>>>>>> master
        this.item = item;
        this.idProducto = idProducto;
        this.nombres = nombres;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }

<<<<<<< HEAD
    public long getItem() {
        return item;
    }

    public void setItem(long item) {
        this.item = item;
    }

    public long getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(long idProducto) {
=======
    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
>>>>>>> master
        this.idProducto = idProducto;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

<<<<<<< HEAD
    public long getPrecio() {
        return precio;
    }

    public void setPrecio(long precio) {
        this.precio = precio;
    }

    public long getCantidad() {
        return cantidad;
    }

    public void setCantidad(long cantidad) {
        this.cantidad = cantidad;
    }

    public long getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(long subtotal) {
=======
    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(int subtotal) {
>>>>>>> master
        this.subtotal = subtotal;
    }
    
    
  
    
}
