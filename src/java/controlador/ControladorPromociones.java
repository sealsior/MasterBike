/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.UsuarioDAO;
import Model.Usuario;
import com.sun.mail.smtp.SMTPMessage;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
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
@WebServlet(name = "ControladorPromociones", urlPatterns = {"/ControladorPromociones"})
public class ControladorPromociones extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String convenio = request.getParameter("cboTipoCliente");
        String mensaje = request.getParameter("txtDetalle");
    
      
        Usuario user = new Usuario();
        UsuarioDAO uDAO = new UsuarioDAO();
        List<Usuario> lstUsuario = new ArrayList<>();
        
        
        lstUsuario = uDAO.findPorConvenio(convenio);
                

                    
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.socketFactory.port", "587");
            props.put("mail.smtp.socketFactory.class",
                    "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "805");

            Session s = Session.getInstance(props, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("masterbike.chile@gmail.com", "masterbike2021");
                }
            });

            
                for(Usuario usu : lstUsuario ){
                    try {
                    SMTPMessage message = new SMTPMessage(s);
                message.setFrom(new InternetAddress("masterbike.chile@gmail.com"));
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(usu.getEmailUsuario()));
 
                message.setSubject("Masterbike | Promoción para clientes " + convenio);
                message.setText(mensaje.replaceAll("CLIENTE", usu.getNombre()));
                message.setNotifyOptions(SMTPMessage.NOTIFY_SUCCESS);
                int returnOption = message.getReturnOption();
                System.out.println(returnOption);
                Transport.send(message);
                System.out.println("sent");
                
                } catch (MessagingException e) {
                        System.out.println(e.getMessage());
                        System.out.println("No fue posible enviar correo a la casilla: " + usu.getEmailUsuario());
            } 

                }

                
            response.sendRedirect("/MasterBike/EnviarPromocion.jsp");

        }

    }