package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class RegistroUsuario_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_url_value_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_url_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_url_value_nobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("         <!-- Bootstrap CSS -->\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\" integrity=\"sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z\" crossorigin=\"anonymous\">\r\n");
      out.write(" \r\n");
      out.write("        <style>     \r\n");
      out.write("        .container {\r\n");
      out.write("                 border: 5px outset black;\r\n");
      out.write("                 background-color: aquamarine;\r\n");
      out.write("                 text-align: center;\r\n");
      out.write("                }\r\n");
      out.write("        \r\n");
      out.write("        </style>\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        <title>Registro de usuarios</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"container pt-5\">\r\n");
      out.write("            <h1>Ingresa tus datos</h1>\r\n");
      out.write("        <form action=\"");
      if (_jspx_meth_c_url_0(_jspx_page_context))
        return;
      out.write("\" class=\"needs-validation\" method=\"post\">\r\n");
      out.write("          \r\n");
      out.write("            <div class=\"mb-3 mt-3\">\r\n");
      out.write("            <label for=\"txtEmailusuario\" class=\"form-label\" >Email usuario:</label>\r\n");
      out.write("            <input type=\"text\" name=\"txtEmailusuario\" id=\"txtEmailusuario\" class=\"form-control\" placeholder=\"Ingresar email\" required />\r\n");
      out.write("            <div class=\"valid-feedback\">Valido.</div>\r\n");
      out.write("            <div class=\"invalid-feedback\">Por favor llene este campo.</div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"mb-3\">\r\n");
      out.write("            <label for=\"txtPassword\" class=\"form-label\">Password:</label>\r\n");
      out.write("            <input type=\"password\" name=\"txtPassword\" id=\"txtPassword\" class=\"form-control\" placeholder=\"Ingresar password\" required />\r\n");
      out.write("            <div class=\"valid-feedback\">Valido.</div>\r\n");
      out.write("            <div class=\"invalid-feedback\">Por favor llene este campo.</div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"mb-3\">\r\n");
      out.write("            <label for=\"txtnombre\" class=\"form-label\">Primer nombre:</label>\r\n");
      out.write("            <input type=\"text\" name=\"txtPnombre\" id=\"txtPnombre\" class=\"form-control\" placeholder=\"Ingresar nombre\" required/>\r\n");
      out.write("            <div class=\"valid-feedback\">Valido.</div>\r\n");
      out.write("            <div class=\"invalid-feedback\">Por favor llene este campo.</div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"mb-3\">\r\n");
      out.write("            <label for=\"txtAppaterno\" class=\"form-label\">Apellido paterno:</label>\r\n");
      out.write("            <input type=\"text\" name=\"txtAppaterno\" id=\"txtAppaterno\" class=\"form-control\" placeholder=\"Ingresar apellido paterno\" required/>\r\n");
      out.write("            <div class=\"valid-feedback\">Valido.</div>\r\n");
      out.write("            <div class=\"invalid-feedback\">Por favor llene este campo.</div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"mb-3\">\r\n");
      out.write("            <label for=\"txtApmaterno\" class=\"form-label\">Apellido materno:</label>\r\n");
      out.write("            <input type=\"text\" name=\"txtApmaterno\" id=\"txtApmaterno\" class=\"form-control\" placeholder=\"Ingresar apellido materno\" required/>   \r\n");
      out.write("            <div class=\"valid-feedback\">Valido.</div>\r\n");
      out.write("            <div class=\"invalid-feedback\">Por favor llene este campo.</div>    \r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"mb-3\">\r\n");
      out.write("            <label for=\"txtRutusuario\" class=\"form-label\">Rut:</label>\r\n");
      out.write("            <input type=\"text\" name=\"txtRutusuario\" id=\"txtRutusuario\" class=\"form-control\" placeholder=\"Ingresar rut\" required/>\r\n");
      out.write("            <div class=\"valid-feedback\">Valido.</div>\r\n");
      out.write("            <div class=\"invalid-feedback\">Por favor llene este campo.</div>    \r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"mb-3\">\r\n");
      out.write("            <label for=\"txtFechanac\" class=\"form-label\">Fecha nacimiento:</label>\r\n");
      out.write("            <input type=\"date\" name=\"txtFechanac\" id=\"txtFechanac\" class=\"form-control\" placeholder=\"Ingresar fecha\" required/>\r\n");
      out.write("            <div class=\"valid-feedback\">Valido.</div>\r\n");
      out.write("            <div class=\"invalid-feedback\">Por favor llene este campo.</div>    \r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"mb-3\">\r\n");
      out.write("            <label for=\"txtDireccion\" class=\"form-label\">Direccion:</label>\r\n");
      out.write("            <input type=\"text\" name=\"txtDireccion\" id=\"txtDireccion\" class=\"form-control\" placeholder=\"Ingresar direccion\" required/>\r\n");
      out.write("            <div class=\"valid-feedback\">Valido.</div>\r\n");
      out.write("            <div class=\"invalid-feedback\">Por favor llene este campo.</div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"mb-3\">\r\n");
      out.write("            <label for=\"txtNumtelefono\" class=\"form-label\">Telefono:</label>\r\n");
      out.write("            <input type=\"number\" name=\"txtNumtelefono\" id=\"txtNumtelefono\" class=\"form-control\" placeholder=\"Ingresar telefono\" required/>\r\n");
      out.write("            <div class=\"valid-feedback\">Valido.</div>\r\n");
      out.write("            <div class=\"invalid-feedback\">Por favor llene este campo.</div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"form-check mb-3\">\r\n");
      out.write("             <input class=\"form-check-input\" type=\"checkbox\" id=\"myCheck\" name=\"remember\" required>\r\n");
      out.write("             <label class=\"form-check-label\" for=\"myCheck\">Estoy de acuerdo con los terminos y condiciones</label>\r\n");
      out.write("             <div class=\"valid-feedback\">Valido.</div>\r\n");
      out.write("             <div class=\"invalid-feedback\">Selecciona esto para continuar.</div>\r\n");
      out.write("             </div>\r\n");
      out.write("             \r\n");
      out.write("            <button type=\"submit\" class=\"btn btn-primary\">Registrar usuario</button>\r\n");
      out.write("                       \r\n");
      out.write("        </form>\r\n");
      out.write("        </div>\r\n");
      out.write("    <!-- JavaScript -->\r\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\" integrity=\"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js\" integrity=\"sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\" integrity=\"sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("  </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_url_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_url_0 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _jspx_tagPool_c_url_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_url_0.setPageContext(_jspx_page_context);
    _jspx_th_c_url_0.setParent(null);
    _jspx_th_c_url_0.setValue("/ControladorUsuario");
    int _jspx_eval_c_url_0 = _jspx_th_c_url_0.doStartTag();
    if (_jspx_th_c_url_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_url_value_nobody.reuse(_jspx_th_c_url_0);
      return true;
    }
    _jspx_tagPool_c_url_value_nobody.reuse(_jspx_th_c_url_0);
    return false;
  }
}
