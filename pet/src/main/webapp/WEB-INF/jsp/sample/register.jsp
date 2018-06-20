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
	if($('#name').val()==""){
		alert("이름을 입력하세요");	
		return false;
	}else{
		return true;
	}	
}

// 	$(function checkid(){
// 		$('#checkId').on("click", function(){
// 			if($('#id').val()==""){
// 				alert("id를 입력하시오.");
// 				$('#id').focus();
// 				return false;
// 			}else{
// 		    	var id = $('#id').val();
// 				console.log(id);
// 		    	var comSubmit = new ComSubmit();
// 		    	comSubmit.setUrl("<c:url value='/sample/checkId.do' />");
// 		    	comSubmit.addParam("USER_ID", id);
// 		    	comSubmit.submit();
// 		    	return true;
// 			}
// 		});
// 	});
// $(function(){
// 	$('#psw').keyup(function() {
// 		$('font[name=check]').text('');
// 	}); //#user_pass.keyup
// 	$('#pswCheck').keyup(function() {
// 		if ($('#psw').val() != $('#pswCheck').val()) {
// 			$('font[name=check]').text('');
// 			$('font[name=check]').html("암호틀림");
// 			$('#psw').focus();
// 			return false;
// 		}else{
// 			$('font[name=check]').text('');
// 			$('font[name=check]').html("암호맞음");
// 			$('#name').focus();
// 			return true;
// 		}
// 	});//#chpass.keyup
// 	$('#email').keyup(function(){
// 		if($('#phone').val()==""){
// 			alert("핸드폰 번호를 입력하세요");
// 			$('#phone').focus();
// 			return false;
// 		}else return true;
// 	});

// 	$('#address').keyup(function(){
// 		if($('#email').val()==""){
// 			alert("메일주소를 입력하세요");
// 			$('#email').focus();
// 			return false;
// 		}else return true;
// 	});
	
// 	$('#pettype').keyup(function(){
// 		if($('#address').val()==""){
// 			alert("주소를 입력하세요");
// 			$('#address').focus();
// 			return false;
// 		}else return true;
// 	});

// 	$('#petrace').keyup(function(){
// 		if($('#pettype').val()==""){
// 			alert("애완동물 종류를 입력하세요");
// 			$('#pettype').focus();
// 			return false;
// 		}else return true;
// 	});

// 	$('#petrace').keyup(function(){
// 		if($('#petrace').val()==""){
// 			alert("애완동물 품종를 입력하세요");
// 			$('#petrace').focus();
// 			return false;
// 		}else return true;
// 	});
// });
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
