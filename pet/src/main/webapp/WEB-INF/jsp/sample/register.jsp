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
	if($('#postcode').val()==""){
		alert("우편번호를 입력하세요");
		return false;
	}
	if($('#roadAddress').val()==""){
		alert("주소를 입력하세요");
		return false;
	}
	if($('#jibunAddress').val()==""){
		alert("나머지주소를 입력하세요");
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

$(function(){
	$('#checkId').on("click", function(){
		 var id = $('#id').val();
		 $.ajax({
		     type : 'POST',  
		     url : '/sample/checkId.do',  
		     data:{id : id},	    
		     success : function(msg) {
		      alert(mag);
		      } 
		  });  
	});
});

// $(function checkid(){
// 	$('#checkId').on("click", function(){
// 		if($('#id').val()==""){
// 			alert("id를 입력하세요.");
// 			$('#id').focus();
// 			return false;
// 		}else{
// 			var id = $('#id').val();
// 			var url = "/sample/checkId.do"+id;
// 			win=window.open(url,"idCheck","width=400, height=400, left=100, top=100");
// 			return true;
// 		}
// 	});
// });
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
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
					<td><input type="text" name="ID" id="id" placeholder="아이디">
					<input type="button" id="checkId" value="중복확인" />
					<span id = "chkMsg"></span> </td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="PASSWORD" id="psw" placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="PASSWORD_CHECK" id="pswCheck" placeholder="비밀번호 확인"><font
						name="check" size="2" color="red"></font></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="NAME" id="name" placeholder="이름"></td>
				</tr>
				<tr>
					<td>핸드폰 번호</td>
					<td><input type="text" name="PHONE" id="phone" placeholder="핸드폰 번호"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="EMAIL" id="email" placeholder="이메일"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" id="postcode" placeholder="우편번호" name=PCODE>
						<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="roadAddress" placeholder="도로명주소" name=ADDR1>
						<input type="text" id="jibunAddress" placeholder="지번주소" name=ADDR2><br>
						<span id="guide" style="color:#999"></span></td>
				</tr>
				<tr>
					<td>펫 종류</td>
					<td><input type="text" name="PETTYPE" id="pettype" placeholder="애완동물 종류"></td>
				</tr>
				<tr>
					<td>품종</td>
					<td><input type="text" name="PETRACE" id="petrace" placeholder="품종"></td>
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
