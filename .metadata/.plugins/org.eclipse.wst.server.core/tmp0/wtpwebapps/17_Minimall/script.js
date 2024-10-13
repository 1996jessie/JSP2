/**
 * webapp\script.js
 */

var iduse;
var pwuse;
var isCheck = false;
var pwsame;

$(function(){
	//alert('function()');
	$("input[name = id]").keydown(function(){
		$('#idmessage').css('display','none');
		isCheck = false;
		use = "";
	});
	$("input[name = password]").keydown(function(){
		passwdcheck = true;
		pwuse = "";
	});
}) ;

function duplicate(){ // 중복체크 클릭
	//alert("duplicate");
	isCheck = true;
	$.ajax({
		url : "id_check.jsp",
		data : ({
			userId : $("input[name = id]").val()
		}),
		success : function(data){
			//alert(data);
			flag = true;
			
			if($('input[name = id]').val() == ""){
				$('#idmessage').html("아이디가 누락되었습니다.").css("color","red").show();
				$('input[name = id]').focus();
			}
			else if($.trim(data) == "YES"){
				//	alert(data);
				$("#idmessage").html("사용가능한 아이디입니다").css("color","blue").show();
				$('input[name = id]').select();
				iduse = "possible";
			}
			else{
				$("#idmessage").html("아이디가 이미 있습니다.").css("color","red").show();
				iduse = "impossible";
			}
		}
	});
}//duplicate

function writeSave(){ // submit 클릭
	//alert('writeSave()');
	if($('input[name = id]').val()==""){
		alert("아이디를 입력하세요");
		$('input[name = id]').focus();
		isBlank = true;
		return false;	
	}else if(iduse == "impossible"){
		alert("이미 사용중인 아이디입니다.");
		return false;
	}else if(isCheck == false){
		alert("중복체크 먼저 하세요");
		return false;
	}else if($('input[name = password]').val()=="") {
		alert("비밀번호를 입력하세요");
		return false;
	}else if(pwuse == "formaterror") {
		alert("비밀번호 형식이 옳지 않습니다.")
		return false;
	}else if($('input[name = repassword]').val()=="") {
		alert("비밀번호 확인을 입력하세요");
		return false;
	}else if(pwsame == "nosame"){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
}//writeSave

function pwcheck(){
	//alert('pwcheck()');

	var pw = document.forms[0].password.value;
	var regexp = /.{3,8}/ // . : 어떤 글자가 와도 괜찮다
	if (pw.search(regexp) == -1) { //글자수 체크(없으면 -1)
		alert("글자수가 3~8이 아님");
		pwuse = "formaterror";
		return false;
	}
	
	var chk_num = pw.search(/[0-9]/); //숫자 있는지 체크(없으면 -1) 	
	var chk_eng = pw.search(/[a-z]/); //소문자 있는지 체크(없으면 -1) 		
	
	if(chk_num < 0 || chk_eng < 0) { //숫자가 없거나 영문자가 없으면
		alert("비밀번호는 영문자와 숫자를 조합하세요.");
		pwuse = "formaterror";
		return false;
	}
	pwuse = "";
}

function repasswordCheck(){
	var pw = document.forms[0].password.value; 
	var repw = document.forms[0].repassword.value; 
	
	if(pw!=repw){
		$('#pwmessage').html("비번 불일치").css('color','red');
		pwsame = "nosame";
	}else {
		$('#pwmessage').html("<font color=blue>비번 일치</font>");
		pwsame = "same";
	}
}//repasswordCheck	
