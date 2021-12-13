/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Hibernate.HibernateUtil;
import Model.Mantencion;
import Model.Usuario;
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
      public List<Mantencion> listarMantencionesWhere() {
        List<Mantencion> lista = null;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction t = sesion.beginTransaction();
        String hql = "FROM Mantencion Where ESTADOSOLICITUD != 'Pendiente'";
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
    
  
    public void ingresarSP(Mantencion mant) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin MANTENCION_TAPI.ins(:Comentario,:Idservicio,:ValorTotal,:Idusuario,:FecSolicitada,:EstadoSolicitud,:Fecingreso,:Garantia, SEQ_MANTENCION.NEXTVAL, :Fecsalida, :RetiroDom); end;");
        query.setParameter("Comentario", mant.getComentarios());
        query.setParameter("Idservicio", mant.getServicio());
        query.setParameter("ValorTotal", mant.getValortotal());
        query.setParameter("Idusuario", mant.getUsuario());
        query.setParameter("FecSolicitada", mant.getFecSolicitada());
        query.setParameter("EstadoSolicitud", mant.getEstadosolicitud());
        query.setParameter("Fecingreso", mant.getFecingreso());
        query.setParameter("Garantia", mant.getGarantia());
        query.setParameter("Fecsalida", mant.getFecsalida());
        query.setParameter("RetiroDom", mant.getRetirodomicilio());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void actualizarSP(Mantencion mant) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin MANTENCION_TAPI.upd(:Comentario,:Idservicio,:ValorTotal,:Idusuario,:FecSolicitada,:EstadoSolicitud,:Fecingreso,:Garantia, :IdMantencion, :Fecsalida, :RetiroDom); end;");
        query.setParameter("Comentario", mant.getComentarios());
        query.setParameter("Idservicio", mant.getServicio());
        query.setParameter("ValorTotal", mant.getValortotal());
        query.setParameter("Idusuario", mant.getUsuario());
        query.setParameter("FecSolicitada", mant.getFecSolicitada());
        query.setParameter("EstadoSolicitud", mant.getEstadosolicitud());
        query.setParameter("Fecingreso", mant.getFecingreso());
        query.setParameter("Garantia", mant.getGarantia());
        query.setParameter("Fecsalida", mant.getFecsalida());
        query.setParameter("RetiroDom", mant.getRetirodomicilio());
        query.setParameter("IdMantencion", mant.getIdMantencion());
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
    
   
    
    public List<Mantencion> findID(long id) {
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
                applySettings(configuration.getProperties());
        SessionFactory sf = configuration.buildSessionFactory(builder.build());
       
        Session session = sf.openSession();
        Query query = session.createQuery("from Mantencion where ID_MANTENCION="+id );
        List<Mantencion> mantencion = query.list();
        session.close();
        return mantencion;
    }
    
     //Se rescata mantencion por su id
    public List<Mantencion> find(String idMantencion) {
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
                applySettings(configuration.getProperties());
        SessionFactory sf = configuration.buildSessionFactory(builder.build());
        
        Session session = sf.openSession();
        Query query = session.createQuery("from Mantencion where ID_MANTENCION ="+idMantencion);
      
        List<Mantencion> mantencion = query.list();
        return mantencion;
    }
    
    //Solicitudes por usuario
    public List<Mantencion> buscarMantencionesPorUsuario(Usuario usuario) {
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
                applySettings(configuration.getProperties());
        SessionFactory sf = configuration.buildSessionFactory(builder.build());
        
        Session session = sf.openSession();
        Query query = session.createQuery("from Mantencion where ID_USUARIO =:USUARIO");
        query.setParameter("USUARIO", usuario);
        List<Mantencion> mantenciones = query.list();
        return mantenciones;
    }
    
}
