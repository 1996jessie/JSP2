<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_result.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id"); 
	String passwd = request.getParameter("passwd"); 	
%>

아이디 : <%=id%><br>
비밀번호 : <%=passwd%><br>

<hr>
<!-- "Ex01_contain.jsp"를 실행한 결과를 포함 --%>
<!-- (여는 태그와 닫는 태그 동시에 표현) 사이에 쓸 내용 없으면 꼭 마무리해야 함 -->
<!-- age = 30 가지고 가자 -->
<!-- includeActionTag-->
<!-- jsp:include 안에 주석 달면 안됨!!!!!!! -->
<jsp:include page="Ex01_contain.jsp"> 
	<jsp:param value="30" name="age"/> 
	<jsp:param value="제주도" name="addr"/>
</jsp:include > 

<%--/01_includeActionTag/Ex01_result.jsp (행: [16], 열: [38]) "name"과 "value" 속성들을 포함한 "jsp:param" 표준 액션이 요구됩니다. --%>

<%-- <%@ include file="Ex01_contain.jsp" %> --%> <!-- 복사 붙여넣기 하기 때문에 중복 오류 가능(변수값 바꾸면 오류x) -->    
<!-- include 지시어 : 코드 복사 vs includeActionTag : 실행한 결과를 포함해라 -->


<hr>
Ex01_result.jsp 나머지 부분입니다.<br>