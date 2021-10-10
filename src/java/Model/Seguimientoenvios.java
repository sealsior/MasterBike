package Model;
// Generated 10-10-2021 15:45:08 by Hibernate Tools 4.3.1


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * Seguimientoenvios generated by hbm2java
 */
@Entity
@Table(name="SEGUIMIENTOENVIOS"
    ,schema="BDCLETA"
    , uniqueConstraints = @UniqueConstraint(columnNames="ID_VENTA") 
)
public class Seguimientoenvios  implements java.io.Serializable {


     private long idSeguiEnvios;
     private Venta venta;
     private String tipoentrega;
     private String tipopago;
     private String direccentrega;
     private String estadoentrega;
     private String emptransporte;
     private Date fecdespacho;
     private Date fecentrega;

    public Seguimientoenvios() {
    }

    public Seguimientoenvios(long idSeguiEnvios, Venta venta, String tipoentrega, String tipopago, String direccentrega, String estadoentrega, String emptransporte, Date fecdespacho, Date fecentrega) {
       this.idSeguiEnvios = idSeguiEnvios;
       this.venta = venta;
       this.tipoentrega = tipoentrega;
       this.tipopago = tipopago;
       this.direccentrega = direccentrega;
       this.estadoentrega = estadoentrega;
       this.emptransporte = emptransporte;
       this.fecdespacho = fecdespacho;
       this.fecentrega = fecentrega;
    }
   
     @Id 

    
    @Column(name="ID_SEGUI_ENVIOS", unique=true, nullable=false, precision=10, scale=0)
    public long getIdSeguiEnvios() {
        return this.idSeguiEnvios;
    }
    
    public void setIdSeguiEnvios(long idSeguiEnvios) {
        this.idSeguiEnvios = idSeguiEnvios;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ID_VENTA", unique=true, nullable=false)
    public Venta getVenta() {
        return this.venta;
    }
    
    public void setVenta(Venta venta) {
        this.venta = venta;
    }

    
    @Column(name="TIPOENTREGA", nullable=false, length=15)
    public String getTipoentrega() {
        return this.tipoentrega;
    }
    
    public void setTipoentrega(String tipoentrega) {
        this.tipoentrega = tipoentrega;
    }

    
    @Column(name="TIPOPAGO", nullable=false, length=15)
    public String getTipopago() {
        return this.tipopago;
    }
    
    public void setTipopago(String tipopago) {
        this.tipopago = tipopago;
    }

    
    @Column(name="DIRECCENTREGA", nullable=false, length=25)
    public String getDireccentrega() {
        return this.direccentrega;
    }
    
    public void setDireccentrega(String direccentrega) {
        this.direccentrega = direccentrega;
    }

    
    @Column(name="ESTADOENTREGA", nullable=false, length=10)
    public String getEstadoentrega() {
        return this.estadoentrega;
    }
    
    public void setEstadoentrega(String estadoentrega) {
        this.estadoentrega = estadoentrega;
    }

    
    @Column(name="EMPTRANSPORTE", nullable=false, length=20)
    public String getEmptransporte() {
        return this.emptransporte;
    }
    
    public void setEmptransporte(String emptransporte) {
        this.emptransporte = emptransporte;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="FECDESPACHO", nullable=false, length=7)
    public Date getFecdespacho() {
        return this.fecdespacho;
    }
    
    public void setFecdespacho(Date fecdespacho) {
        this.fecdespacho = fecdespacho;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="FECENTREGA", nullable=false, length=7)
    public Date getFecentrega() {
        return this.fecentrega;
    }
    
    public void setFecentrega(Date fecentrega) {
        this.fecentrega = fecentrega;
    }




}


