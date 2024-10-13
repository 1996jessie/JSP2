<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
cate_proc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	CategoryDao cdao = CategoryDao.getInstance();
%>

<jsp:useBean id = "cb" class = "my.shop.CategoryBean">
	<jsp:setProperty name = "cb" property="*"/>
</jsp:useBean>

<%
	int cnt = cdao.insertCategory(cb);

	String msg;
	String url;
	
	if(cnt > 0) {
		msg = "category insert 성공";
		url = "cate_list.jsp";
	} else {
		msg = "category insert 실패";
		url = "cate_input.jsp";
	}
%>
	<script type="text/javascript">
		alert("<%= msg %>");
		location.href = "<%= url %>"
	</script> 