/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.UsuarioDAO;
import Model.Rol;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
 * @author baggr
 */
@WebServlet(name = "ControladorUsuario", urlPatterns = {"/ControladorUsuario"})
public class ControladorUsuario extends HttpServlet {


  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("test doget");
      
    }

    UsuarioDAO uDAO = new UsuarioDAO();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("txtEmailusuario");
        String passwd = request.getParameter("txtPassword");
        String pnombre = request.getParameter("txtPnombre");
        String apaterno = request.getParameter("txtAppaterno");
        String amaterno = request.getParameter("txtApmaterno");
        String rut = request.getParameter("txtRutusuario");
        String fechanac = request.getParameter("txtFechanac");
        String direccion = request.getParameter("txtDireccion");
        String telefono = request.getParameter("txtNumtelefono");
        

        Usuario user = new Usuario();
        Rol rolito = new Rol();
        
        rolito.setIdRol(BigDecimal.ONE);
        user.setRol(rolito);
        user.setEmailUsuario(email);
        user.setPassword(passwd);
        user.setPnombre(pnombre);
        user.setAppaterno(apaterno);
        user.setApmaterno(amaterno);
        user.setRutUsuario(rut);
        user.setDireccionUsuario(direccion);
        user.setNumtelefono(Integer.parseInt(telefono));

        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        
        try {
            Date fechaDate = formato.parse(fechanac);
            user.setFechanac(fechaDate);
        } catch (ParseException ex) {
        }
        
        

          uDAO.ingresarSP(user);
//
//        ra.addFlashAttribute("mensajeAtencion", "El registro se almaceno correctamente");
        
        response.sendRedirect("/MasterBike/RegistroUsuario.jsp");
  
    }

    
}
