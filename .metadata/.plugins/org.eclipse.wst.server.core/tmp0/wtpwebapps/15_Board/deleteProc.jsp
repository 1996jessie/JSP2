<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
deleteProc.jsp<br>

<%
request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String passwd = request.getParameter("passwd");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	System.out.println("deleteProc로 넘어간 num : " + num);
	System.out.println("deleteProc로 넘어간 passwd : " + passwd); 
	System.out.println("deleteProc로 넘어간 pageNum : " + pageNum);
	
	BoardDao bdao = BoardDao.getInstance();
	int cnt = bdao.deleteArticle(num, passwd);

	int count = bdao.getArticleCount();
	int pageSize = 10;
	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	
	String msg;
	String url;
	if(cnt > 0) {
		msg = "delete 성공";
		if(pageCount < pageNum) {
			pageNum = pageCount;
		}
		url = "list.jsp?pageNum=" + pageNum;
	}else if(cnt == 0){
		msg = "비밀번호가 일치하지 않습니다.";
		url = "deleteForm.jsp?num=" + num + "&pageNum=" + pageNum;		
	}else{
		msg = "삭제 실패";
		url = "deleteForm.jsp?num=" + num + "&pageNum=" + pageNum;	
	}
%>
	<script type="text/javascript">
		alert("<%= msg %>");
		location.href = '<%= url %>';
	</script> 
