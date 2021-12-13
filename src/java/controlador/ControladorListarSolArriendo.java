 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.SolicitudarriendoDAO;
import Model.Solicitudarriendo;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author baggr
 */
@WebServlet(name = "ControladorListarSolArriendo", urlPatterns = {"/ControladorListarSolArriendo"})
public class ControladorListarSolArriendo extends HttpServlet {
    
    SolicitudarriendoDAO solarrDAO = new SolicitudarriendoDAO();
    Solicitudarriendo solarr = new Solicitudarriendo();
    
    String edit="ModificarSolArriendo.jsp";
    String listar="ListarSolicitudesArriendo.jsp";
    long id;

   
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
           Solicitudarriendo s = solarrDAO.findPorId(id).get(0);
            System.out.println(s.toString());
           request.setAttribute("solicitudarriendo", s);
        request.getRequestDispatcher("/ModificarSolArriendo.jsp").forward(request, response);
        
    }
        
    }

    

}
