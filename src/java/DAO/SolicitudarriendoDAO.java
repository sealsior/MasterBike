/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Hibernate.HibernateUtil;
import Model.Solicitudarriendo;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author baggr
 */
public class SolicitudarriendoDAO {
    
    public boolean crear(Solicitudarriendo solarri) {
        boolean creado = false;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction tx = sesion.beginTransaction();
            sesion.save(solarri);
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
    
      public List<Solicitudarriendo> listarSolicitudesarriendo() {
        List<Solicitudarriendo> lista = null;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction t = sesion.beginTransaction();
        String hql = "FROM Solicitudarriendo";
        try {
            lista = sesion.createQuery(hql).list();
            t.commit();
            sesion.close();
        } catch (Exception e) {
            t.rollback();
        }
        return lista;
    }
    
    public void agregar(Solicitudarriendo solarri) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.save(solarri);
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
    
    public void modificar(Solicitudarriendo solarri) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.update(solarri);
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
    
    public void eliminar(Solicitudarriendo solarri) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.delete(solarri);
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
    public void ingresarSP(Solicitudarriendo solarri) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin SOLICITUDARRIENDO_TAPI.ins(:Tipobicicleta,:Idusuario,:Comentario,:Fecini, SEQ_SOL_ARRIENDO.NEXTVAL, :Fecfin, :Formpago, :Depogarantia); end;");
        query.setParameter("Tipobicicleta", solarri.getTipobicicleta());
        query.setParameter("Idusuario", solarri.getUsuario());
        query.setParameter("Comentario", solarri.getComentario());
        query.setParameter("Fecini", solarri.getFeciniArriendo());
        query.setParameter("Fecfin", solarri.getFecfinArriendo());
        query.setParameter("Formpago", solarri.getFormapagoArri());
        query.setParameter("Depogarantia", solarri.getDepositogarantia());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void actualizarSP(Solicitudarriendo solarri) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin SOLICITUDARRIENDO_TAPI.upd(:Tipobicicleta,:Idusuario,:Comentario,:Fecini, SEQ_SOL_ARRIENDO.NEXTVAL, :Fecfin, :Formpago, :Depogarantia); end;");
        query.setParameter("Tipobicicleta", solarri.getTipobicicleta());
        query.setParameter("Idusuario", solarri.getUsuario());
        query.setParameter("Comentario", solarri.getComentario());
        query.setParameter("Fecini", solarri.getFeciniArriendo());
        query.setParameter("Fecfin", solarri.getFecfinArriendo());
        query.setParameter("Formpago", solarri.getFormapagoArri());
        query.setParameter("Depogarantia", solarri.getDepositogarantia());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void eliminarSP(Solicitudarriendo solarri) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin SOLICITUDARRIENDO_TAPI.del(:id); end;");
        query.setParameter("id", solarri.getIdSolArriendo());
        query.executeUpdate();
        tx.commit();
        session.close();

    }
    
}
