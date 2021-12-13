/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import Config.Fecha;
import DAO.SeguimientoenviosDAO;
import DAO.VentaDAO;
import Model.Seguimiento;
import Model.Seguimientoenvios;
import Model.Venta;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Marco
 */
@WebServlet(name = "ControladorAgregarSeguimiento", urlPatterns = {"/ControladorAgregarSeguimiento"})
public class ControladorAgregarSeguimiento extends HttpServlet {
    
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

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
        
        VentaDAO vdao = new VentaDAO();
        String accion = request.getParameter("accion");
        
        switch (accion) {
            case "Enviar":
                String ide = request.getParameter("id");
                Venta p = vdao.listaridd(ide);
                request.setAttribute("producto", p);
                request.getRequestDispatcher("IngresarSeguimiento.jsp").forward(request, response);
                break;
            case "Guardar":
                SeguimientoenviosDAO sDAO = new SeguimientoenviosDAO();
                Seguimiento s = new Seguimiento();

                String id = request.getParameter("txtid");
                String idventa = request.getParameter("txtCodigo");
                String estado = request.getParameter("txtEstado");
                //String fehcaD = request.getParameter("txtFechades");
                //String fechaE = request.getParameter("txtFechae");
                String idventa2 = request.getParameter("txtidventa2");
                String h ="ACEPTADO";

                Venta v = new Venta();
                Venta vvv = new Venta();

                s.setIdSeguiEnvios(Long.parseLong(id));//id seguimiento
                v.setIdVenta(Long.parseLong(idventa));//id venta + el de abajo 
                s.setVenta(v);//
                
                s.setEstadoentrega(estado);//estado
               
                s.setFecdespacho(Fecha.FechaBD());//Fecha automatica al agregar

                //s.setFecentrega(null);//fecha por defecto null
                vvv.setIdVenta(Long.parseLong(idventa2));
                vvv.setEstadoventa(h);
                System.out.println(h);
                sDAO.ModificarEstadoVenta(vvv);

                sDAO.agregarSeguimiento(s);
                request.getRequestDispatcher("EnviarSeguimiento.jsp").forward(request, response);
                
            case "Finalizar":
                SeguimientoenviosDAO sDAOO = new SeguimientoenviosDAO();
                String idee = request.getParameter("id");
                Seguimientoenvios z = sDAOO.listaridd(idee);
                request.setAttribute("s", z);
                request.getRequestDispatcher("FinalizarSeguimiento.jsp").forward(request, response);
                break;
            case "Completar":
                SeguimientoenviosDAO ssDAO = new SeguimientoenviosDAO();
                Seguimiento ss = new Seguimiento();

                String idd = request.getParameter("txtid");
                String idventaa = request.getParameter("txtCodigo");
                String estadoo = request.getParameter("txtEstado");
                String fehcaD = request.getParameter("txtdespacho");
                String fechaE = request.getParameter("txtFechae");

                Venta vv = new Venta();

                ss.setIdSeguiEnvios(Long.parseLong(idd));//id seguimiento
              System.out.println(idd);
                vv.setIdVenta(Long.parseLong(idventaa));//id venta + el de abajo
                ss.setVenta(vv);//
              System.out.println(vv);
                ss.setEstadoentrega(estadoo);//estado
               System.out.println(estadoo);
                //ss.setFecdespacho(fehcaD);//Fecha ya ingresada
              System.out.println(fehcaD);
                ss.setFecentrega(Fecha.FechaBD());//fecha entrega automatica
              System.out.println(ss.getFecentrega());
                ssDAO.ModificarSeguimiento(ss);
                request.getRequestDispatcher("ListaSeguimiento.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
        }

        
        
        
        
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
