/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.SolicitudarriendoDAO;
import Model.Solicitudarriendo;
import Model.Usuario;
import java.io.IOException;
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
@WebServlet(name = "ControladorActualizarArriendo", urlPatterns = {"/ControladorActualizarArriendo"})
public class ControladorActualizarArriendo extends HttpServlet {

    SolicitudarriendoDAO saDAO = new SolicitudarriendoDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
     
        Solicitudarriendo solarr = new Solicitudarriendo();
        Usuario user = new Usuario();  
       
      String idArriendo = request.getParameter("txtIdArriendo");  
      String tipobici = request.getParameter("txtTipoBicicleta");
      String usuario = request.getParameter("txtUsuario");
      String fecini = request.getParameter("txtFecini");
      String fecfin = request.getParameter("txtFecfin");
      String formapago = request.getParameter("txtFormaPago");
      String garantia = request.getParameter("txtGarantia");
      String estado = request.getParameter("txtEstado");
      
      solarr.setIdSolArriendo(Long.parseLong(idArriendo));
      solarr.setTipobicicleta(tipobici);
      
      user.setIdUsuario(Long.parseLong(usuario));
      solarr.setUsuario(user);
      
      SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        
     try {
         Date fechaDate = formato.parse(fecini);
         solarr.setFeciniArriendo(fechaDate);
     } catch (ParseException ex) {
     }
     
      try {
         Date fechaDate = formato.parse(fecfin);
         solarr.setFecfinArriendo(fechaDate);
     } catch (ParseException ex) {
     }
        
      solarr.setFormapagoArri(formapago);
      solarr.setDepositogarantia(Integer.parseInt(garantia));
      solarr.setEstado(estado);
      
      
      
      saDAO.actualizarSP(solarr);
      
      response.sendRedirect("/MasterBike/ListarSolicitudesArriendo.jsp");
      
    }
        
    

    

}
