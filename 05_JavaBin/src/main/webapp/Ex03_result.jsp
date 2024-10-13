<%@page import="myPkg.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex03_result.jsp<br>


<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String mclass = request.getParameter("mclass");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone2");
%>
<%
	MemberBean mb1 = new MemberBean();
	mb1.setId(id);
	mb1.setPw(pw);
	mb1.setName(name);
	mb1.setMclass(mclass);
	mb1.setPhone1(phone1);
	mb1.setPhone2(phone2);
	mb1.setPhone3(phone3);
	
	String temp; //비교는 jsp여도 java코드 사용해야 함
	if(mb1.getMclass().equals("1")) {
		temp = "비회원";
	} else if(mb1.getMclass().equals("2")) {
		temp = "정회원";
	} else if(mb1.getMclass().equals("3")) {
		temp = "우수회원";
	} else {
		temp = "관리자";
	}
	
	out.print("아이디 : " + mb1.getId()+"<br>"); 
	out.print("비밀번호 : " + mb1.getPw()+"<br>"); 
	out.print("회원이름 : " + mb1.getName()+"<br>"); 
	out.print("회원구분 : " + mb1.getMclass()+"/"+temp+"<br>"); 
	out.print("전화번호 : " + mb1.getPhone1()+"-"+ mb1.getPhone2()+"-"+mb1.getPhone3()); 

%>

<hr>

<jsp:useBean id="mb2" class="myPkg.MemberBean">
	<jsp:setProperty name="mb2" property="id"/>
	<jsp:setProperty name="mb2" property="pw"/>
	<jsp:setProperty name="mb2" property="name"/>
	<jsp:setProperty name="mb2" property="mclass"/>
	<jsp:setProperty name="mb2" property="phone1"/>
	<jsp:setProperty name="mb2" property="phone2"/>
	<jsp:setProperty name="mb2" property="phone3"/>
</jsp:useBean>

<%
	//비교는 jsp여도 java코드 사용해야 함
	if(mb2.getMclass().equals("1")) {
		temp = "비회원";
	} else if(mb2.getMclass().equals("2")) {
		temp = "정회원";
	} else if(mb2.getMclass().equals("3")) {
		temp = "우수회원";
	} else {
		temp = "관리자";
	}
%>

아이디 : <jsp:getProperty name = "mb2" property="id"/><br>
비밀번호 : <jsp:getProperty name = "mb2" property="pw"/><br>
회원이름 : <jsp:getProperty name = "mb2" property="name"/><br>
회원구분 : <jsp:getProperty name = "mb2" property="mclass"/>/<%= temp %><br>
전화번호 : <jsp:getProperty name = "mb2" property="phone1"/>-<jsp:getProperty name = "mb2" property="phone2"/>-<jsp:getProperty name = "mb2" property="phone3"/>

<hr>

<jsp:useBean id="mb3" class="myPkg.MemberBean">
	<jsp:setProperty name = "mb3" property = "*"/>
</jsp:useBean>

<%
	//비교는 jsp여도 java코드 사용해야 함
	if(mb3.getMclass().equals("1")) {
		temp = "비회원";
	} else if(mb3.getMclass().equals("2")) {
		temp = "정회원";
	} else if(mb3.getMclass().equals("3")) {
		temp = "우수회원";
	} else {
		temp = "관리자";
	}
%>

아이디 : <jsp:getProperty name = "mb3" property="id"/><br>
비밀번호 : <jsp:getProperty name = "mb3" property="pw"/><br>
회원이름 : <jsp:getProperty name = "mb3" property="name"/><br>
회원구분 : <jsp:getProperty name = "mb3" property="mclass"/>/<%= temp %><br>
전화번호 : <jsp:getProperty name = "mb3" property="phone1"/>-<jsp:getProperty name = "mb3" property="phone2"/>-<jsp:getProperty name = "mb3" property="phone3"/>


