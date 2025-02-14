/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.86
 * Generated at: 2024-03-28 07:18:29 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp._04_005fsession;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class via_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(3);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("via.jsp<br>\r\n");
      out.write("\r\n");

	String id = request.getParameter("id"); 
	String passwd = request.getParameter("passwd"); 
	
	session.setAttribute("id", id); //넘어온 id를 id 이름으로 설정
	/* session : HttpSession session(내장객체)의 참조변수 */
	session.setAttribute("passwd", passwd);
	session.setMaxInactiveInterval(10); //10초동안만 정보 유지된다(그 이후엔 사라짐)
	

      out.write("\r\n");
      out.write("\r\n");
      out.write("아이디 : ");
      out.print(id );
      out.write("<br>\r\n");
      out.write("비밀번호 : ");
      out.print(passwd );
      out.write("<br>\r\n");
      out.write("\r\n");
      out.write("<h2>Session내장객체 예제</h2> \r\n");
      out.write("<form method = \"post\" action = \"result.jsp\"> \r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write(" <!-- result.jsp로 넘기고 싶으면 폼 안에 value로 집어넣어야 함 --> \r\n");
      out.write("\r\n");
      out.write("☆가장 좋아하는 스포츠를 선택하세요.☆<br>\r\n");
      out.write("<input type = \"radio\" name = \"sport\" value = \"태권도\">태권도\r\n");
      out.write("<input type = \"radio\" name = \"sport\" value = \"유도\">유도\r\n");
      out.write("<input type = \"radio\" name = \"sport\" value = \"프로레슬링\">프로레슬링\r\n");
      out.write("<input type = \"radio\" name = \"sport\" value = \"이종격투기\">이종격투기\r\n");
      out.write("<br><br>\r\n");
      out.write("☆가장 좋아하는 게임를 선택하세요.☆<br>\r\n");
      out.write("<select name = \"game\">\r\n");
      out.write("	<option value = \"카트라이더\">카트라이더</option>\r\n");
      out.write("	<option value = \"피파\">피파</option>\r\n");
      out.write("	<option value = \"롤\">롤</option>\r\n");
      out.write("</select>\r\n");
      out.write("<input type = \"submit\" value= \"전송\">\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("<!-- \r\n");
      out.write("request : 요청할 때마다 매번 객체 만들어짐\r\n");
      out.write("session : 웹브라우저 당 객체 1개만 만들어짐 \r\n");
      out.write("-->");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
