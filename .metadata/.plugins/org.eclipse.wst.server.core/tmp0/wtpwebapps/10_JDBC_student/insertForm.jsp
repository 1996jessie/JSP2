<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        var isBlank = false;
        var use = "";
        var isCheck = false;
        
        $('#idCheck').click(function(){
            isCheck = true;
            if($('input[name = id]').val() == ""){
                $('#idmessage').html("<font color='red'> 입력이 누락되었습니다 </font>");
                alert('입력이 누락되었습니다');
                isBlank = true;
                return;
            } //누락체크
			isBlank = false; //다시 초기화
            
            $.ajax({
                url : "id_check_proc.jsp",
                data : ({
                        userId : $('input[name = id]').val()
                }),
                success : function(data){
                    if(jQuery.trim(data) == '중복 아님'){
                        $('#idmessage').html("<font color='blue'> 사용 가능합니다. </font>");
                        $('#idmessage').show();
                        use = "possible";
                    }else{
                        $('#idmessage').html("<font color='red'> 이미 사용중인 아이디입니다.</font>");
                        $('#idmessage').show();
                        use = "impossible";
                    }
                }//success
            }); //중복체크 : ajax
        }); //click

         $('input[name=id]').keydown(function(){
            $('#idmessage').css('display','none');
            isCheck = false;
            use = "";
         });

         $('#sub').click(function(){
             if(use == "impossible"){
                 alert("이미 사용중인 아이디입니다.");
                 return false;
             }else if(isCheck == false){
                 alert("중복체크를 먼저 하세요");
                 return false;
             }else if(isBlank == true){
                 alert('아이디를 입력하세요');
                 return false;
             }
         });
    });//ready
</script>

<h2>회원가입</h2>

<%
	String[] hobby = {"달리기","수영","등산","영화"};
	
%>
<form action = "insertProc.jsp" method = "post">
	아이디 : <input type = "text" name = "id">
			<input type = "button" id = "idCheck" value = "중복체크">
			<span id = "idmessage"></span>
			<br><br>
	비밀번호 : <input type = "password" name = "passwd">
			<br><br>
	이름 : <input type = "text" name = "name">
			<br><br>
	생년월일 : <select name = "year">
				<%	for(int i=2024;i>=1930;i--){ %>
							<option value = "<%= i %>"> <%= i %> 
					<%	} %>
			</select> 년
			
			<select name = "month">
				<%	for(int i=1;i<=12;i++){ %>
							<option value = "<%= i %>"> <%= i %> 
					<%	} %>
			</select> 월
			
			<select name = "day">
				<%	for(int i=1;i<=31;i++){ %>
							<option value = "<%= i %>"> <%= i %> 
					<%	} %>
			</select> 일
			<br><br>
	취미 : 	<%	for(int i=0;i<hobby.length;i++) { %>
				<%=	hobby[i] %><input type = "checkbox" name = "hobby" value = "<%= hobby[i] %>">
			<%	} %>
			<br><br>
	[점수입력] <br>
	C언어 : <input type = "text" name = "c">	JAVA : <input type = "text" name = "java"> jsp : <input type = "text" name = "jsp">
	<br><br>
	<input type="submit" id = "sub" value="가입하기"> 
</form>