<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/* title_check_proc.jsp */
	/* insertForm에서 중복체크 클릭하면 usertitle에 제목 담아서 넘어옴 */
	/* 위에 주석 달면 같이 넘어오니까 스크립트릿 안에 주석으로 써야 함 */
	request.setCharacterEncoding("UTF-8");

	String usertitle= request.getParameter("usertitle");
	//System.out.println("t_c_p.jsp usertitle:" + usertitle);
%>

<jsp:useBean id="bdao" class="myPkg.BookDao"/>

<%
	boolean flag = bdao.searchTitle(usertitle);
	String str;
	if(flag == true) {
		str = "NO";
		out.print(str); //요청한 쪽으로 응답을 내보냄(브라우저 출력x)
	} else {
		str = "YES";
		out.print(str);
	}
%>