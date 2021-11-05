package controlador;

import Model.Pdf;

import DAO.DocumentacionDAO;
import Model.Documentacion;
import Model.Producto;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





public class ControladorPDF extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    //La variable acción realiza el almacenamiento obtenido tras el metodo post
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Declaración de variables
        String accion = request.getParameter("accion");
        Pdf p= new Pdf();

        int id;
        Documentacion d = new Documentacion();
        DocumentacionDAO dao = new DocumentacionDAO();
        
        switch (accion) {
            
            
            case "Listar":
                List<Pdf> pdf =dao.listar();
                 request.setAttribute("pdf", pdf);
                 request.getRequestDispatcher("AgregarDocumento.jsp").forward(request, response);            
                break;
                
            case "eliminar":
                        id = Integer.parseInt(request.getParameter("id"));
                        d.setIdDocumentacion(id);
                        dao.eliminarSP(d);
                        request.getRequestDispatcher("verDocumento.jsp").forward(request, response);
                        
                break;
               
/*
            case  "editar":
            
              
           String idp = request.getParameter("txtIdP");
                    String tipoDocumento = request.getParameter("txtTipo");
                    String nombreDocumento = request.getParameter("txtNombre");
                   //String nombreDocumento = request.getParameter("txtProducto");
                   String idpro = request.getParameter("txtIdP");
                   
                   Producto po = new Producto();
                   po.setIdProducto(Integer.parseInt(idpro));     
                    d.setProducto(po);//parseo 
                    d.setTipodocumento(tipoDocumento);
                    d.setNomdocumento(nombreDocumento);
                    //d.set(lista.get(4));
                    dao.actualizarSP(d);
                    
                    response.sendRedirect("Pdf.jsp"); 
                break;  */ 

                
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
