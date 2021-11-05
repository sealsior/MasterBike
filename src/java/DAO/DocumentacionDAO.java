    
package DAO;

import Config.Conexion;
import Hibernate.HibernateUtil;
import Model.Documentacion;
import Model.Pdf;
import Model.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author baggr
 */
public class DocumentacionDAO {
       Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    int r= 0;
    int res;
    String msj;
    
    Conexion cn = new Conexion();
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
    
    public Documentacion listaridd(String id){//en este estoy trabajando ahora
           String sql = "SELECT * FROM documentacion where id_documentacion = " + id;
           Documentacion p = new Documentacion();
           try {
            conn = cn.conectar();//
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setIdDocumentacion(rs.getLong(1));
                p.setTipodocumento(rs.getString(2));
                p.setNomdocumento(rs.getString(3));
                p.setDocumento(rs.getBlob(4));
                p.setProducto(new Producto());
                
                p.getProducto().setIdProducto(rs.getLong(5));
            }
        } catch (Exception e) {
        }
           return p;
    }
    
     public int agregar(Pdf p){
        Conexion cn = new Conexion();      
        String sql ="begin DOCUMENTACION_TAPI.ins(:Documento,SEQ_DOCUMENTACION.NEXTVAL,:Nomdocumento,:Idproducto,:Tipodocumento); end;";
        try {
            conn=cn.conectar();
            ps=conn.prepareStatement(sql);
            
            ps.setBytes(1, p.getDOCUMENTO());
            ps.setString(2, p.getNOMDOCUMENTO());
            ps.setInt(3, p.getID_PRODUCTO());
            ps.setString(4, p.getTIPODOCUMENTO());
            ps.executeUpdate();  
        } catch (Exception e) {
        }
        return r;
    }
    
    public List<Pdf>listar (){
        Conexion cn = new Conexion();      
        String sql ="SELECT * FROM documentacion ORDER BY id_documentacion ASC";
        List<Pdf>lista = new ArrayList<>();
        try {
            conn=cn.conectar();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                Pdf p= new Pdf();
                p.setID_DOCUMENTACION(rs.getInt(1));
                p.setTIPODOCUMENTO(rs.getString(2));
                p.setNOMDOCUMENTO(rs.getString(3));
                p.setDOCUMENTO(rs.getBytes(4));
                lista.add(p);
            }
        } catch (Exception e) {
        }
        return lista; 
    }
    
     public boolean eliminar(int id) {
        Conexion cn = new Conexion();  
        String sql="delete from documentacion where id_documentacion="+id;
        try {
            conn=cn.conectar();
            ps=conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
