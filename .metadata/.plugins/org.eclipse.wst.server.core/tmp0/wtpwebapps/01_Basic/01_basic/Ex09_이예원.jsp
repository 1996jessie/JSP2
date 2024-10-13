<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type = "text/css">
	td{
		text-align: center;
	}
	th{
		background: pink;
	}
</style>
<table border=1>
	<%
	int i,j;
	out.print("<tr>");
	
	for(i=2;i<=9;i++){
		out.print("<th>" + i + "단" + "</th>");
	}
	for(i=1;i<=9;i++) {
		out.print("<tr>");
		for(j=2;j<=9;j++) {
			out.print("<td >"+j+"x"+i+"="+j*i+"</td>");
		}
		out.print("</tr>");
	}
	%>
</table>