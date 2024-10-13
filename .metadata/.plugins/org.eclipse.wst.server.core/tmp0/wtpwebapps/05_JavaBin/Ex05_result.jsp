<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex05_result.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="jb" class="myPkg.JumsuBean">
	<jsp:setProperty name="jb" property="name"/>
	<jsp:setProperty name="jb" property="jumsu"/>
	<jsp:setProperty name="jb" property="group"/>
</jsp:useBean>

<jsp:useBean id = "jb2" class = "myPkg.JumsuBean">
	<jsp:setProperty name="jb2" property="*"/>
</jsp:useBean>

이름 : <jsp:getProperty name="jb" property="name"/><br>
<%
	int sum = 0;
	int[] jarr = jb.getJumsu();
	String[] subject = {"국어","영어","수학","과학","음악"};
	for(int i=0;i<jarr.length;i++) {
		out.print(subject[i] + " : " + jarr[i]);
		sum += jarr[i];
		out.print("<br>");
	}
	out.print("합계 : " + sum + "<br>");
%>
좋아하는 걸그룹 : 
<%
	String[] garr = jb.getGroup();
	for(int i=0;i<garr.length;i++) {
		out.print(garr[i] + " ");
	}
	out.print("<br>");
%>

