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
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "ControladorArriendo", urlPatterns = {"/ControladorArriendo"})
public class ControladorArriendo extends HttpServlet {

    
    SolicitudarriendoDAO saDAO = new SolicitudarriendoDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Solicitudarriendo solarr = new Solicitudarriendo();
        Usuario user = new Usuario();
        
        
      String tipobici = request.getParameter("cboTipoBicicleta");
      String fecini = request.getParameter("txtFecini");
      String fecfin = request.getParameter("txtFecfin");
      String fomapago = request.getParameter("cboFormaPago");
      String garantia = request.getParameter("txtGarantia");
//      String estado = request.getParameter("txtEstado");
      
      solarr.setTipobicicleta(tipobici);
      
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
        
      solarr.setFormapagoArri(fomapago);
      solarr.setDepositogarantia(Integer.parseInt(garantia));
      solarr.setEstado("Pendiente");
      
      user = (Usuario) session.getAttribute("usuarioActivo");
      solarr.setUsuario(user);
//      solarr.setUsuario(user);
      
      saDAO.ingresarSP(solarr);
      
      response.sendRedirect("/MasterBike/ExitoSolman.jsp");
      
    }

 

}
