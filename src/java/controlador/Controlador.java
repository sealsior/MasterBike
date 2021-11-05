/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import Config.Fecha;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Carrito;
import modelo.Producto1;
import DAO.ProductoDAO;
import DAO.VentaDAO;
import Model.Detalleventa;
import javax.servlet.http.HttpSession;
//import DAO.VentaDao;
//import config.Fecha;
import modelo.Compras;
import modelo.Pago;
import Model.Usuario;

/**
 *
 * @author Marco
 */
public class Controlador extends HttpServlet {
    //VentaDAO vdao= new VentaDAO();
    ProductoDAO pdao=new ProductoDAO();
    Producto1 p = new Producto1();
    List<Producto1> productos=new ArrayList<>();
   Usuario usuario= new Usuario();
   VentaDAO dao=new VentaDAO();
    List<Carrito> listaCarrito=new ArrayList<>();
    int item;
    long totalPagar=0;
    int cantidad=1;
    
    int idp;
    Carrito car;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accion=request.getParameter("accion");
        productos=pdao.listar();

        switch (accion){
            case "Comprar":
                totalPagar=0;
                idp=Integer.parseInt(request.getParameter("id"));
                p=pdao.listarId(idp);
                item=item+1;
                car=new Carrito();
                car.setItem(item);
                car.setIdProducto(p.getId());
                car.setNombres(p.getNombre());
                car.setDescripcion(p.getDescripcion());
                car.setPrecio(p.getValor());
                car.setCantidad(cantidad);
                car.setSubtotal(cantidad*p.getValor());
                listaCarrito.add(car);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPagar=totalPagar+listaCarrito.get(i).getSubtotal();
                }
                request.setAttribute("totalPagar", totalPagar);
                request.setAttribute("carrito", listaCarrito);
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                
                break;
            case "AgregarCarrito":
                int pos=0;
                cantidad=1;
                idp=Integer.parseInt(request.getParameter("id"));
                p=pdao.listarId(idp);
                if (listaCarrito.size()>0) {
                    for (int i = 0; i < listaCarrito.size(); i++) {
                        if (idp==listaCarrito.get(i).getIdProducto()) {
                           pos=i; 
                        }
                    }
                    if (idp==listaCarrito.get(pos).getIdProducto()) {
                        cantidad=listaCarrito.get(pos).getCantidad()+cantidad;
                        int subtotal=listaCarrito.get(pos).getPrecio()*cantidad;
                        listaCarrito.get(pos).setCantidad(cantidad);
                        listaCarrito.get(pos).setSubtotal(subtotal);
                        
                    }else{
                        item=item+1;
                        car=new Carrito();
                        car.setItem(item);
                        car.setIdProducto(p.getId());
                        car.setNombres(p.getNombre());
                        car.setDescripcion(p.getDescripcion());
                        car.setPrecio(p.getValor());
                        car.setCantidad(cantidad);
                        car.setSubtotal(cantidad*p.getValor());
                        listaCarrito.add(car);
                    }
                }else{
                        item=item+1;
                        car=new Carrito();
                        car.setItem(item);
                        car.setIdProducto(p.getId());
                        car.setNombres(p.getNombre());
                        car.setDescripcion(p.getDescripcion());
                        car.setPrecio(p.getValor());
                        car.setCantidad(cantidad);
                        car.setSubtotal(cantidad*p.getValor());
                        listaCarrito.add(car);
                }
                
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                
                
                break;
            case "Delete":
                int idproducto=Integer.parseInt(request.getParameter("idp"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if (listaCarrito.get(i).getIdProducto()==idproducto ){
                        listaCarrito.remove(i);
                    }
                }
                break;
            case "ActualizarCantidad":
                int idpro=Integer.parseInt(request.getParameter("idp"));
                int cant=Integer.parseInt(request.getParameter("Cantidad"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if (listaCarrito.get(i).getIdProducto()==idpro) {
                        listaCarrito.get(i).setCantidad(cant);
                        int st=listaCarrito.get(i).getPrecio()*cant;
                        listaCarrito.get(i).setSubtotal(st);
                    }
                }
                break;
                
            case "GenerarCompra":
                
                //Pago pago=new Pago();
                usuario = (Usuario) session.getAttribute("usuarioActivo");
                //VentaDAO dao=new VentaDAO();
                Compras compra= new Compras(usuario,Fecha.FechaBD(),totalPagar,"ACEPTADO", listaCarrito);
                int res=dao.GenerarCompra(compra);
                if (res!=0&&totalPagar>0) {
                    //request.getRequestDispatcher("VerCompras.jsp").forward(request, response);
                    //listaCarrito.clear();//se supone q vacia el carrito luego de comprar o erronear
                    
                    listaCarrito = new ArrayList<>();
                        List compraa = dao.findID(usuario.getIdUsuario());
                        request.setAttribute("myCompras", compraa);
                        request.getRequestDispatcher("VerCompras.jsp").forward(request, response);
                        listaCarrito.clear();
                        
                }else if(usuario==null){
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }else{
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                   
                }
                break;
            case "verDetalle":
                totalPagar = 0;
                long idcompras = Long.parseLong(request.getParameter("idcompra"));
                List<Detalleventa> detalle = dao.findIDDetalle(idcompras);
                request.setAttribute("myDetalle", detalle);
                for (int i = 0; i < detalle.size(); i++) {
                    totalPagar = totalPagar + (detalle.get(i).getPrecioventa()* detalle.get(i).getCantidad());
                }
                request.setAttribute("montoPagar", totalPagar);
                request.getRequestDispatcher("VerDetalleCompras.jsp").forward(request, response);
                break;
            case "MisCompras":
                usuario = (Usuario) session.getAttribute("usuarioActivo");
                if (usuario.getIdUsuario()!= 0) {
                    List compraa = dao.findID(usuario.getIdUsuario());
                    request.setAttribute("myCompras", compraa);
                    request.getRequestDispatcher("VerCompras.jsp").forward(request, response);
                } else if (listaCarrito.size() > 0) {
                    request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                } else {
                    request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                }
                break;
            case "Carrito":
                totalPagar=0;
                
                request.setAttribute("carrito", listaCarrito);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPagar=totalPagar+listaCarrito.get(i).getSubtotal();
                }
                request.setAttribute("totalPagar", totalPagar);
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                
                break;
            case "bicicletas":   
                
                request.getRequestDispatcher("Bicicletas.jsp").forward(request, response);
                break;
            default:
                
                
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
