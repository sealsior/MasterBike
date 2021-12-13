/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Usuario;
import java.util.List;

import java.util.List;
import Hibernate.HibernateUtil;

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

    public void ingresarSP(Usuario usuario) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin USUARIO_TAPI.ins(:Convenio,SEQ_USUARIOS.NEXTVAL,:Password,:Direccion, :Idrol, :Email,:Apellidos, :Rut, :Fechanac, :Nombre, :Numero); end;");
        query.setParameter("Convenio", usuario.getConvenio());
        query.setParameter("Password", usuario.getPassword());
        query.setParameter("Direccion", usuario.getDireccionUsuario());
        query.setParameter("Idrol", usuario.getRol());
        query.setParameter("Email", usuario.getEmailUsuario());
        query.setParameter("Apellidos", usuario.getApellidos());
        query.setParameter("Rut", usuario.getRutUsuario());
        query.setParameter("Fechanac", usuario.getFechanac());
        query.setParameter("Nombre", usuario.getNombre());
        query.setParameter("Numero", usuario.getNumtelefono());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void actualizarSP(Usuario usuario) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin USUARIO_TAPI.upd(:Convenio,:Idusuario,:Password,:Direccion, :Idrol, :Email,:Apellidos, :Rut, :Fechanac, :Nombre, :Numero); end;");
        query.setParameter("Convenio", usuario.getConvenio());
        query.setParameter("Idusuario", usuario.getIdUsuario());
        query.setParameter("Password", usuario.getPassword());
        query.setParameter("Direccion", usuario.getDireccionUsuario());
        query.setParameter("Idrol", usuario.getRol());
        query.setParameter("Email", usuario.getEmailUsuario());
        query.setParameter("Apellidos", usuario.getApellidos());
        query.setParameter("Rut", usuario.getRutUsuario());
        query.setParameter("Fechanac", usuario.getFechanac());
        query.setParameter("Nombre", usuario.getNombre());
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

    public List<Usuario> find(String mail) {
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
                applySettings(configuration.getProperties());
        SessionFactory sf = configuration.buildSessionFactory(builder.build());
        ///  SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Query query = session.createQuery("from Usuario where EMAIL_USUARIO='" + mail + "'");
        List<Usuario> usuario = query.list();
        session.close();
        return usuario;
    }

    public List<Usuario> findPorId(String id) {
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
                applySettings(configuration.getProperties());
        SessionFactory sf = configuration.buildSessionFactory(builder.build());
        ///  SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Query query = session.createQuery("from Usuario where ID_USUARIO='" + id + "'");
        List<Usuario> usuario = query.list();
        session.close();
        return usuario;
    }

    public List<Usuario> buscarUsuarioModificar(Usuario usuario) {
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
                applySettings(configuration.getProperties());
        SessionFactory sf = configuration.buildSessionFactory(builder.build());

        Session session = sf.openSession();
        Query query = session.createQuery("from Usuario where ID_USUARIO =:USUARIO");
        query.setParameter("USUARIO", usuario);
        List<Usuario> usuarios = query.list();
        return usuarios;
    }

    public List<Usuario> findPorConvenio(String convenio) {
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
                applySettings(configuration.getProperties());
        SessionFactory sf = configuration.buildSessionFactory(builder.build());
        ///  SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Query query = session.createQuery("from Usuario where CONVENIO='" + convenio + "' and ID_ROL=" + 1);
        List<Usuario> usuario = query.list();
        session.close();
        return usuario;
    }

}
