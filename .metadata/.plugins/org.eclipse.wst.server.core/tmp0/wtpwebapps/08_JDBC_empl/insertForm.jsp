<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertForm.jsp<br>

<h2>회원 가입</h2>
<form action="insertProc.jsp" method="post">

	이름 : <input type="text" name="name"><br>
	부서번호 : <select name="dept">
				<!-- 			
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				 -->
		<% 		for(int i=1;i<=3;i++) {
		%>			<option value = "<%= i %>"> <%= i %> </option>
		<%		}
		%>
			</select> <br>
	급여 : <input type="text" name="salary"> <br>
	<input type="submit" value="가입하기">

</form>

