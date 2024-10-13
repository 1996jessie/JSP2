<%@page import="myPkg.BookBean"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
select.jsp<br>

<jsp:useBean id="bdao" class="myPkg.BookDao"/>

<style type="text/css">
	table {
		border-collapse: collapse;
		text-align: center;
		margin: auto;
		border: 1px;
		width: 800px;
	}
	tr:first-child{
		background-color : yellow;
	}
	td,th{
		border: 1px solid black;
		padding: 3px;
	}
</style>

<script type="text/javascript">
	function insert() {		
		location.href = "insertForm.jsp";
	}
	function allDelete(obj){ //obj = this = allcheck인 체크박스
		//alert('1');
		
		var rcheck = document.getElementsByName("rowcheck");
		//alert(rcheck.length);
		var check = obj.checked; //체크하면 true, 아니면 false
		//alert(check);
 		if(check){ // 체크상태(true)
			for(var i=0;i<rcheck.length;i++) {
				rcheck[i].checked = true; //모든 rowcheck 체크상태로
			}
		} else {
			for(var i=0;i<rcheck.length;i++) {
				rcheck[i].checked = false; //모든 rowcheck 해제상태로
			}			
		} 	
	}//allDelete
	
/*  function delete() { //예약어는 함수 이름으로 쓸 수 없음(for, else 등등)
		alert('1');
	}  */

	function selectDelete(){
		//alert('1');
		var rcheck = document.getElementsByName("rowcheck");
		var flag = false;
		for(var i=0;i<rcheck.length;i++) {
			if(rcheck[i].checked) {
				flag = true;
			}
		}
		if(!flag) { //= !false = true
			alert('삭제할 항목을 선택하세요');
			return; //선택하지 않으면 그 자리에 머물러 있도록 설정
		} 

		document.myform.submit(); //submit 버튼을 누른 것처럼 행동하라는 함수 //action으로 이동해라
	}//selectDelete
	
</script>


<form name = "myform" action = "deleteAll.jsp">
	
	<input type = "button" value = "삭제" onClick = "selectDelete()">
	<input type = "button" value = "추가" onClick = "insert()">
	
	<table>
		<tr>
			<th><input type = "checkbox" name = "allcheck" onClick = "allDelete(this)"></th>
			<!-- this : 내가 지금 클릭한, 이름이 allcheck인 체크박스 -->
			<th>번호</th>
			<th>제목</th>
			<th>저자</th>
			<th>출판사</th>
			<th>가격</th>
			<th>입고일</th>
			<th>배송비</th>
			<th>구입 가능 서점</th>
			<th>보유 수량</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		
	<%
		ArrayList<BookBean> lists = bdao.getAllBooks();
		
		for(BookBean bb : lists) {
	%>		<tr>
				<td><input type = "checkbox" name = "rowcheck" value = "<%= bb.getNo() %>"></td>
				<td><%= bb.getNo() %></td>
				<td><%= bb.getTitle() %></td>
				<td><%= bb.getAuthor() %></td>
				<td><%= bb.getPublisher() %></td>
				<td align = "right"><%= bb.getPrice() %></td>
				<td><%= bb.getDay() %></td>
				<td><%= bb.getKind() %></td>
				<td><%= bb.getBookstore() %></td>
				<td><%= bb.getCount() %></td>
				<td><a href = "updateForm.jsp?no=<%= bb.getNo() %>">수정</a></td>
				<td><a href = "deleteProc.jsp?no=<%= bb.getNo() %>">삭제</a></td>
			</tr>
	<%	}
	%>	
	</table>

</form>