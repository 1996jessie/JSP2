<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
writeProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id = "bb" class = "board.BoardBean">
	<jsp:setProperty name = "bb" property="*"/>
</jsp:useBean>

<%
	bb.setReg_date(new Timestamp(System.currentTimeMillis()));
	bb.setIp(request.getRemoteAddr()); //요청한 쪽의 ip주소를 알아오는 메서드
	
	BoardDao bdao = BoardDao.getInstance();
	int cnt = bdao.insertArticle(bb);

	String msg;
	String url;
	if(cnt > 0) {
		msg = "insert 성공";
		url = "list.jsp";
	}else {
		msg = "insert 실패";
		url = "writeForm.jsp";
	}
%>
	<script type="text/javascript">
		alert("<%= msg %>");
		location.href = '<%= url %>';
	</script> 
