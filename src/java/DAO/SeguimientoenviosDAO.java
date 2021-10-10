/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Hibernate.HibernateUtil;
import Model.Seguimientoenvios;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author baggr
 */
public class SeguimientoenviosDAO {
    
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
        Query query = session.createSQLQuery("begin SEGUIMIENTOENVIOS_TAPI.ins(:Estadoentrega,:Tipopago,:Fecentrega,:Direcentrega,:Fecdespacho, :Emptransporte, :Tipoentrega, :Idventa, SEQ_SEGUIMIENTOS.NEXTVAL); end;");
        query.setParameter("Estadoentrega", seguimiento.getEstadoentrega());
        query.setParameter("Tipopago", seguimiento.getTipopago());
        query.setParameter("Fecentrega", seguimiento.getFecentrega());
        query.setParameter("Direcentrega", seguimiento.getDireccentrega());
        query.setParameter("Fecdespacho", seguimiento.getFecdespacho());
        query.setParameter("Emptransporte", seguimiento.getEmptransporte());
        query.setParameter("Tipoentrega", seguimiento.getTipoentrega());
        query.setParameter("Idventa", seguimiento.getVenta());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void actualizarSP(Seguimientoenvios seguimiento) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin SEGUIMIENTOENVIOS_TAPI.upd(:Estadoentrega,:Tipopago,:Fecentrega,:Direcentrega,:Fecdespacho, :Emptransporte, :Tipoentrega, :Idventa, SEQ_SEGUIMIENTOS.NEXTVAL); end;");
        query.setParameter("Estadoentrega", seguimiento.getEstadoentrega());
        query.setParameter("Tipopago", seguimiento.getTipopago());
        query.setParameter("Fecentrega", seguimiento.getFecentrega());
        query.setParameter("Direcentrega", seguimiento.getDireccentrega());
        query.setParameter("Fecdespacho", seguimiento.getFecdespacho());
        query.setParameter("Emptransporte", seguimiento.getEmptransporte());
        query.setParameter("Tipoentrega", seguimiento.getTipoentrega());
        query.setParameter("Idventa", seguimiento.getVenta());
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
    
}
