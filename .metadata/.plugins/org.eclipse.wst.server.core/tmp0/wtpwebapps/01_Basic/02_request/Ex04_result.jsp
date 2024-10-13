<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex04_result.jsp<br>

<% 
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String[] narr = request.getParameterValues("name"); //request.getParameterValues : 배열 리턴
	System.out.println("namearr.length:"+narr.length); //개수 1개
	
	if(name == ""){
		out.print("이름 누락되었습니다.<br>");
	}
	
	String password = request.getParameter("pw");
	String[] parr = request.getParameterValues("pw");
	
	if(password == ""){
		out.print("비밀번호 누락되었습니다.<br>");
	}
	
	String fruits = request.getParameter("fruits"); //제일 위의 값만 나옴
	String[] farr = request.getParameterValues("fruits");
	//System.out.println("farr.length:"+farr.length); //선택 안하면 길이가 0이 아니라 그냥 에러
	//java.lang.NullPointerException: Cannot read the array length because "farr" is null
	//공간이 만들어지지 않아서 배열을 찾을 수 없음
	//선택 안하면 farr = null

	
%>
	이름1 : <%= name %><br>
	이름2 : <%= narr[0] %><br>
	비밀번호1 : <%= password %><br>
	비밀번호2 : <%= parr[0] %><br>
	과일1 : <%= fruits %><br>
	
<%	
	if(farr == null){
		out.println("선택한 과일이 없습니다.<br>");
	}else{ // /* 왔다. */
		out.println("선택한 과일이 있습니다.<br>");
		out.print("과일2:");
		for(int i=0;i<farr.length;i++){
			out.print(farr[i]+" ");
		}
		out.print("<br>");
		
		out.print("과일3:");
		for(String f : farr){
			out.print(f + " ");
		}
	}
%>	