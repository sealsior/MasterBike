/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.MantencionDAO;
import Model.Mantencion;
import Model.Servicio;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author baggr
 */
@WebServlet(name = "ControladorTaller", urlPatterns = {"/ControladorTaller"})
public class ControladorTaller extends HttpServlet {

    MantencionDAO manDAO = new MantencionDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("antes sacar datos");
            
        try{   
        String idMantencion = request.getParameter("txtId");
        String IdServicio = request.getParameter("txtServicio");
        String idUser = request.getParameter("txtIdUser");
        String comentario = request.getParameter("txtComentario");
        String retiro = request.getParameter("txtRetiro");
        String fechasol = request.getParameter("txtFechasol");
        String garantia = request.getParameter("txtGarantia");       
        String fechain = request.getParameter("txtFechaIn"); 
        String fechaout = request.getParameter("txtFechaOut"); 
        String valor = request.getParameter("txtValor");
        String estado = request.getParameter("txtEstado");
        
        Mantencion m = new Mantencion();
        Usuario user = new Usuario();
        Servicio serv = new Servicio();
        
            
        m.setIdMantencion(Long.parseLong(idMantencion));
       
        serv.setIdServicio(Long.parseLong(IdServicio));
        
        m.setServicio(serv);
        
        user.setIdUsuario(Long.parseLong(idUser));
       
        m.setUsuario(user);
        
        m.setComentarios(comentario);
        
            
        m.setRetirodomicilio(retiro.charAt(0));
        
        
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
           
        Date fechaDate = formato.parse(fechasol);
        m.setFecSolicitada(fechaDate);
        
       m.setGarantia(garantia);
            
       Date fechaDate2 = formato.parse(fechain);
       m.setFecingreso(fechaDate2);
       
         
       Date fechaDate3 = formato.parse(fechaout);
       m.setFecsalida(fechaDate3);
          
        m.setValortotal(Long.parseLong(valor));
        
        m.setEstadosolicitud(estado);
       
             
        manDAO.actualizarSP(m);
        
            
        
        request.setAttribute("mensajeSalida","Solicitud de mantencion enviada");
        } catch (Exception ex) {
            System.out.println(ex.getMessage());    
            request.setAttribute("mensajeSalida","No se pudo enviar la solicitud");
        }
        
        response.sendRedirect("/MasterBike/ListarSolicitudesMantenciones.jsp");
       
    }

     

}
