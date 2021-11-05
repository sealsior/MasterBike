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

public class ControladorEditarDocumento extends HttpServlet {
    DocumentacionDAO ddao= new DocumentacionDAO();
    Documentacion d = new Documentacion();
    
    
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
                 Documentacion p=ddao.listaridd(ide);
                 request.setAttribute("d", p);
                 request.getRequestDispatcher("EditarDocumento.jsp").forward(request, response);
                break;
            case "Actualizar":
                long id;
                id = Long.parseLong(request.getParameter("txtid"));
         
                String tipoDocumento = request.getParameter("txtTipo");
                String nombreDocumento = request.getParameter("txtNombre");
                //String nombreDocumento = request.getParameter("txtProducto");
                //String documento = request.getParameter("txtdocumento");
                String idpro = request.getParameter("txtIdP");

                Producto pr = new Producto();
                d.setIdDocumentacion(id);
                pr.setIdProducto(Long.parseLong(idpro));
                d.setProducto(pr);//parseo 
                d.setTipodocumento(tipoDocumento);
                d.setNomdocumento(nombreDocumento);           
                //d.getDocumento();
                
                //d.set(lista.get(4));
                ddao.actualizarSP(d);

                request.getRequestDispatcher("verDocumento.jsp").forward(request, response);
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
