/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.RolDAO;
import DAO.UsuarioDAO;
import Model.Rol;
import Model.Servicio;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author baggr
 */
@WebServlet(name = "ControladorCrearUsuario", urlPatterns = {"/ControladorCrearUsuario"})
public class ControladorCrearUsuario extends HttpServlet {
    
    UsuarioDAO uDAO = new UsuarioDAO();
    RolDAO rDAO = new RolDAO();
   
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Rol> listaRoles = rDAO.listarRoles();
        
        request.setAttribute("roles", listaRoles);
        request.getRequestDispatcher("/CrearUsuario.jsp").forward(request, response);
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("txtEmailusuario");
        String passwd = request.getParameter("txtPassword");
        String nombre = request.getParameter("txtNombre");
        String apellidos = request.getParameter("txtApellidos");
        String rut = request.getParameter("txtRutusuario");
        String fechanac = request.getParameter("txtFechanac");
        String direccion = request.getParameter("txtDireccion");
        String telefono = request.getParameter("txtNumtelefono");
        String convenio = request.getParameter("cboConvenio");
        String idRol = request.getParameter("cboRol");
        
        List<Usuario> lstBusquedaUsuario = uDAO.find(email);
        
        if(lstBusquedaUsuario.isEmpty()){
        Rol rolito = new Rol();
        Usuario user = new Usuario();
        
        BigDecimal bigDecimal = new BigDecimal(idRol);
        rolito.setIdRol(bigDecimal);
        user.setRol(rolito);
        user.setEmailUsuario(email);
        user.setPassword(getMD5(passwd) );
        user.setNombre(nombre);
        user.setApellidos(apellidos);
        user.setRutUsuario(rut);
        user.setDireccionUsuario(direccion);
        user.setNumtelefono(Integer.parseInt(telefono));
        user.setConvenio(convenio);

        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        
        try {
            Date fechaDate = formato.parse(fechanac);
            user.setFechanac(fechaDate);
        } catch (ParseException ex) {
        }
        
        uDAO.ingresarSP(user);
                
        response.sendRedirect("ListarUsuarios.jsp");
        }else {
            request.setAttribute("errorUsuario", "El email ingresado ya se encuentra registrado");
            request.getRequestDispatcher("/ErrorCreacionUsuario.jsp").forward(request, response);
            
        }
  
        
        
    }
        
        
        public String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] encBytes = md.digest(input.getBytes());
            BigInteger numero = new BigInteger(1, encBytes);
            String encString = numero.toString(16);
            while (encString.length() < 32) {
                encString = "0" + encString;
            }
            return encString;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    

 

}