<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
result.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id"); 
	String sid = (String)session.getAttribute("id"); 
	String passwd = request.getParameter("passwd"); 
	String spasswd = (String)session.getAttribute("passwd");
	String sport = request.getParameter("sport"); 
	String game = request.getParameter("game"); 
	
	session.invalidate();//세션 설정 무효화 //result.jsp 오면 모두 무효화 
	//로그아웃 버튼 클릭하면 로그아웃되도록 할 때 사용
%>

아이디 : <%=id %><br>
아이디2 : <%=sid %> <br>
비밀번호 : <%=passwd %><br>
비밀번호2 : <%=spasswd %><br>
스포츠 : <%= sport %><br>
게임 : <%= game %><br>

<!-- null : session 이름 없을 때 -->