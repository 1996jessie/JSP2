<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%
	int num = 11;
	
	switch(num%2) {
	case 1 : 
		out.print("홀수입니다.");
		break;
	default : out.print("짝수입니다.");
	}
	%>