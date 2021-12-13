/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.DocumentacionDAO;
import DAO.ProductoDAO;
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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Marco
 */
public class ControladorDocumentos extends HttpServlet {

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
        processRequest(request, response);
        ProductoDAO pdao = new ProductoDAO();

        String accion = request.getParameter("accion");

        switch (accion) {
            case "add":
                String ide = request.getParameter("id");
                Producto p = pdao.listaridd(ide);
                request.setAttribute("producto", p);
                request.getRequestDispatcher("DocumentoAgregar.jsp").forward(request, response);
                break;
            case "eliminar":
                DocumentacionDAO ddDAO = new DocumentacionDAO();
                Documentacion a = new Documentacion();
                id = Integer.parseInt(request.getParameter("id"));
                a.setIdDocumentacion(id);
                ddDAO.eliminarSP(a);
                response.sendRedirect("/MasterBike/ListaDocumentos.jsp");
                break;

            default:
                throw new AssertionError();
        }
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

        DocumentacionDAO dDAO = new DocumentacionDAO();

        Producto pp = new Producto();
        Documentacion ppp = new Documentacion();
        ArrayList<String> lista = new ArrayList<>();
        try {
            FileItemFactory file = new DiskFileItemFactory();
            ServletFileUpload fileUpload = new ServletFileUpload(file);
            List items = fileUpload.parseRequest(request);
            for (int i = 0; i < items.size(); i++) {
                FileItem fileItem = (FileItem) items.get(i);
                if (!fileItem.isFormField()) {
                    File f = new File("C:\\xampp\\htdocs\\img\\" + fileItem.getName());
                    fileItem.write(f);
                    ppp.setDocumento("http://localhost/img/" + fileItem.getName());
                } else {
                    lista.add(fileItem.getString());
                }
            }
            ppp.setNomdocumento(lista.get(0));
            pp.setIdProducto(Long.parseLong(lista.get(1)));
            ppp.setProducto(pp);
            ppp.setTipodocumento(lista.get(2));

            dDAO.ingresarSP(ppp);
        } catch (Exception e) {
            System.out.println(e);
        }

        response.sendRedirect("/MasterBike/ListaProducto.jsp");

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
