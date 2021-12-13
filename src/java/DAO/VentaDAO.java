/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Config.Conexion;
import Hibernate.HibernateUtil;
import Model.Detalleventa;
import Model.Usuario;
import Model.Venta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Carrito;
import modelo.Compras;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author baggr
 */
public class VentaDAO {
         Connection con;
         Conexion cn=new Conexion();
         PreparedStatement ps;
         ResultSet rs;
         int r=0;
    
    public boolean crear(Venta venta) {
        boolean creado = false;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction tx = sesion.beginTransaction();
            sesion.save(venta);
            tx.commit();
            creado = true;
        } catch (Exception e) {
            System.out.println("Error Creacion DAO:" + e.getMessage());
            creado = false;
        } finally {
            sesion.close();
        }
        return creado;
    }
    
      public List<Venta> listarVentas() {
        List<Venta> lista = null;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction t = sesion.beginTransaction();
        String hql = "FROM Venta";
        try {
            lista = sesion.createQuery(hql).list();
            t.commit();
            sesion.close();
        } catch (Exception e) {
            t.rollback();
        }
        return lista;
    }
    public List<Venta> listarVentasPorEnviar() {
        List<Venta> lista = null;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction t = sesion.beginTransaction();
        String hql = "FROM Venta where TOTALVENTA>0 AND ESTADOVENTA='EN PROCESO'";
        try {
            lista = sesion.createQuery(hql).list();
            t.commit();
            sesion.close();
        } catch (Exception e) {
            t.rollback();
        }
        return lista;
    }
    
    public void agregar(Venta venta) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.save(venta);
            sesion.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            sesion.getTransaction().rollback();
        } finally {
            if (sesion != null) {
                sesion.close();
            }
        }
    }
    
    public void modificar(Venta venta) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.update(venta);
            sesion.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            sesion.getTransaction().rollback();
        } finally {
            if (sesion != null) {
                sesion.close();
            }
        }
    }
    
    public void eliminar(Venta venta) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.delete(venta);
            sesion.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            sesion.getTransaction().rollback();
        } finally {
            if (sesion != null) {
                sesion.close();
            }
        }
    }
    
    //Stored Procedures CRUD  
    public void ingresarSP(Venta venta) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin VENTA_TAPI.ins(:Estado,:Totalventa,:Idusuario,SEQ_VENTA.NEXTVAL,:Fechora); end;");
        query.setParameter("Estado", venta.getEstadoventa());
        query.setParameter("Totalventa", venta.getTotalventa());
        query.setParameter("Idusuario", venta.getUsuario());
        query.setParameter("Fechora", venta.getFechora());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void actualizarSP(Venta venta) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin VENTA_TAPI.upd(:Estado,:Totalventa,:Idusuario,SEQ_VENTA.NEXTVAL,:Fechora); end;");
        query.setParameter("Estado", venta.getEstadoventa());
        query.setParameter("Totalventa", venta.getTotalventa());
        query.setParameter("Idusuario", venta.getUsuario());
        query.setParameter("Fechora", venta.getFechora());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void eliminarSP(Venta venta) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin VENTA_TAPI.del(:id); end;");
        query.setParameter("id", venta.getIdVenta());
        query.executeUpdate();
        tx.commit();
        session.close();

    }
    
    //DE AQUI PARA ABAJO
    public int GenerarCompra(Compras compra){
        int idventa;
        
        String sql="begin VENTA_TAPI.ins(:Estado,:Totalventa,:Idusuario,SEQ_VENTA.NEXTVAL,:Fechora); end;";
        try {
            con=cn.conectar();
            ps=con.prepareStatement(sql);
            ps.setString(1, compra.getEstado());
            ps.setLong(2, compra.getMonto());
            ps.setLong(3, compra.getUsuario().getIdUsuario());
            ps.setString(4, compra.getFecha());
            
            r=ps.executeUpdate();
            
            /*sql="SELECT @@IDENTITY AS ID_VENTA";
            rs=ps.executeQuery(sql);
            rs.next();
            idventa=rs.getInt("ID_VENTA");
            rs.close();*/
            
            for (Carrito detalle : compra.getDetallecompras()) {
                sql="begin DETALLEVENTA_TAPI.ins(:Precioventa,:IdProducto,SEQ_DETALLE_VENTA.NEXTVAL,:Cantidad,SEQ_VENTA.CURRVAL); end;";
                ps=con.prepareStatement(sql);
                ps.setLong(1, detalle.getPrecio());
                ps.setLong(2, detalle.getIdProducto());
                ps.setLong(3, detalle.getCantidad());             
                //ps.setInt(4, idventa);
     
                r=ps.executeUpdate();
            }
            ps.close();
            rs.close();
            cn.desconectar();
            
            
        } catch (Exception e) {
        }
        return r;
         
         
         
    }
    public List<Venta> findID(long id) {//lista por id con hibernate de ventas
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
                applySettings(configuration.getProperties());
        SessionFactory sf = configuration.buildSessionFactory(builder.build());
        ///  SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Query query = session.createQuery(" from Venta where TOTALVENTA>0 AND ID_USUARIO= " + id);
        List<Venta> detalle = query.list();
        session.close();
        return detalle;

    }
    
    public List<Detalleventa> findIDDetalle(long id) {//lista por id con hibernate de detalles venta
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
                applySettings(configuration.getProperties());
        SessionFactory sf = configuration.buildSessionFactory(builder.build());
        ///  SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Query query = session.createQuery(" from Detalleventa where ID_VENTA= " + id);
        List<Detalleventa> detalle = query.list();
        session.close();
        return detalle;

    }
    
    public Venta listaridd(String id){//Listar 
           String sql = "select * from venta where ID_VENTA= " + id;
           Venta p = new Venta();
           try {
            con = cn.conectar();//
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setIdVenta(rs.getLong(1));
                p.setFechora(rs.getDate(3));
                p.setTotalventa(rs.getLong(4));
                p.setUsuario(new Usuario());
                p.getUsuario().setIdUsuario(rs.getLong(5));
                p.setEstadoventa(rs.getString(6));
                
            }
            ps.close();
            rs.close();
            cn.desconectar();
        } catch (Exception e) {
        }
            
           return p;
    }
    
}
