/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Usuario;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;
import Hibernate.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author baggr
 */
public class UsuarioDAO {
    
    
    
    public boolean crear(Usuario usuario) {
        boolean creado = false;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction tx = sesion.beginTransaction();
            sesion.save(usuario);
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
    
      public List<Usuario> listarUsuarios() {
        List<Usuario> lista = null;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction t = sesion.beginTransaction();
        String hql = "FROM Usuario";
        try {
            lista = sesion.createQuery(hql).list();
            t.commit();
            sesion.close();
        } catch (Exception e) {
            t.rollback();
        }
        return lista;
    }
    
    public void agregar(Usuario usuario) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.save(usuario);
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
    
    public void modificar(Usuario usuario) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.update(usuario);
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
    
    public void eliminar(Usuario usuario) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.delete(usuario);
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
    public void ingresarSP(Usuario usuario) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin USUARIO_TAPI.ins(:Nombre,SEQ_USUARIOS.NEXTVAL,:Password,:Direccion,:Apaterno, :Idrol, :Rut, :Email, :Fechanac, :Apaterno, :Numero); end;");
        query.setParameter("Nombre", usuario.getPnombre());
        query.setParameter("Password", usuario.getPassword());
        query.setParameter("Direccion", usuario.getDireccionUsuario());
        query.setParameter("Apaterno", usuario.getAppaterno());
        query.setParameter("Idrol", usuario.getRol());
        query.setParameter("Rut", usuario.getRutUsuario());
        query.setParameter("Email", usuario.getEmailUsuario());
        query.setParameter("Fechanac", usuario.getFechanac());
        query.setParameter("Apaterno", usuario.getAppaterno());
        query.setParameter("Numero", usuario.getNumtelefono());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void actualizarSP(Usuario usuario) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin USUARIO_TAPI.ins(:Nombre,SEQ_USUARIOS.NEXTVAL,:Password,:Direccion,:Apaterno, :Idrol, :Rut, :Email, :Fechanac, :Apaterno, :Numero); end;");
        query.setParameter("Nombre", usuario.getPnombre());
        query.setParameter("Password", usuario.getPassword());
        query.setParameter("Direccion", usuario.getDireccionUsuario());
        query.setParameter("Apaterno", usuario.getAppaterno());
        query.setParameter("Idrol", usuario.getRol());
        query.setParameter("Rut", usuario.getRutUsuario());
        query.setParameter("Email", usuario.getEmailUsuario());
        query.setParameter("Fechanac", usuario.getFechanac());
        query.setParameter("Apaterno", usuario.getAppaterno());
        query.setParameter("Numero", usuario.getNumtelefono());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void eliminarSP(Usuario usuario) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin USUARIO_TAPI.del(:id); end;");
        query.setParameter("id", usuario.getIdUsuario());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    
}
