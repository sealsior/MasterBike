/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UsuarioDAO;
import Model.Rol;
import Model.Usuario;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author baggr
 */
@Controller
public class UsuarioController {
    
    UsuarioDAO uDAO = new UsuarioDAO();
    
     @RequestMapping(value = "/Usuarios", method = RequestMethod.GET)
    public String cliente(Model model, HttpServletRequest request) {

        model.addAttribute("Usuarios", uDAO.listarUsuarios());
        return "Usuarios";
    }
    
    
    @RequestMapping(value = "/crear-usuario", method = RequestMethod.GET)
    public String crearUsuario(Model model, HttpServletRequest request) {

        return "crear-usuario";
    }
    
    @RequestMapping(value = "/crear-usuario", method = RequestMethod.POST)
    public String crearUsuarioPost(Model model,
            @RequestParam("txtPassword") String password,
            @RequestParam("txtUsuario") String username,
            @RequestParam("txtPnombre") String pnombre,
            @RequestParam("txtAppaterno") String appaterno,
            @RequestParam("txtApmaterno") String apmaterno,
            @RequestParam("txtEmailusuario") String email,
            @RequestParam("txtRutusuario") String rut,
            @RequestParam("txtFechanac") String fechanac,
            @RequestParam("txtDireccion") String direccion,
            @RequestParam("txtNumtelefono") int telefono,
       
            HttpServletRequest request,
            RedirectAttributes ra) {
        
        Usuario user = new Usuario();
        Rol rolito = new Rol();
        rolito.setIdRol(BigDecimal.ONE);
        user.setRol(rolito);
        user.setPassword(password);
        user.setPnombre(pnombre);
        user.setAppaterno(appaterno);
        user.setApmaterno(apmaterno);
        user.setEmailUsuario(email);
        user.setRutUsuario(rut);
        user.setFechanac(new Date());;
        user.setDireccionUsuario(direccion);
        user.setNumtelefono(telefono);
      

        uDAO.ingresarSP(user);
        
        ra.addFlashAttribute("mensajeAtencion", "El registro se almaceno correctamente");
        
            return "redirect:usuarios";

    }
    
}
