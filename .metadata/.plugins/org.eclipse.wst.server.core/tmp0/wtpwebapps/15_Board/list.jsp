<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="style.css" type = "text/css"/>
<style>
	body {
		text-align: center;
	}
	table{
		margin: 5px auto;
	}
</style>
list.jsp<br>
<%@ include file="color.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

	
	int pageSize = 10; //한 페이지에 10개씩
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	String pageNum = request.getParameter("pageNum"); //문자열을 숫자로 바꿈
	if(pageNum == null) {
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1; //현재 페이지의 시작번호
	int endRow = currentPage * pageSize; // 현재 페이지의 끝번호
	int count = 0;
	int number = 0;
	
	BoardDao bdao = BoardDao.getInstance();
	ArrayList<BoardBean> articleList = bdao.getArticles(startRow, endRow);
	count = bdao.getArticleCount();
	//System.out.println("count : " + count);
	
	number = count - (currentPage - 1) * pageSize;
%>
<body bgcolor = "<%=bodyback_c%>">
<b>글목록(전체 글 : <%=count%>)</b>
<table border = 1 width = 800px>
	<tr>
		<td align = "right" bgcolor = "<%=value_c%>">
			<a href = "writeForm.jsp">글쓰기</a>
		</td>
	</tr>
</table>

<%
if(count == 0) {
%>		<table border = 1 width = 800px>
		<tr>
			<td align = "center">
				게시판에 저장된 글이 없습니다.
			</td>
		</tr>
	</table>
<%
} else {
%>	
	<table border = 1 width = 800px>
		<tr bgcolor = "<%=value_c%>" align = "center">
			<td>번호</td>
			<td>제   목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회</td>
			<td>IP</td>
		</tr>
		
	<%
			for(BoardBean bb : articleList) {
			%>
		<tr align = "center">
			<td><%= number-- %></td> <!-- 일련번호 -->
			<td align = "left">
				<%
					int wid = 0; //원글 : 0, 답글 : 1, 답답글 : 2....
					if(bb.getRe_level() > 0){
						wid = bb.getRe_level() * 20;
				%>		<img src="images/level.gif" width="<%= wid %>" height = "15">
						<img src="images/re.gif">
				<%	}	%>						
				<a href = "content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"><%= bb.getSubject()%></a>
				<%
					if(bb.getReadcount() >= 10) {
				%>		<img src="images/hot.gif" height = "15">
				<%	}	%>

			</td>
			<td><%= bb.getWriter() %></td>
			<td><%= sdf.format(bb.getReg_date()) %></td>
			<td><%= bb.getReadcount() %></td>
			<td><%= bb.getIp() %></td>
		</tr>
	<%	} //for %>
	</table>
<%	} //else
	
	//페이지 설정
	if(count > 0) {
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int pageBlock = 10; //한번에 10개의 페이지가 보이게 하자
		
		int startPage = ((currentPage - 1) / pageBlock * pageBlock) +  1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		if(startPage > 10) {
%>			<a href = "list.jsp?pageNum=<%= startPage-10 %>">[이전]</a>		
<%		}
		for(int i = startPage;i<=endPage;i++) {
%>			<a href = "list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%		}
		if(endPage < pageCount) {
%>			<a href = "list.jsp?pageNum=<%= startPage+10 %>">[다음]</a>
<%		}
	}
%>
</body>


