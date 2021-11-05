/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Config.Conexion;
import Hibernate.HibernateUtil;
import Model.Producto;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import modelo.Producto1;
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
public class ProductoDAO {
    
    Connection con;
    Conexion cn=new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
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
        String hql = "FROM Producto order by ID_PRODUCTO desc";
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
        Query query = session.createSQLQuery("begin PRODUCTO_TAPI.ins(:Tipoproducto,:Fabricpropia,:Marca,:Nombreproducto,:Modelo, SEQ_PRODUCTOS.NEXTVAL, :Descripcion, :Valproducto, :Stock, :Imagen); end;");
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
      Query query = session.createSQLQuery("begin PRODUCTO_TAPI.upd(:Tipoproducto,:Fabricpropia,:Marca,:Nombreproducto,:Modelo, SEQ_PRODUCTOS.NEXTVAL, :Descripcion, :Valproducto, :Stock, :Imagen); end;");
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
    //Copia de aqui para abajo
    
    public Producto1 listarId(int id){
        String sql="select * from PRODUCTO where ID_PRODUCTO="+id;
        Producto1 p=new Producto1();
        try {
            con=cn.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setTipo(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setPropio(rs.getString(5));
                p.setValor(rs.getInt(6));
                p.setMarca(rs.getString(7));
                p.setModelo(rs.getString(8));
                p.setStock(rs.getInt(9));
                p.setFoto(rs.getBinaryStream(10));
            }
        } catch (Exception e) {
        }
        return p;
    
    }
    
    public List listar()
    {
        List<Producto1>productos=new ArrayList();
        String sql="select * from PRODUCTO";
        try {
            con=cn.conectar();//mi clase conectar() es la q tengo q usar recuerda q esta bien!!!!!!
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                Producto1 p=new Producto1();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setTipo(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setPropio(rs.getString(5));
                p.setValor(rs.getInt(6));
                p.setMarca(rs.getString(7));
                p.setModelo(rs.getString(8));
                p.setStock(rs.getInt(9));
                p.setFoto(rs.getBinaryStream(10));
                
                productos.add(p);
                
            }
        } catch (Exception e) {
        }
        return productos;
    }
    
    public void listarImg(int id, HttpServletResponse response){
        String sql="select * from PRODUCTO where ID_PRODUCTO="+id;
        InputStream inputStream=null;
        OutputStream outputStream=null;
        BufferedInputStream bufferedInputStream=null;
        BufferedOutputStream bufferedOutputStream=null;
        
        try {
            outputStream=response.getOutputStream();
            
            con=cn.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            if (rs.next()) {
                inputStream=rs.getBinaryStream("Foto");
            }
            bufferedInputStream=new BufferedInputStream(inputStream);
            bufferedOutputStream=new BufferedOutputStream(outputStream);
            int i=0;
            while ((i=bufferedInputStream.read())!=-1) {                
                bufferedOutputStream.write(i);
            }

        } catch (Exception e) {
        }
    }
    
    
    public List<Producto> findID(long id) {//lista por id con hibernate
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
                applySettings(configuration.getProperties());
        SessionFactory sf = configuration.buildSessionFactory(builder.build());
        ///  SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Query query = session.createQuery("from Producto where ID_PRODUCTO="+id );
        List<Producto> producto = query.list();
        session.close();
        return producto;
    }
    public List<Producto> findIDProducto(String id) {//lista por id con hibernate de detalles venta
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
                applySettings(configuration.getProperties());
        SessionFactory sf = configuration.buildSessionFactory(builder.build());
        ///  SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Query query = session.createQuery(" from Producto where ID_PRODUCTO= " + id);
        List<Producto> detalle = query.list();
        session.close();
        return detalle;

    }
    public Producto listaridd(String id){//en este estoy trabajando ahora
           String sql = "select * from PRODUCTO where ID_PRODUCTO= " + id;
           Producto p = new Producto();
           try {
            con = cn.conectar();//
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setIdProducto(rs.getLong(1));
            }
        } catch (Exception e) {
        }
            
           return p;
    }
    //FILTRAR POR BICICLETA 
    public List listarBicicleta() {
        List<Producto1> productos = new ArrayList();
        String sql = "select * from PRODUCTO TIPOPRODUCTO='Bicicleta'";
        try {
            con = cn.conectar();//
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto1 p = new Producto1();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setTipo(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setPropio(rs.getString(5));
                p.setValor(rs.getInt(6));
                p.setMarca(rs.getString(7));
                p.setModelo(rs.getString(8));
                p.setStock(rs.getInt(9));
                p.setFoto(rs.getBinaryStream(10));

                productos.add(p);

            }
        } catch (Exception e) {
        }
        return productos;
    }
    //LISTAR POR ACCESORIO
    public List listarAccesorio()
    {
        List<Producto1>productos=new ArrayList();
        String sql="select * from PRODUCTO TIPOPRODUCTO='Accesorio'";
        try {
            con=cn.conectar();//
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                Producto1 p=new Producto1();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setTipo(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setPropio(rs.getString(5));
                p.setValor(rs.getInt(6));
                p.setMarca(rs.getString(7));
                p.setModelo(rs.getString(8));
                p.setStock(rs.getInt(9));
                p.setFoto(rs.getBinaryStream(10));
                
                productos.add(p);
                
            }
        } catch (Exception e) {
        }
        return productos;
    }
    //LISTAR POR REPUESTO
    public List listarRespuesto()
    {
        List<Producto1>productos=new ArrayList();
        String sql="select * from PRODUCTO TIPOPRODUCTO='Repuesto'";
        try {
            con=cn.conectar();//
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                Producto1 p=new Producto1();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setTipo(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setPropio(rs.getString(5));
                p.setValor(rs.getInt(6));
                p.setMarca(rs.getString(7));
                p.setModelo(rs.getString(8));
                p.setStock(rs.getInt(9));
                p.setFoto(rs.getBinaryStream(10));
                
                productos.add(p);
                
            }
        } catch (Exception e) {
        }
        return productos;
    }
    //PRUEBA EXITOSA
    public List<Producto> listarProductosTipo() {
        List<Producto> lista = null;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction t = sesion.beginTransaction();
        String hql = "FROM Producto where TIPOPRODUCTO='Bicicleta' ";
        try {
            lista = sesion.createQuery(hql).list();
            t.commit();
            sesion.close();
        } catch (Exception e) {
            t.rollback();
        }
        return lista;
    }
    
    public List<Producto> listarProductosAccesorio() {
        List<Producto> lista = null;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction t = sesion.beginTransaction();
        String hql = "FROM Producto where TIPOPRODUCTO='Accesorio' ";
        try {
            lista = sesion.createQuery(hql).list();
            t.commit();
            sesion.close();
        } catch (Exception e) {
            t.rollback();
        }
        return lista;
    }
    
    public List<Producto> listarProductosRepuesto() {
        List<Producto> lista = null;
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Transaction t = sesion.beginTransaction();
        String hql = "FROM Producto where TIPOPRODUCTO='Repuesto' ";
        try {
            lista = sesion.createQuery(hql).list();
            t.commit();
            sesion.close();
        } catch (Exception e) {
            t.rollback();
        }
        return lista;
    }
   
   
}
