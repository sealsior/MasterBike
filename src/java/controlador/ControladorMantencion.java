/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.MantencionDAO;
import DAO.ServicioDAO;

import Model.Mantencion;
import Model.Servicio;

import Model.Usuario;
import java.io.IOException;
<<<<<<< HEAD
import java.text.ParseException;
=======
>>>>>>> master

import java.text.SimpleDateFormat;
import java.util.Date;

import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author baggr
 */
@WebServlet(name = "ControladorMantencion", urlPatterns = {"/ControladorMantencion"})
public class ControladorMantencion extends HttpServlet {

     MantencionDAO manDAO = new MantencionDAO();
     ServicioDAO servicioDAO = new ServicioDAO();
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        List<Servicio> listaServicio = servicioDAO.listarServicio();
        
        request.setAttribute("servicio", listaServicio);
        request.getRequestDispatcher("/SolicitudMantencion.jsp").forward(request, response);
       
        
       
    }

  
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Mantencion mant = new Mantencion();
        Usuario user = new Usuario();
        Servicio serv = new Servicio();
        
      
       
<<<<<<< HEAD
=======
        try {
>>>>>>> master
        String IdServicio = request.getParameter("cboServicio");
        String comentario = request.getParameter("txtComentario");
        String retiro = request.getParameter("cboRetiro");
        String fechasol = request.getParameter("txtFechasol");

        
        //Ingresado por cliente al inicio
        serv.setIdServicio(Long.parseLong(IdServicio));
        mant.setServicio(serv);
        user = (Usuario) session.getAttribute("usuarioActivo");
        mant.setUsuario(user);
        mant.setComentarios(comentario);
        mant.setRetirodomicilio(retiro.charAt(0));
        mant.setEstadosolicitud("Pendiente");
<<<<<<< HEAD
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date fechaDate = formato.parse(fechasol);
            mant.setFecSolicitada(fechaDate);
        } catch (ParseException ex){
        }
                
        mant.setGarantia("N");
        try {   
            Date fechaDate = formato.parse(fechasol);
            mant.setFecingreso(fechaDate);
        } catch(ParseException ex){
        }
            
        try {
            Date fechaDate = formato.parse(fechasol);
            mant.setFecsalida(fechaDate);
        }catch(ParseException ex){
        }    
        
        mant.setValortotal(Long.valueOf(0));
            
            
        manDAO.ingresarSP(mant);
            
            
        
             
=======
        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
        Date fechaDate = formato.parse(fechasol);
        mant.setFecSolicitada(fechaDate);
        
            
        //Se modifica luego por Tecnico
        
        mant.setGarantia("N");
        mant.setFecingreso(fechaDate);
        mant.setFecsalida(fechaDate);
        mant.setValortotal(Long.valueOf(0));
            
            
            manDAO.ingresarSP(mant);
            
            
        
        request.setAttribute("mensajeSalida","Solicitud de mantencion enviada");
        } catch (Exception ex) {
            
            request.setAttribute("mensajeSalida","No se pudo enviar la solicitud");
        }
        
>>>>>>> master
        response.sendRedirect("/MasterBike/ExitoSolman.jsp");
        
    }

    
<<<<<<< HEAD
}
=======

}
>>>>>>> master
