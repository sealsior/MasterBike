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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Marco
 */
public class ControladorEditarProducto extends HttpServlet {
    ProductoDAO pdao=new ProductoDAO();
    Producto p=new Producto();

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
        
        String accion= request.getParameter("accion");
        
         switch (accion){
             case "Editar":
                 String ide =request.getParameter("id") ;
                 Producto p=pdao.listaridd(ide);
                 request.setAttribute("producto", p);
                 request.getRequestDispatcher("ProductoEditar.jsp").forward(request, response);
                 break;
            case"Actualizar":
                long id;
                id = Long.parseLong(request.getParameter("txtid"));
                String nombres = request.getParameter("txtNombre");
                String tipo = request.getParameter("txtTipo");
                String descripcion = request.getParameter("txtDescripcion");
                String fpropia = request.getParameter("txtProveedor");
                String valor = request.getParameter("txtValor");
                String marca = request.getParameter("txtMarca");
                String modelo = request.getParameter("txtModelo");
                String stock = request.getParameter("txtStock");
                String imagen = request.getParameter("fileImagen");

                Producto pp = new Producto();
                //p.setIdProducto(Long.parseLong(idP));
                pp.setIdProducto(id);
                pp.setNombreproducto(nombres);
                pp.setTipoproducto(tipo);
                pp.setDescripcion(descripcion);
                pp.setFabricpropia(fpropia);
                pp.setValproducto(Long.parseLong(valor));//
                pp.setMarca(marca);
                pp.setModelo(modelo);
                pp.setStock(Long.parseLong(stock));
                pp.setImagen(imagen);

                pdao.modificar(pp);
                request.getRequestDispatcher("ListaProducto.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
         }
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        
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
