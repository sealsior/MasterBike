/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Hibernate.HibernateUtil;
import Model.Venta;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author baggr
 */
public class VentaDAO {
    
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
    
}
