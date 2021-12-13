/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.InputStream;

/**
 *
 * @author Marco
 */
public class Producto1 {
    
    int id;
    String nombre;
    String tipo;
    String descripcion;
    String propio;
    int valor;
    String marca;
    String modelo;
    int stock;
    InputStream foto;

    public Producto1() {
    }

    public Producto1(int id, String nombre, String tipo, String descripcion, String propio, int valor, String marca, String modelo, int stock, InputStream foto) {
        this.id = id;
        this.nombre = nombre;
        this.tipo = tipo;
        this.descripcion = descripcion;
        this.propio = propio;
        this.valor = valor;
        this.marca = marca;
        this.modelo = modelo;
        this.stock = stock;
        this.foto = foto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getPropio() {
        return propio;
    }

    public void setPropio(String propio) {
        this.propio = propio;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public InputStream getFoto() {
        return foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }
    
    
    
}
