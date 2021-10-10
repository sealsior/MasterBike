/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Hibernate.HibernateUtil;
import Model.Mantencion;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author baggr
 */
public class MantencionDAO {
    
    public boolean crear(Mantencion mant) {
        boolean creado = false;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction tx = sesion.beginTransaction();
            sesion.save(mant);
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
    
      public List<Mantencion> listarMantenciones() {
        List<Mantencion> lista = null;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction t = sesion.beginTransaction();
        String hql = "FROM Mantencion";
        try {
            lista = sesion.createQuery(hql).list();
            t.commit();
            sesion.close();
        } catch (Exception e) {
            t.rollback();
        }
        return lista;
    }
    
    public void agregar(Mantencion mant) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.save(mant);
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
    
    public void modificar(Mantencion mant) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.update(mant);
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
    
    public void eliminar(Mantencion mant) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.delete(mant);
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
    public void ingresarSP(Mantencion mant) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin MANTENCION_TAPI.ins(:Estado,:Idservicio,:Idusuario,:Fecingreso,:Garantia, :Observacion, SEQ_MANTENCION.NEXTVAL, :Fecsalida); end;");
        query.setParameter("Estado", mant.getEstado());
        query.setParameter("Idservicio", mant.getServicio());
        query.setParameter("Idusuario", mant.getUsuario());
        query.setParameter("Fecingreso", mant.getFecingreso());
        query.setParameter("Garantia", mant.getGarantia());
        query.setParameter("Observacion", mant.getObservacion());
        query.setParameter("Fecsalida", mant.getFecsalida());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void actualizarSP(Mantencion mant) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin MANTENCION_TAPI.upd(:Estado,:Idservicio,:Idusuario,:Fecingreso,:Garantia, :Observacion, SEQ_MANTENCION.NEXTVAL, :Fecsalida); end;");
        query.setParameter("Estado", mant.getEstado());
        query.setParameter("Idservicio", mant.getServicio());
        query.setParameter("Idusuario", mant.getUsuario());
        query.setParameter("Fecingreso", mant.getFecingreso());
        query.setParameter("Garantia", mant.getGarantia());
        query.setParameter("Observacion", mant.getObservacion());
        query.setParameter("Fecsalida", mant.getFecsalida());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void eliminarSP(Mantencion mant) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin MANTENCION_TAPI.del(:id); end;");
        query.setParameter("id", mant.getIdMantencion());
        query.executeUpdate();
        tx.commit();
        session.close();

    }
    
}
