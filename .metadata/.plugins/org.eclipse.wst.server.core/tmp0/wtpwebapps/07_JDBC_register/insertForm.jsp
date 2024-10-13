<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertForm.jsp<br>


<h2>register 테이블에 레코드삽입(추가)예제</h2>
  
  <FORM METHOD="post" ACTION="insertProc.jsp">
  
    아이디 : <INPUT TYPE="text" NAME="id"><p>
    
    패스워드 : <INPUT TYPE="password" NAME="passwd"><p>
    
    이름 : <INPUT TYPE="text" NAME="name"><p>
    
    성별 : <input type="radio" name="gender" value="남" checked>남
    	   <input type="radio" name="gender" value="여">여<p>
  	
  	e-mail : <input type="text" name="uname">@
  			<select name="dname">
	  			<option value="daum.net">daum.net</option>
	  			<option value="naver.com">naver.com</option>
	  			<option value="nate.com">nate.com</option>
	  			<option value="google.com">google.com</option>
	  			<option value="yahoo.com">yahoo.com</option> 		
  			</select><p>
  <INPUT TYPE="submit" VALUE="보내기">
  </FORM>