package Model;
// Generated 10-10-2021 15:45:08 by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Detalleventa generated by hbm2java
 */
@Entity
@Table(name="DETALLEVENTA"
    ,schema="BDCLETA"
)
public class Detalleventa  implements java.io.Serializable {


     private long idDetalleventa;
     private Producto producto;
     private Venta venta;
     private long cantidad;
     private Long precioventa;

    public Detalleventa() {
    }

	
    public Detalleventa(long idDetalleventa, Producto producto, Venta venta, long cantidad) {
        this.idDetalleventa = idDetalleventa;
        this.producto = producto;
        this.venta = venta;
        this.cantidad = cantidad;
    }
    public Detalleventa(long idDetalleventa, Producto producto, Venta venta, long cantidad, Long precioventa) {
       this.idDetalleventa = idDetalleventa;
       this.producto = producto;
       this.venta = venta;
       this.cantidad = cantidad;
       this.precioventa = precioventa;
    }
   
     @Id 

    
    @Column(name="ID_DETALLEVENTA", unique=true, nullable=false, precision=10, scale=0)
    public long getIdDetalleventa() {
        return this.idDetalleventa;
    }
    
    public void setIdDetalleventa(long idDetalleventa) {
        this.idDetalleventa = idDetalleventa;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ID_PRODUCTO", nullable=false)
    public Producto getProducto() {
        return this.producto;
    }
    
    public void setProducto(Producto producto) {
        this.producto = producto;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ID_VENTA", nullable=false)
    public Venta getVenta() {
        return this.venta;
    }
    
    public void setVenta(Venta venta) {
        this.venta = venta;
    }

    
    @Column(name="CANTIDAD", nullable=false, precision=10, scale=0)
    public long getCantidad() {
        return this.cantidad;
    }
    
    public void setCantidad(long cantidad) {
        this.cantidad = cantidad;
    }

    
    @Column(name="PRECIOVENTA", precision=10, scale=0)
    public Long getPrecioventa() {
        return this.precioventa;
    }
    
    public void setPrecioventa(Long precioventa) {
        this.precioventa = precioventa;
    }




}


