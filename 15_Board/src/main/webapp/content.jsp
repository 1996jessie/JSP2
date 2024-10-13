<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
content.jsp<br>
<%
int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	//System.out.println("content.jsp num : " + num);
	//System.out.println("content.jsp pageNum : " + pageNum);
	
	BoardDao bdao = BoardDao.getInstance();
	BoardBean bb = bdao.getArticle(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	int ref = bb.getRef();
	int re_step = bb.getRe_step();
	int re_level = bb.getRe_level();
	//System.out.println("<content.jsp>부모가 넘길 ref : " + ref + ", 부모의 re_step : " + re_step + ", 부모의 re_level : " + re_level);
%>
<%@include file = "color.jsp" %>

<style>
	body {
		text-align: center;
	}
	table{
		margin: 5px auto;
	}
</style>

<b>글내용 보기</b>

<body bgcolor = "<%= bodyback_c %>">
	<table border = 1 width = "500">
		<tr align = "center">
			<td bgcolor = "<%= value_c %>" width = "125">글번호</td>
			<td width = "125"><%= bb.getNum() %></td>
			<td bgcolor = "<%= value_c %>" width = "125">조회수</td>
			<td width = "125"><%= bb.getReadcount() %></td>
		</tr>
		<tr align = "center">
			<td bgcolor = "<%= value_c %>">작성자</td>
			<td><%= bb.getWriter() %></td>
			<td bgcolor = "<%= value_c %>">작성일</td>
			<td><%= sdf.format(bb.getReg_date()) %></td>
		</tr>
		<tr align = "center">
			<td bgcolor = "<%= value_c %>">글제목</td>
			<td colspan = "3"><%= bb.getSubject() %></td>
		</tr>
		<tr align = "center">
			<td bgcolor = "<%= value_c %>">글내용</td>
			<td colspan = "3"><%= bb.getContent() %></td>
		</tr>
		<tr>
			<td colspan = "4"  bgcolor = "<%= value_c %>" align = "right">
				<input type = "button" value = "글수정" onClick = "location.href = 'updateForm.jsp?num=<%= bb.getNum() %>&pageNum=<%= pageNum %>'">
				<input type = "button" value = "글삭제" onClick = "location.href = 'deleteForm.jsp?num=<%= bb.getNum() %>&pageNum=<%= pageNum %>'">
				<input type = "button" value = "답글쓰기" onClick = "location.href = 'replyForm.jsp?num=<%= bb.getNum() %>&pageNum=<%= pageNum %>&ref=<%=bb.getRef()%>&re_step=<%=bb.getRe_step()%>&re_level=<%=bb.getRe_level()%>'">
				<input type = "button" value = "글목록" onClick = "location.href = 'list.jsp?pageNum=<%= pageNum %>'">
				<input type="button" value="글목록" onClick = "history.back()">
			</td>
	
		</tr>
	</table>
</body>