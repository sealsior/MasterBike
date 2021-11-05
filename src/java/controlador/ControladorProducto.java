/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.ProductoDAO;
import Model.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Marco
 */
@WebServlet(name = "ControladorProducto", urlPatterns = {"/ControladorProducto"})
public class ControladorProducto extends HttpServlet {
    
    String edit="EditarProducto.jsp";
    String listar="ListaProducto.jsp";
    long id;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acceso="";
        String action= request.getParameter("accion");
        
        if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idpro", request.getParameter("id"));
            acceso=edit;
            //response.sendRedirect("/MasterBike/EditarProducto.jsp");
        }else if(action.equals("Actualizar")){
            
        //String idP=request.getParameter("txtid");
         id=Long.parseLong(request.getParameter("txtid"));
        String nombres = request.getParameter("txtNombre");
        String tipo = request.getParameter("txtTipo");
        String descripcion = request.getParameter("txtDescripcion");
        String fpropia = request.getParameter("txtProveedor");
        String valor = request.getParameter("txtValor");
        String marca = request.getParameter("txtMarca");
        String modelo = request.getParameter("txtModelo");
        String stock = request.getParameter("txtStock");
        //String imagen = request.getParameter("fileImagen");
        
        Producto p = new Producto();
        //p.setIdProducto(Long.parseLong(idP));
        p.setIdProducto(id);
        p.setNombreproducto(nombres);
        p.setTipoproducto(tipo);
        p.setDescripcion(descripcion);
        p.setFabricpropia(fpropia);
        p.setValproducto(Long.parseLong(valor));//
        p.setMarca(marca);
        p.setModelo(modelo);
        p.setStock(Long.parseLong(stock));
        //p.setImagen(null);
        
        pDAO.modificar(p);
        
        
        }else if(action.equalsIgnoreCase("eliminar")){
            Producto p = new Producto();
            id=Integer.parseInt(request.getParameter("id"));
            p.setIdProducto(id);
            pDAO.eliminarSP(p);
            acceso=listar;
        
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    ProductoDAO pDAO=new ProductoDAO();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String nombres = request.getParameter("txtNombre");
        String tipo = request.getParameter("txtTipo");
        String descripcion = request.getParameter("txtDescripcion");
        String fpropia = request.getParameter("txtProveedor");
        String valor = request.getParameter("txtValor");
        String marca = request.getParameter("txtMarca");
        String modelo = request.getParameter("txtModelo");
        String stock = request.getParameter("txtStock");
        //String imagen = request.getParameter("fileImagen");
        
        Producto p = new Producto();
        
        p.setNombreproducto(nombres);
        p.setTipoproducto(tipo);
        p.setDescripcion(descripcion);
        p.setFabricpropia(fpropia);
        p.setValproducto(Long.parseLong(valor));//
        p.setMarca(marca);
        p.setModelo(modelo);
        p.setStock(Long.parseLong(stock));
        //p.setImagen(null);
        
        pDAO.ingresarSP(p);
        
        response.sendRedirect("/MasterBike/ListaProducto.jsp");
        
        
        //listar
        //List<Producto>productos=pDAO.listarProductos();
        //request.setAttribute("pro", productos);
        //request.getRequestDispatcher("ListaProducto.jsp").forward(request, response);
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
