/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;


import DAO.UsuarioDAO;
import Model.Usuario;
 
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;



/**
 *
 * @author baggr
 */
@WebServlet(name = "ControladorListarUsuarios", urlPatterns = {"/ControladorListarUsuarios"})
public class ControladorListarUsuarios extends HttpServlet {

    UsuarioDAO uDAO = new UsuarioDAO();
    Usuario user = new Usuario();
    
    String edit="ModificarUsuario.jsp";
    String listar="ListarUsuarios.jsp";
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
           Usuario u = uDAO.findPorId(id).get(0);
            System.out.println(u.toString());
           request.setAttribute("usuario", u);
        request.getRequestDispatcher("/ModificarUsuario.jsp").forward(request, response);
        
    }
    }
    
   
        
}

