/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ControladorLogout", urlPatterns = {"/ControladorLogout"})
public class ControladorLogout extends HttpServlet {

    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Se recupera la Session para invalidarla
        HttpSession session = request.getSession();
        if (!session.isNew()) {
            session.invalidate();
            session = request.getSession();
        }        
        //Se redirige devuelta al login 
        response.sendRedirect("/MasterBike/Login.jsp");
        
    }

   
}
