<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_result.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id"); //form에서 넘어오는 정보가 request에 담김
	String passwd = request.getParameter("passwd");
	System.out.println("Ex01_result.jsp id : " + id + " passwd : " + passwd); //이 페이지에 왔었다는 것을 확인하기 위함
%>

아이디 : <%=id%><br>
비밀번호 : <%=passwd%><br>

<!-- forwardActionTag 있는 페이지 : 잠깐 거쳐가는 페이지(response.sendRedirect와 비슷 -->
<jsp:forward page="Ex01_forward.jsp"/> 


<%-- </jsp:forward> --%>
<!-- 
결과 화면과 최종 주소가 다름
결과화면은 forward이지만 주소는 result(거쳐가는 페이지)
문제 발생할 수 있음
request 객체 공유(ActionTag와 동일)
 -->
