/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Hibernate.HibernateUtil;
import Model.Solicitudmantencion;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author baggr
 */
public class SolicitudmantencionDAO {
    
    public boolean crear(Solicitudmantencion solman) {
        boolean creado = false;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction tx = sesion.beginTransaction();
            sesion.save(solman);
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
    
      public List<Solicitudmantencion> listarSolicitudesmantencion() {
        List<Solicitudmantencion> lista = null;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction t = sesion.beginTransaction();
        String hql = "FROM Solicitudmantencion";
        try {
            lista = sesion.createQuery(hql).list();
            t.commit();
            sesion.close();
        } catch (Exception e) {
            t.rollback();
        }
        return lista;
    }
    
    public void agregar(Solicitudmantencion solman) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.save(solman);
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
    
    public void modificar(Solicitudmantencion solman) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.update(solman);
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
    
    public void eliminar(Solicitudmantencion solman) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.delete(solman);
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
    public void ingresarSP(Solicitudmantencion solman) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin SOLICITUDMANTENCION_TAPI.ins(:Idservicio,:Idusuario,:Fecsolicitada,:Estado,:Descripcion, SEQ_SOL_MANTENCION.NEXTVAL, :Retirodomi); end;");
        query.setParameter("Idservicio", solman.getServicio());
        query.setParameter("Idusuario", solman.getUsuario());
        query.setParameter("Fecsolicitada", solman.getFecSolicitada());
        query.setParameter("Estado", solman.getEstadosolicitud());
        query.setParameter("Descripcion", solman.getDescripcion());
        query.setParameter("Retirodomi", solman.getRetirodomicilio());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void actualizarSP(Solicitudmantencion solman) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
         Query query = session.createSQLQuery("begin SOLICITUDMANTENCION_TAPI.upd(:Idservicio,:Idusuario,:Fecsolicitada,:Estado,:Descripcion, SEQ_SOL_MANTENCION.NEXTVAL, :Retirodomi); end;");
        query.setParameter("Idservicio", solman.getServicio());
        query.setParameter("Idusuario", solman.getUsuario());
        query.setParameter("Fecsolicitada", solman.getFecSolicitada());
        query.setParameter("Estado", solman.getEstadosolicitud());
        query.setParameter("Descripcion", solman.getDescripcion());
        query.setParameter("Retirodomi", solman.getRetirodomicilio());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void eliminarSP(Solicitudmantencion solman) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin SOLICITUDMANTENCION_TAPI.del(:id); end;");
        query.setParameter("id", solman.getIdSolMantencion());
        query.executeUpdate();
        tx.commit();
        session.close();

    }
    
}
