/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

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

        model.addAttribute("usuarios", uDAO.listarUsuarios());
        return "Usuarios";
    }


//    @RequestMapping(value = "/crear-usuario", method = RequestMethod.GET)
//    public String crearUsuario(Model model, HttpServletRequest request) {
//
//        return "crear-usuario";
//    }

    @RequestMapping(value = "/registro-usuario", method = RequestMethod.POST)
    public String crearUsuario(Model model,
            @RequestParam("txtEmailusuario") String email,
            @RequestParam("txtPassword") String password,
            @RequestParam("txtPnombre") String pnombre,
            @RequestParam("txtAppaterno") String appaterno,
            @RequestParam("txtApmaterno") String apmaterno,
            @RequestParam("txtRutusuario") String rut,
            @RequestParam("txtFechanac") String fechanac,
            @RequestParam("txtDireccion") String direccion,
            @RequestParam("txtNumtelefono") int telefono,

            HttpServletRequest request,
            RedirectAttributes ra) {

        System.out.println("Test");
        String mensaje = "";

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

        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");

        try {
             Date fechaDate = formato.parse(fechanac);

             //Validar si la fecha de nacimiento  es menor a la fecha actual
             if(fechaDate.before(new Date()))
             {

                mensaje = mensaje+"La fecha de seleccion no puede ser mayor a la fecha actual<br>";
             }
            user.setFechanac(fechaDate);
        } catch (ParseException ex) {

        }

//        user.setFechanac(fechanac);;
        user.setDireccionUsuario(direccion);
        user.setNumtelefono(telefono);






        uDAO.ingresarSP(user);

        ra.addFlashAttribute("mensajeAtencion", "El registro se almaceno correctamente");

            return "redirect:RegistroUsuario";

    }

}
