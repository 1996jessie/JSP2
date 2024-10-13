<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int num;
	int count = 1;
	do{
		num = (int)(Math.random()*10 + 1);
		out.print(count+"번째 = "+ num+"<br>");
		count++;
	}while(num != 7);
	
%>