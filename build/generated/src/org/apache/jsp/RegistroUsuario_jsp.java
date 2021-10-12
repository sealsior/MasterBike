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
      out.write("        <title>Registro de usuarios</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <form action=\"");
      if (_jspx_meth_c_url_0(_jspx_page_context))
        return;
      out.write("\" method=\"post\">\r\n");
      out.write("          \r\n");
      out.write("            <label>Email usuario:</label>\r\n");
      out.write("            <input type=\"text\" name=\"txtEmailusuario\" id=\"txtEmailusuario\" />\r\n");
      out.write("            <br>\r\n");
      out.write("            <label>Password </label>\r\n");
      out.write("            <input type=\"password\" name=\"txtPassword\" id=\"txtPassword\" />\r\n");
      out.write("            <br>\r\n");
      out.write("            <label>Primer nombre:</label>\r\n");
      out.write("            <input type=\"text\" name=\"txtPnombre\" id=\"txtPnombre\"/>\r\n");
      out.write("            <br>\r\n");
      out.write("            <label>Apellido paterno:</label>\r\n");
      out.write("            <input type=\"text\" name=\"txtAppaterno\" id=\"txtAppaterno\"/>\r\n");
      out.write("            <br>\r\n");
      out.write("            <label>Apellido materno:</label>\r\n");
      out.write("            <input type=\"text\" name=\"txtApmaterno\" id=\"txtApmaterno\"/>\r\n");
      out.write("            <br>\r\n");
      out.write("            <label>Rut:</label>\r\n");
      out.write("            <input type=\"text\" name=\"txtRutusuario\" id=\"txtRutusuario\"/>\r\n");
      out.write("            <br>\r\n");
      out.write("            <label>Fecha nacimiento:</label>\r\n");
      out.write("            <input type=\"date\" name=\"txtFechanac\" id=\"txtFechanac\"/>\r\n");
      out.write("            <br>\r\n");
      out.write("            <label>Direccion:</label>\r\n");
      out.write("            <input type=\"text\" name=\"txtDireccion\" id=\"txtDireccion\"/>\r\n");
      out.write("            <br>\r\n");
      out.write("            <label>Telefono:</label>\r\n");
      out.write("            <input type=\"number\" name=\"txtNumtelefono\" id=\"txtNumtelefono\"/>\r\n");
      out.write("            <br>\r\n");
      out.write("            <input type=\"submit\" value=\"Registro Usuario\" />\r\n");
      out.write("            \r\n");
      out.write("        </form>\r\n");
      out.write("    </body>\r\n");
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
