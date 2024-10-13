<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>

<%


	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	String passwd = request.getParameter("passwd");
	
	//System.out.println("<updateProc.jsp> num : " + num + ", pageNum : " + pageNum);
%>
<jsp:useBean id = "bb" class = "board.BoardBean">
	<jsp:setProperty name = "bb" property="*"/>
</jsp:useBean>

<%
	BoardDao bdao = BoardDao.getInstance();
	int cnt = bdao.updateArticle(bb);
	
	String msg;
	String url;
	
	if(cnt > 0) {	
		msg = "update 성공";
		url = "list.jsp?pageNum="+pageNum;
	}else if(cnt ==0) {
		msg = "비밀번호가 일치하지 않습니다.";
		url = "updateForm.jsp?num="+num+"&pageNum="+pageNum;
	}else {
		msg = "update 실패";
		url = "updateForm.jsp?num="+num+"&pageNum="+pageNum;
	}
%>
	<script type="text/javascript">
		alert("<%= msg %>");
		location.href = '<%= url %>';
	</script> 
