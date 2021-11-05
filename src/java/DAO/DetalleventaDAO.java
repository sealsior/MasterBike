/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Hibernate.HibernateUtil;
import Model.Detalleventa;
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
public class DetalleventaDAO {
    
    public boolean crear(Detalleventa detaventa) {
        boolean creado = false;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction tx = sesion.beginTransaction();
            sesion.save(detaventa);
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
    
      public List<Detalleventa> listarDetalleventa() {
        List<Detalleventa> lista = null;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction t = sesion.beginTransaction();
        String hql = "FROM Detalleventa";
        try {
            lista = sesion.createQuery(hql).list();
            t.commit();
            sesion.close();
        } catch (Exception e) {
            t.rollback();
        }
        return lista;
    }
    
    public void agregar(Detalleventa detaventa) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.save(detaventa);
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
    
    public void modificar(Detalleventa detaventa) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.update(detaventa);
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
    
    public void eliminar(Detalleventa detaventa) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.delete(detaventa);
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
    public void ingresarSP(Detalleventa detaventa) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin Detalleventa_TAPI.ins(:Precioventa,:IdProducto,SEQ_DETALLE_VENTA.NEXTVAL,:Cantidad,SEQ_VENTA.CURRVAL); end;");
        query.setParameter("Precioventa", detaventa.getPrecioventa());
        query.setParameter("IdProducto", detaventa.getProducto());
        query.setParameter("Cantidad", detaventa.getCantidad());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void actualizarSP(Detalleventa detaventa) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin Detalleventa_TAPI.upd(:Precioventa,:IdProducto,SEQ_DETALLE_VENTA.NEXTVAL,:Cantidad,SEQ_VENTA.CURRVAL); end;");
        query.setParameter("Precioventa", detaventa.getPrecioventa());
        query.setParameter("IdProducto", detaventa.getProducto());
        query.setParameter("Cantidad", detaventa.getCantidad());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void eliminarSP(Detalleventa detaventa) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin Detalleventa_TAPI.del(:id); end;");
        query.setParameter("id", detaventa.getIdDetalleventa());
        query.executeUpdate();
        tx.commit();
        session.close();

    }
    
    public List<Detalleventa> findID(long id) {//lista por id con hibernate
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
                applySettings(configuration.getProperties());
        SessionFactory sf = configuration.buildSessionFactory(builder.build());
        ///  SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Query query = session.createQuery("from Detalleventa where ID_VENTA=" + id);
        List<Detalleventa> detalle = query.list();
        session.close();
        return detalle;

    }
    
    
}
