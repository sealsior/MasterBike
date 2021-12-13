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
import java.math.BigInteger;
import java.security.MessageDigest;
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
@WebServlet(name = "ControladorModificarUsuario", urlPatterns = {"/ControladorModificarUsuario"})
public class ControladorModificarUsuario extends HttpServlet {
    
    UsuarioDAO uDAO = new UsuarioDAO();

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
        String idUsuario = request.getParameter("txtId");
        String email = request.getParameter("txtEmailusuario");
        String password = request.getParameter("txtPassword");
        String nombre = request.getParameter("txtNombre");
        String apellidos = request.getParameter("txtApellidos");
        String rut = request.getParameter("txtRutusuario");
        String fechanac = request.getParameter("txtFechanac");
        String direccion = request.getParameter("txtDireccion");
        String telefono = request.getParameter("txtNumtelefono");
        String convenio = request.getParameter("txtConvenio");
        String rolcito = request.getParameter("cboRol");
        
        Usuario u = new Usuario();
        Rol rolito = new Rol();
        
        u.setIdUsuario(Long.parseLong(idUsuario));
        u.setEmailUsuario(email);
        u.setPassword(getMD5(password) );
        u.setNombre(nombre);
        u.setApellidos(apellidos);
        u.setRutUsuario(rut);
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaDate = formato.parse(fechanac);
        u.setFechanac(fechaDate);
        u.setDireccionUsuario(direccion);
        u.setNumtelefono(Integer.parseInt(telefono));
        u.setConvenio(convenio);
        
        BigDecimal bigDecimal = new BigDecimal(rolcito);
        rolito.setIdRol(bigDecimal);
        u.setRol(rolito);
        
        uDAO.actualizarSP(u);
        
        
         request.setAttribute("mensajeSalida","Solicitud de mantencion enviada");
        } catch (Exception ex) {
            System.out.println(ex.getMessage());    
            request.setAttribute("mensajeSalida","No se pudo enviar la solicitud");
        }
        
        
        
        response.sendRedirect("/MasterBike/ListarUsuarios.jsp");
        
    
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
