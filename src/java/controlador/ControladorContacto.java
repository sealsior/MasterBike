/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.sun.mail.smtp.SMTPMessage;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 *
 * @author baggr
 */
@WebServlet(name = "ControladorContacto", urlPatterns = {"/ControladorContacto"})
public class ControladorContacto extends HttpServlet {

        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    
            
        try{   
        String tipoMensaje = request.getParameter("cboTipo");
        String nombre = request.getParameter("txtNombre");
        String mail = request.getParameter("txtMail");
        String comentario = request.getParameter("txtComentario");
        
           
                  
        
        Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.socketFactory.port", "587");
            props.put("mail.smtp.socketFactory.class",
                    "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");

            Session s = Session.getInstance(props, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("masterbike.chile@gmail.com", "masterbike2021");
                }
            });
            
            try {

                SMTPMessage message = new SMTPMessage(s);
                message.setFrom(new InternetAddress("masterbike.chile@gmail.com"));
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse("masterbike.chile@gmail.com"));

                message.setSubject(tipoMensaje + " desde formulario web, cliente: "+ nombre);
                message.setText("Contacto: " + mail  + "\n"
                        + "Nombre cliente: "+ nombre + ".\n"
                        + "Mensaje: "+ comentario + ".");
                message.setNotifyOptions(SMTPMessage.NOTIFY_SUCCESS);
                int returnOption = message.getReturnOption();
                System.out.println(returnOption);
                Transport.send(message);
                System.out.println("sent");

            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            
              
            
            System.out.println("Mansaje enviado");
        request.setAttribute("mensajeSalida","Mansaje enviado");
        } catch (Exception ex) {
            System.out.println(ex.getMessage());    
            System.out.println("Mansaje no enviado");
            request.setAttribute("mensajeSalida","No se pudo enviar mensaje");
        }
        
        response.sendRedirect("/MasterBike/inicio.jsp");
       
    }

     

}
