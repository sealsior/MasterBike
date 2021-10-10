/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Hibernate.HibernateUtil;
import Model.Documentacion;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author baggr
 */
public class DocumentacionDAO {
    
    public boolean crear(Documentacion docu) {
        boolean creado = false;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction tx = sesion.beginTransaction();
            sesion.save(docu);
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
    
      public List<Documentacion> listarDocumentacion() {
        List<Documentacion> lista = null;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction t = sesion.beginTransaction();
        String hql = "FROM Documentacion";
        try {
            lista = sesion.createQuery(hql).list();
            t.commit();
            sesion.close();
        } catch (Exception e) {
            t.rollback();
        }
        return lista;
    }
    
    public void agregar(Documentacion docu) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.save(docu);
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
    
    public void modificar(Documentacion docu) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.update(docu);
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
    
    public void eliminar(Documentacion docu) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.delete(docu);
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
    public void ingresarSP(Documentacion docu) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin DOCUMENTACION_TAPI.ins(:Documento,SEQ_DOCUMENTACION.NEXTVAL,:Nomdocumento,:Idproducto,:Tipodocumento); end;");
        query.setParameter("Documento", docu.getDocumento());
        query.setParameter("Nomdocumento", docu.getNomdocumento());
        query.setParameter("Idproducto", docu.getProducto());
        query.setParameter("Tipodocumento", docu.getTipodocumento());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void actualizarSP(Documentacion docu) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin DOCUMENTACION_TAPI.upd(:Documento,SEQ_DOCUMENTACION.NEXTVAL,:Nomdocumento,:Idproducto,:Tipodocumento); end;");
        query.setParameter("Documento", docu.getDocumento());
        query.setParameter("Nomdocumento", docu.getNomdocumento());
        query.setParameter("Idproducto", docu.getProducto());
        query.setParameter("Tipodocumento", docu.getTipodocumento());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void eliminarSP(Documentacion docu) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin DOCUMENTACION_TAPI.del(:id); end;");
        query.setParameter("id", docu.getIdDocumentacion());
        query.executeUpdate();
        tx.commit();
        session.close();

    }
    
}
