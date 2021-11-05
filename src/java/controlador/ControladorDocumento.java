/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.DocumentacionDAO;
import Model.Documentacion;
import Model.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mauro
 */
public class ControladorDocumento extends HttpServlet {

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
        
        Documentacion d = new Documentacion();    
        DocumentacionDAO dao = new DocumentacionDAO();
        
         String idp = request.getParameter("txtIdP");
                    String tipoDocumento = request.getParameter("txtTipo");
                    String nombreDocumento = request.getParameter("txtNombre");
                   //String nombreDocumento = request.getParameter("txtProducto");
                   String idpro = request.getParameter("txtIdP");
                   
                   Producto p = new Producto();
                   p.setIdProducto(Integer.parseInt(idpro));     
                    d.setProducto(p);//parseo 
                    d.setTipodocumento(tipoDocumento);
                    d.setNomdocumento(nombreDocumento);
                    //d.set(lista.get(4));
                    dao.ingresarSP(d);
                    
                    response.sendRedirect("verDocumento.jsp");
                    
                    
                    
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
