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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author baggr
 */
@WebServlet(name = "ControladorListarMantencionesTaller", urlPatterns = {"/ControladorListarMantencionesTaller"})
public class ControladorListarMantencionesTaller extends HttpServlet {
    
      
    String edit="Taller.jsp";
    String listar="ListaSolicitudesMantenciones.jsp";
    long id;
    
    MantencionDAO manDAO = new MantencionDAO();
   
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
               
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acceso="";
        String action= request.getParameter("accion");
        System.out.println(action);
        
        String accionLimpia = action.split("-")[0];
        String id = action.split("-")[1];
        
        if (accionLimpia.equalsIgnoreCase("aprobar")) {
           Mantencion m = manDAO.find(id).get(0);
            System.out.println(m.toString());
           request.setAttribute("mantencion", m);
        request.getRequestDispatcher("/Taller.jsp").forward(request, response);
           
            
        
        
//        }else if(action.equalsIgnoreCase("eliminar")){
//            Mantencion m = new Mantencion();
//            =Integer.parseInt(request.getParameter("id"));
//            m.setIdMantencion(id);
//            manDAO.eliminarSP(m);
//            acceso=listar;
//        
//        }
//        
       
    }
    }
}

   


