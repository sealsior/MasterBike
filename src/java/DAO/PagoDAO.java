/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Hibernate.HibernateUtil;
import Model.Pago;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author baggr
 */
public class PagoDAO {
    
    public boolean crear(Pago pago) {
        boolean creado = false;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction tx = sesion.beginTransaction();
            sesion.save(pago);
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
    

    
    
    public void eliminar(Pago pago) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.delete(pago);
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
    public void ingresarSP(Pago pago) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin PAGO_TAPI.ins(:Monto,SEQ_PAGO.NEXTVAL); end;");
        query.setParameter("Monto", pago.getMonto());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void actualizarSP(Pago pago) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin PAGO_TAPI.upd(:Monto,SEQ_PAGO.NEXTVAL); end;");
        query.setParameter("Monto", pago.getMonto());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void eliminarSP(Pago pago) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin PAGO_TAPI.del(:id); end;");
        query.setParameter("id", pago.getIdPago());
        query.executeUpdate();
        tx.commit();
        session.close();

    }
    
}
