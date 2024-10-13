<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id = "mdao" class = "myPkg.MovieDao"/>
<jsp:useBean id = "mb" class = "myPkg.MovieBean">
	<jsp:setProperty name = "mb" property = "*"/>
</jsp:useBean>

<%
	String[] garr = request.getParameterValues("genre");
	String genre = "";
	
	if(garr == null) {
		genre += "좋아하는 장르 없음";
	}else {
		for(int i=0;i<garr.length;i++) {
			genre += garr[i] + " ";
		}
	}

	mb.setGenre(genre); 

	int cnt = mdao.updateMovie(mb);  
	String msg;
	String url;
	if(cnt > 0) {
		msg = "update 성공";
		url = "select.jsp";
	}else {
		msg = "update 실패";
		url = "updateForm.jsp?num=" + mb.getNum();	
	}
%>
	<script type="text/javascript">
	    alert("<%= msg %>");
	    location.href = '<%= url %>';
	</script> 
