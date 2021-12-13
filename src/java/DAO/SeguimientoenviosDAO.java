/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Config.Conexion;
import Hibernate.HibernateUtil;
import Model.Seguimiento;
import Model.Seguimientoenvios;
import Model.Venta;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
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
public class SeguimientoenviosDAO {
    Connection con;
    Conexion cn=new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r=0;
    
    public boolean crear(Seguimientoenvios seguimiento) {
        boolean creado = false;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction tx = sesion.beginTransaction();
            sesion.save(seguimiento);
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
    
 
    
    public void modificar(Seguimientoenvios seguimiento) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.update(seguimiento);
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
    
    public void eliminar(Seguimientoenvios seguimiento) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.delete(seguimiento);
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
    public void ingresarSP(Seguimientoenvios seguimiento) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin SEGUIMIENTOENVIOS_TAPI.ins(:Estadoentrega,:Fecentrega,:Fecdespacho,:Idventa, SEQ_SEGUIMIENTOS.NEXTVAL); end;");
        query.setParameter("Estadoentrega", seguimiento.getEstadoentrega());
        query.setParameter("Fecentrega", seguimiento.getFecentrega());
        query.setParameter("Fecdespacho", seguimiento.getFecdespacho());
        query.setParameter("Idventa", seguimiento.getVenta());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void actualizarSP(Seguimientoenvios seguimiento) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin SEGUIMIENTOENVIOS_TAPI.upd(:Estadoentrega,:Fecentrega,:Fecdespacho,:Idventa, :Idseguimiento); end;");
        query.setParameter("Estadoentrega", seguimiento.getEstadoentrega());
        query.setParameter("Fecentrega", seguimiento.getFecentrega());
        query.setParameter("Fecdespacho", seguimiento.getFecdespacho());
        query.setParameter("Idventa", seguimiento.getVenta());
        query.setParameter("Idseguimiento", seguimiento.getIdSeguiEnvios());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void eliminarSP(Seguimientoenvios seguimiento) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin SEGUIMIENTOENVIOS_TAPI.del(:id); end;");
        query.setParameter("id", seguimiento.getIdSeguiEnvios());
        query.executeUpdate();
        tx.commit();
        session.close();

    }
    
    
    public List<Seguimientoenvios> findIDSeguimiento(long id) {//lista por id con hibernate de seguimientos 
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
                applySettings(configuration.getProperties());
        SessionFactory sf = configuration.buildSessionFactory(builder.build());
        ///  SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Query query = session.createQuery(" from Seguimientoenvios where ID_VENTA= " + id);
        List<Seguimientoenvios> seguimiento = query.list();
        session.close();
        return seguimiento;

    }
    
    public List<Seguimientoenvios> listarSeguimientosPorEstado() {
        List<Seguimientoenvios> lista = null;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction t = sesion.beginTransaction();
        String hql = "FROM Seguimientoenvios where ESTADOENTREGA='En Camino' ";
        try {
            lista = sesion.createQuery(hql).list();
            t.commit();
            sesion.close();
        } catch (Exception e) {
            t.rollback();
        }
        return lista;
    }
    
    public int agregarSeguimiento(Seguimiento s){
        String sql="insert into seguimientoenvios(ID_SEGUI_ENVIOS, ESTADOENTREGA, FECDESPACHO, FECENTREGA, ID_VENTA)values(?,?,?,?,?) ";
        //String sql="begin SEGUIMIENTOENVIOS_TAPI.ins(:Estadoentrega,:Fecentrega,:Fecdespacho,:Idventa, SEQ_SEGUIMIENTOS.NEXTVAL); end;";
        try {
            con=cn.conectar();
            ps=con.prepareStatement(sql);
            //rs=ps.executeQuery();
            ps.setLong(1, s.getIdSeguiEnvios());
            ps.setString(2, s.getEstadoentrega());
            ps.setString(3,  s.getFecdespacho());
            ps.setString(4,  s.getFecentrega());
            ps.setLong(5, s.getVenta().getIdVenta());
            r=ps.executeUpdate();
            if (r==1) {
                r=1;
            } else {
                r=0;
            }
            ps.close();
            //rs.close();
            cn.desconectar();
        } catch (Exception e) {
        }
        return r;
    }
    
    public Seguimientoenvios listaridd(String id){//Listar 
           String sql = "select * from seguimientoenvios where ID_SEGUI_ENVIOS= " + id;
           Seguimientoenvios p = new Seguimientoenvios();
           try {
            con = cn.conectar();//
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setIdSeguiEnvios(rs.getLong(1));
                p.setEstadoentrega(rs.getString(2));
                p.setFecdespacho(rs.getDate(3));
                p.setFecentrega(rs.getDate(4));
                p.setVenta(new Venta());
                p.getVenta().setIdVenta(rs.getLong(5));
                
            }
            ps.close();
            rs.close();
            cn.desconectar();
        } catch (Exception e) {
        }
            
           return p;
    }
    
    public int ModificarSeguimiento(Seguimiento s){//modificar
        String sql="update seguimientoenvios set ESTADOENTREGA=?, FECENTREGA=?, ID_VENTA=? where ID_SEGUI_ENVIOS=?";
        try {
            con=cn.conectar();
            ps=con.prepareStatement(sql);
            //rs=ps.executeQuery();
            
            ps.setString(1, s.getEstadoentrega());
            //ps.setString(2,  s.getFecdespacho());
            ps.setString(2,  s.getFecentrega());
            ps.setLong(3, s.getVenta().getIdVenta());
            ps.setLong(4, s.getIdSeguiEnvios());
            r=ps.executeUpdate();
            if (r==1) {
                r=1;
            } else {
                r=0;
            }
            ps.close();
            //rs.close();
            cn.desconectar();
        } catch (Exception e) {
        }
        return r;
    }
    
    public int ModificarEstadoVenta(Venta s){//modificar
        String sql="update venta set ESTADOVENTA=? where ID_VENTA=?";
        try {
            con=cn.conectar();
            ps=con.prepareStatement(sql);
            //rs=ps.executeQuery();
            
            ps.setString(1, s.getEstadoventa());
           
            ps.setLong(2, s.getIdVenta());
            r=ps.executeUpdate();
            if (r==1) {
                r=1;
            } else {
                r=0;
            }
            ps.close();
            //rs.close();
            cn.desconectar();
        } catch (Exception e) {
        }
        return r;
    }
    
}
