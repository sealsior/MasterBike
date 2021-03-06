package Model;
// Generated 29-10-2021 20:24:25 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Reporte generated by hbm2java
 */
public class Reporte  implements java.io.Serializable {


     private long idReporte;
     private Sucursal sucursal;
     private Usuario usuario;
     private String tiporeporte;
     private Date fecinicio;
     private Date fecfin;
     private Date fecemision;
     private String sucursalreporte;
     private Long bicicletain;
     private Long bicicletaout;
     private Long accesorioin;
     private Long accesorioout;
     private Long totalventa;

    public Reporte() {
    }

	
    public Reporte(long idReporte, Sucursal sucursal, Usuario usuario, String tiporeporte, Date fecemision) {
        this.idReporte = idReporte;
        this.sucursal = sucursal;
        this.usuario = usuario;
        this.tiporeporte = tiporeporte;
        this.fecemision = fecemision;
    }
    public Reporte(long idReporte, Sucursal sucursal, Usuario usuario, String tiporeporte, Date fecinicio, Date fecfin, Date fecemision, String sucursalreporte, Long bicicletain, Long bicicletaout, Long accesorioin, Long accesorioout, Long totalventa) {
       this.idReporte = idReporte;
       this.sucursal = sucursal;
       this.usuario = usuario;
       this.tiporeporte = tiporeporte;
       this.fecinicio = fecinicio;
       this.fecfin = fecfin;
       this.fecemision = fecemision;
       this.sucursalreporte = sucursalreporte;
       this.bicicletain = bicicletain;
       this.bicicletaout = bicicletaout;
       this.accesorioin = accesorioin;
       this.accesorioout = accesorioout;
       this.totalventa = totalventa;
    }
   
    public long getIdReporte() {
        return this.idReporte;
    }
    
    public void setIdReporte(long idReporte) {
        this.idReporte = idReporte;
    }
    public Sucursal getSucursal() {
        return this.sucursal;
    }
    
    public void setSucursal(Sucursal sucursal) {
        this.sucursal = sucursal;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public String getTiporeporte() {
        return this.tiporeporte;
    }
    
    public void setTiporeporte(String tiporeporte) {
        this.tiporeporte = tiporeporte;
    }
    public Date getFecinicio() {
        return this.fecinicio;
    }
    
    public void setFecinicio(Date fecinicio) {
        this.fecinicio = fecinicio;
    }
    public Date getFecfin() {
        return this.fecfin;
    }
    
    public void setFecfin(Date fecfin) {
        this.fecfin = fecfin;
    }
    public Date getFecemision() {
        return this.fecemision;
    }
    
    public void setFecemision(Date fecemision) {
        this.fecemision = fecemision;
    }
    public String getSucursalreporte() {
        return this.sucursalreporte;
    }
    
    public void setSucursalreporte(String sucursalreporte) {
        this.sucursalreporte = sucursalreporte;
    }
    public Long getBicicletain() {
        return this.bicicletain;
    }
    
    public void setBicicletain(Long bicicletain) {
        this.bicicletain = bicicletain;
    }
    public Long getBicicletaout() {
        return this.bicicletaout;
    }
    
    public void setBicicletaout(Long bicicletaout) {
        this.bicicletaout = bicicletaout;
    }
    public Long getAccesorioin() {
        return this.accesorioin;
    }
    
    public void setAccesorioin(Long accesorioin) {
        this.accesorioin = accesorioin;
    }
    public Long getAccesorioout() {
        return this.accesorioout;
    }
    
    public void setAccesorioout(Long accesorioout) {
        this.accesorioout = accesorioout;
    }
    public Long getTotalventa() {
        return this.totalventa;
    }
    
    public void setTotalventa(Long totalventa) {
        this.totalventa = totalventa;
    }




}


