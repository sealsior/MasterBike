/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Hibernate.HibernateUtil;
import Model.Solicitudarriendo;
import Model.Servicio;
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
      
    public List<Servicio> listarServicio() {
        List<Servicio> servicios = null;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "from Servicio";
            Query q = sesion.createQuery(hql);
            servicios = q.list();

        } catch (Exception e) {
            System.out.println("Error en metodo listar:" + e.getMessage());
        } finally {
            sesion.close();
        }

        return servicios;
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
    
     
    public void ingresarSP(Solicitudarriendo solarri) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin SOLICITUDARRIENDO_TAPI.ins(:Tipobicicleta,:Idusuario,:Estado,:Fecini, SEQ_SOL_ARRIENDO.NEXTVAL, :Fecfin, :Formpago, :Depogarantia); end;");
        query.setParameter("Tipobicicleta", solarri.getTipobicicleta());
        query.setParameter("Idusuario", solarri.getUsuario());
        query.setParameter("Estado", solarri.getEstado());
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
        Query query = session.createSQLQuery("begin SOLICITUDARRIENDO_TAPI.upd(:Tipobicicleta,:Idusuario,:Estado,:Fecini, :IdArriendo, :Fecfin, :Formpago, :Depogarantia); end;");
        query.setParameter("Tipobicicleta", solarri.getTipobicicleta());
        query.setParameter("Idusuario", solarri.getUsuario());
        query.setParameter("Estado", solarri.getEstado());
        query.setParameter("Fecini", solarri.getFeciniArriendo());
        query.setParameter("Fecfin", solarri.getFecfinArriendo());
        query.setParameter("Formpago", solarri.getFormapagoArri());
        query.setParameter("Depogarantia", solarri.getDepositogarantia());
        query.setParameter("IdArriendo", solarri.getIdSolArriendo());
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
    
    //Solicitudes por usuario
    public List<Solicitudarriendo> buscarArriendosPorUsuario(Usuario usuario) {
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
                applySettings(configuration.getProperties());
        SessionFactory sf = configuration.buildSessionFactory(builder.build());
        
        Session session = sf.openSession();
        Query query = session.createQuery("from Solicitudarriendo where ID_USUARIO =:USUARIO");
        query.setParameter("USUARIO", usuario);
        List<Solicitudarriendo> arriendos = query.list();
        return arriendos;
    }
    
    public List<Solicitudarriendo> findPorId(String id) {
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
                applySettings(configuration.getProperties());
        SessionFactory sf = configuration.buildSessionFactory(builder.build());
        ///  SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Query query = session.createQuery("from Solicitudarriendo where ID_SOL_ARRIENDO='" + id + "'");
        List<Solicitudarriendo> solicitudarriendo = query.list();
        session.close();
        return solicitudarriendo;
    }
    
    //Solicitudes por usuario
    public List<Solicitudarriendo> UltimoArriendoUsuario(Usuario usuario) {
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
                applySettings(configuration.getProperties());
        SessionFactory sf = configuration.buildSessionFactory(builder.build());
        
        Session session = sf.openSession();
        Query query = session.createQuery("from Solicitudarriendo where ID_USUARIO =:USUARIO");
        query.setParameter("USUARIO", usuario);
        List<Solicitudarriendo> arriendos = query.list();
        return arriendos;
    }
    
}
