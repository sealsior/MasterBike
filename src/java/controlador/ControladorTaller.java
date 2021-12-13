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
@WebServlet(name = "ControladorTaller", urlPatterns = {"/ControladorTaller"})
public class ControladorTaller extends HttpServlet {

    MantencionDAO manDAO = new MantencionDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    
            
        try{   
        String idMantencion = request.getParameter("txtId");
        String IdServicio = request.getParameter("txtServicio");
        String idUser = request.getParameter("txtIdUser");
        String comentario = request.getParameter("txtComentario");
        String retiro = request.getParameter("txtRetiro");
        String fechasol = request.getParameter("txtFechasol");
        String garantia = request.getParameter("txtGarantia");       
        String fechain = request.getParameter("txtFechaIn"); 
        String fechaout = request.getParameter("txtFechaOut"); 
        String valor = request.getParameter("txtValor");
        String estado = request.getParameter("txtEstado");
        String mail = request.getParameter("txtMail");
        
        Mantencion m = new Mantencion();
        Usuario user = new Usuario();
        Servicio serv = new Servicio();
        
            
        m.setIdMantencion(Long.parseLong(idMantencion));
       
        serv.setIdServicio(Long.parseLong(IdServicio));
        
        m.setServicio(serv);
        
        user.setIdUsuario(Long.parseLong(idUser));
       
        m.setUsuario(user);
        
        m.setComentarios(comentario);
        
            
        m.setRetirodomicilio(retiro.charAt(0));
        
        
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
           
        Date fechaDate = formato.parse(fechasol);
        m.setFecSolicitada(fechaDate);
        
       m.setGarantia(garantia);
            
       Date fechaDate2 = formato.parse(fechain);
       m.setFecingreso(fechaDate2);
       
         
       Date fechaDate3 = formato.parse(fechaout);
       m.setFecsalida(fechaDate3);
          
        m.setValortotal(Long.parseLong(valor));
        
        m.setEstadosolicitud(estado);
       
             
        manDAO.actualizarSP(m);
            
        
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
            
            try {

                SMTPMessage message = new SMTPMessage(s);
                message.setFrom(new InternetAddress("masterbike.chile@gmail.com"));
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(mail));

                message.setSubject("MasterBike | Cambio de estado de mantención id: " + idMantencion+ " de su bicicleta");
                message.setText("<Estimado cliente su solicitud ha cambiado de estado a " + estado  + ",\n"
                        + "Comentarios del Técnico: "+ comentario + ".\n"
                        + "para más información visite nuestro sitio web");
                message.setNotifyOptions(SMTPMessage.NOTIFY_SUCCESS);
                int returnOption = message.getReturnOption();
                System.out.println(returnOption);
                Transport.send(message);
                System.out.println("sent");

            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            
              
            
        
        request.setAttribute("mensajeSalida","Solicitud de mantencion enviada");
        } catch (Exception ex) {
            System.out.println(ex.getMessage());    
            request.setAttribute("mensajeSalida","No se pudo enviar la solicitud");
        }
        
        response.sendRedirect("/MasterBike/ListarSolicitudesMantenciones.jsp");
       
    }

     

}