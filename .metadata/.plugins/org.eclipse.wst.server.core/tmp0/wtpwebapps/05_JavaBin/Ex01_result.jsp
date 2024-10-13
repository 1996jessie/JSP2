<%@page import="myPkg.Simple"%><!-- import -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_result.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	String message = request.getParameter("message"); 
%>

메세지 : <%=message%><br>

<%
	/* Java 객체 */
	Simple s = new Simple();
	//myPkg.Simple s = new myPkg.Simple(); //매번 쓰기 힘드니까 import 함
	s.setMsg(message);
	String m = s.getMsg();
	System.out.println(m);
%>

	<!-- JSP 객체 
	Simple s2 = new Simple();
	String msg = request.getParameter("msg");
	s2.setMsg(message);
	s2.getMsg();
	-->
<!-- 액션태그 : jsp:forward,include,param -->
<!-- useBean, setProperty, getProperty -->
<!-- 위에 써둔 import는 반영되지 않음. 무조건 class = 뒤에 import해야 함 -->
<!-- property = "소문자" (자동으로 대문자로 바뀜) :메서드 이름 -->
<!-- param : form의 name/property = param이면 param 생략 가능 -->
<!-- jsp:setProperty name="s2" property="msg"/ -->
<!-- message에 담겨서 온 글자를 setProperty로 넘김 -->
<!-- value : setter 메서드로 가나다라 를 보냄(form에서 보내는 값이 있지만 무조건 가나다라로 넣겠다) 
	param 과 value를 다 쓰면 에러(둘 중 하나만 써야 함)
-->
<jsp:useBean id="s2" class="myPkg.Simple"> 
	<jsp:setProperty name="s2" property="msg" param="msg" value="가나다라"/>
</jsp:useBean>

메세지2 : <jsp:getProperty name="s2" property="msg"/>