<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    int i;
    int sum = 0;
    for(i=1;i<=10;i++) {
    	sum += i;
    }
    out.print("1~10의 합 : " + sum + "<br>");
    %>
    sum : <%=sum%> <br>
    
    <%
    sum = 0;
    for(i=1;i<=10;i++) {
    	sum += i;
    	out.print("1~"+i+"의 합 : " + sum + "<br>");
    }
    %>
    