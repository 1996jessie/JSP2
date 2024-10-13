<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%! // 선언문
		public int multiply(int a, int b) { //메서드 정의
			int result = a * b;
			System.out.println(result);
			return result;
		}
	%>
	
	10 * 20 = <%= multiply(10,20)%> 
	
</body>
</html>