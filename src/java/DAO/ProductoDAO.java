/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Hibernate.HibernateUtil;
import Model.Producto;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author baggr
 */
public class ProductoDAO {
    
    public boolean crear(Producto prod) {
        boolean creado = false;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            Transaction tx = sesion.beginTransaction();
            sesion.save(prod);
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
    
      public List<Producto> listarProductos() {
        List<Producto> lista = null;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction t = sesion.beginTransaction();
        String hql = "FROM Producto";
        try {
            lista = sesion.createQuery(hql).list();
            t.commit();
            sesion.close();
        } catch (Exception e) {
            t.rollback();
        }
        return lista;
    }
    
    public void agregar(Producto prod) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.save(prod);
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
    
    public void modificar(Producto prod) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.update(prod);
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
    
    public void eliminar(Producto prod) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.delete(prod);
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
    public void ingresarSP(Producto prod) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin PRODUCTO_TAPI.ins(:Tipoproducto,Fabricpropia,:Marca,:Nombreproducto,:Modelo, SEQ_PRODUCTOS.NEXTVAL, :Descripcion, :Valproducto, :Stock, :Imagen); end;");
        query.setParameter("Tipoproducto", prod.getTipoproducto());
        query.setParameter("Fabricpropia", prod.getFabricpropia());
        query.setParameter("Marca", prod.getMarca());
        query.setParameter("Nombreproducto", prod.getNombreproducto());
        query.setParameter("Modelo", prod.getModelo());
        query.setParameter("Descripcion", prod.getDescripcion());
        query.setParameter("Valproducto", prod.getValproducto());
        query.setParameter("Stock", prod.getStock());
        query.setParameter("Imagen", prod.getImagen());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void actualizarSP(Producto prod) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
      Query query = session.createSQLQuery("begin PRODUCTO_TAPI.upd(:Tipoproducto,Fabricpropia,:Marca,:Nombreproducto,:Modelo, SEQ_PRODUCTOS.NEXTVAL, :Descripcion, :Valproducto, :Stock, :Imagen); end;");
        query.setParameter("Tipoproducto", prod.getTipoproducto());
        query.setParameter("Fabricpropia", prod.getFabricpropia());
        query.setParameter("Marca", prod.getMarca());
        query.setParameter("Nombreproducto", prod.getNombreproducto());
        query.setParameter("Modelo", prod.getModelo());
        query.setParameter("Descripcion", prod.getDescripcion());
        query.setParameter("Valproducto", prod.getValproducto());
        query.setParameter("Stock", prod.getStock());
        query.setParameter("Imagen", prod.getImagen());
        query.executeUpdate();
        tx.commit();
        session.close();

    }

    public void eliminarSP(Producto prod) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createSQLQuery("begin PRODUCTO_TAPI.del(:id); end;");
        query.setParameter("id", prod.getIdProducto());
        query.executeUpdate();
        tx.commit();
        session.close();

    }
    
}
