/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.UsuarioDAO;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
<<<<<<< HEAD
import java.math.BigInteger;
import java.security.MessageDigest;
=======
>>>>>>> master
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "ControladorLogin", urlPatterns = {"/ControladorLogin"})
public class ControladorLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UsuarioDAO loginDao;

    public void init() {
        loginDao = new UsuarioDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.sendRedirect("Login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    
        HttpSession session = request.getSession();
        Map<String, String> mapMensajes = new HashMap<>();

        Usuario usu = new Usuario();
        String mail = request.getParameter("mail");
        if (mail.isEmpty()) {
            mapMensajes.put("Usuario", "Debe Ingresar email de Usuario!!");

        } else {

            usu.setEmailUsuario(mail);
        }

<<<<<<< HEAD
        String pass = request.getParameter("txtPassword");
=======
        String pass = request.getParameter("password");
>>>>>>> master
        if (pass.isEmpty()) {
            mapMensajes.put("Password", "Debe Ingresar contraseña!!");
        } else {
            usu.setPassword(pass);
        }

        if (mapMensajes.size() == 0) {
            UsuarioDAO usuDAO = new UsuarioDAO();
            List<Usuario> usuario = usuDAO.find(mail);
            Usuario BDuser = new Usuario();

            for (Usuario user : usuario) {

                BDuser.setEmailUsuario(user.getEmailUsuario());
<<<<<<< HEAD
                BDuser.setNombre(user.getNombre());
=======
                BDuser.setPnombre(user.getPnombre());
>>>>>>> master
                BDuser.setPassword(user.getPassword());
                BDuser.setRol(user.getRol());
                BDuser.setRutUsuario(user.getRutUsuario());
                BDuser.setIdUsuario(user.getIdUsuario());
<<<<<<< HEAD
                BDuser.setApellidos(user.getApellidos());
                BDuser.setConvenio(user.getConvenio());
=======
                BDuser.setAppaterno(user.getApmaterno());
                BDuser.setApmaterno(user.getApmaterno());
>>>>>>> master
                BDuser.setFechanac(user.getFechanac());
                BDuser.setDireccionUsuario(user.getDireccionUsuario());
                BDuser.setNumtelefono(user.getNumtelefono());
                
                

            }
       
          
               
            try {
<<<<<<< HEAD
                if (BDuser.getEmailUsuario().equalsIgnoreCase(mail) && BDuser.getPassword().equals(getMD5(pass))) {
=======
                if (BDuser.getEmailUsuario().equalsIgnoreCase(mail) && BDuser.getPassword().equals(pass)) {
>>>>>>> master
                    //Definir Perfil
               String perfilStr =  BDuser.getRol().getNombre();
               int perf=0;
               
              switch(perfilStr){
                  case "Cliente":perf=1;
                      break;
                  case "Vendedor":perf=2;
                      break;
                  case "Tecnico":perf=3;   
                      break;
                  case "Supervisor":perf=4;
                      break;
<<<<<<< HEAD
                  case "Bodeguero":perf=5;
=======
                  case "Proveedor":perf=5;
>>>>>>> master
                      break;
                                     
                  default: perf=0;
                      break;
              }
                    
                    System.out.println(BDuser.toString());
                    session.setAttribute("usuarioActivo", BDuser);
                    session.setAttribute("perfil", perf);
                    response.sendRedirect("/MasterBike/ExitoLogin.jsp");
                } else {
                    session.setAttribute("estado", "Usuario y/o Contraseña Incorrectos");                   
                    response.sendRedirect("/MasterBike/Login.jsp");
                }
            } catch (Exception e) {
               session.setAttribute("estado", "Usuario y/o Contraseña no encontrados");               
                response.sendRedirect("/MasterBike/Login.jsp");
            }

       
        } else {
            session.setAttribute("estado", "Debe ingresar Contraseña y Correo para continuar");
            response.sendRedirect("/MasterBike/Login.jsp");
        }

        
        
    }

   
<<<<<<< HEAD
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
=======

>>>>>>> master

}
