<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertForm.jsp<br>

<%
	String[] kind = {"유료","무료"};
	String[] bookstore = {"교보문고","알라딘","yes24","인터파크"};
%>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

	$(function(){
		var use;
		var isCheck = false;
		$('#titleCheck').click(function(){
			isCheck = true;
			$.ajax({
				url : "title_check_proc.jsp", //요청url
				data : ({
					usertitle : $('input[name=title]').val()
				}),
				success : function(data) { //응답이 왔다(yes/no);
					//alert('data' + data);
					if($('input[name=title]').val() == "") {
						$('#titleMessage').html("<font color = red> 입력 누락됐습니다. </font>")
						$('#titleMessage').show();
						use = "missing";
					}else if($.trim(data) == "YES"){ /* 공백을 제거해야 함 */
						$('#titleMessage').html("<font color = blue> 등록이 가능합니다. </font>")
						$('#titleMessage').show(); 
						use = "possible";
					} else {
						$('#titleMessage').html("<font color = red> 이미 등록된 도서입니다. </font>")
						$('#titleMessage').show();
						use = "impossible";
					}
				}//success
			});//ajax
			
			$('input[name=title]').keydown(function(){
				$('#titleMessage').hide();
				/* $('#titleMessage').html(""); */
				/* $('#titleMessage').css('display','none'); */
				isCheck = false;// 다시 초기화
				use = ""; //다시 초기화
			}); //keydown
		}); //click
		
		$('#sub').click(function(){
			if(use == "missing") {
				alert("제목 누락되었습니다.");
				$('input[name=title]').focus();
				return false;
			}else if(use == "impossible") {
				alert("이미 등록된 도서입니다.");
				return false;
			}else if(isCheck == false) {
				alert("중복 체크 먼저 하세요");
				return false;
			}
		});
	}); //ready
	
</script>
<h2>도서 정보 입력</h2>

<form name="myform" action="insertProc.jsp" method="post">
	<table border=1>
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="title">
				<input type = "button" id = "titleCheck" value = "중복체크">
				<span id = "titleMessage"></span>
			</td>
		</tr>
		<tr>
			<td>저자</td>
			<td><input type="text" name="author">
		</tr>
		<tr>
			<td>출판사</td>
			<td><input type="text" name="publisher">
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" name="price">
		</tr>
		<tr>
			<td>입고일</td>
			<td><input type="date" name="day">
		</tr>

		<tr>
			<td>배송비</td>
			<td>
			<%	for(int i=0;i<kind.length;i++) { %>
				<%=	kind[i] %><input type = "radio" name = "kind" value = "<%= kind[i] %>">
			<%	} %>
<!-- 		유료 <input type="radio" name="kind" value="유료"> 
			무료 <input type="radio" name="kind" value="무료"> -->
		</tr>
		<tr>
			<td>구입가능 서점</td>
			<td>
			
			<%	for(int i=0;i<bookstore.length;i++) { %>
				<%=	bookstore[i] %><input type = "checkbox" name = "bookstore" value = "<%= bookstore[i] %>">
			<%	} %>
<!-- 			교보문고 <input type="checkbox" name="bookstore" value="kyobo">
				알라딘 <input type="checkbox" name="bookstore" value="aladin">
				yes24 <input type="checkbox" name="bookstore" value="yes24">
				인터파크 <input type="checkbox" name="bookstore" value="interpark"> -->
		</tr>
		<tr>
			<td>보유수량</td>
			<td><select name="count" id="count">
					<option value="선택">선택
					<%	for(int i=1;i<=5;i++){ %>
							<option value = "<%= i %>"> <%= i %>
					<%	} %>
<!-- 				<option value="1">1
					<option value="2">2
					<option value="3">3
					<option value="4">4
					<option value="5">5 -->
			</select></td>
		</tr>

	</table>
	<br> 
	<input type="submit" id = "sub" value="전송"> 
	<input type="reset" value="취소">
</form>