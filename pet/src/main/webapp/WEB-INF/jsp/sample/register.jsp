<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="../js/jquery/jquery-3.3.1.js"></script>
<script>
function checksubmit(){
	if($('#id').val()==""){
		alert("id을 입력하세요");	
		return false;
	}
	if($('#psw').val()==""){
		alert("비밀 번호를 입력하세요");
		return false;
	}
	if($('#pswCheck').val()==""){
		alert("비밀번호를 확인해주세요");
		return false;
	}
	if($('#psw').val() != $('#pswCheck').val()){
		$('font[name=check]').text('');
		$('font[name=check]').html("암호틀림");
		return false;
	}
	if($('#name').val()==""){
		alert("이름을 입력하세요");
		return false;
	}
	if($('#phone').val()==""){
		alert("핸드폰 번호를 입력하세요");
		return false;
	}
	if($('#email').val()==""){
		alert("메일주소를 입력하세요");
		return false;
	}
	if($('#address').val()==""){
		alert("주소를 입력하세요");
		return false;
	}
	if($('#pettype').val()==""){
		alert("애완동물 종류를 입력하세요");
		return false;
	}
	if($('#petrace').val()==""){
		alert("애완동물 품종를 입력하세요");
		return false;
	}else{
		return true;
	}	
	
}


$(function checkid(){
	$('#checkId').on("click", function(){
		if($('#id').val()==""){
			alert("id를 입력하세요.");
			$('#id').focus();
			return false;
		}else{
			var id = $('#id').val();
			var url = "/sample/checkId.do"+id;
			win=window.open(url,"idCheck","width=400, height=400, left=100, top=100");
			return true;
		}
	});
});
</script>
</head>
<body>
	<center>
		<h1>회원가입 페이지</h1>
		<form name="regiform" 
			accept-charset="UTF-8" action="insertInfo.do" onsubmit='return checksubmit();'>
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="ID" id="id"><input
						type="button" id="checkId" value="중복확인" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="PASSWORD" id="psw"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="PASSWORD_CHECK" id="pswCheck"><font
						name="check" size="2" color="red"></font></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="NAME" id="name"></td>
				</tr>
				<tr>
					<td>핸드폰 번호</td>
					<td><input type="text" name="PHONE" id="phone"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="EMAIL" id="email"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="ADDRESS" id="address"></td>
				</tr>
				<tr>
					<td>펫 종류</td>
					<td><input type="text" name="PETTYPE" id="pettype"></td>
				</tr>
				<tr>
					<td>품종</td>
					<td><input type="text" name="PETRACE" id="petrace"></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="가입하기"><input type="reset" value="다시작성"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
