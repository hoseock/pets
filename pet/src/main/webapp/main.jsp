<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 <link rel="stylesheet" type="text/css" href="/pet/css/main.css">
 <style>
 .mySlides {display:none;}
 </style>
</head>
<script type="text/javascript" src="/pet/js/slide.js"></script>
<body class="main">
<%@ include file="/WEB-INF/include/include-body.jsp"%>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<%@ include file="/WEB-INF/include/include-menuBar.jsp"%>
<div class="root">
	<div id="wrap">
		<div id="container">
			<div id="contents">
			<div class="login_area_wrap">
				<div id="login" class="login">
					<form name="login_frm" id="login_frm">
						<fieldset>
							<legend class="hide">로그인 폼</legend>
							<label for="id" class="hide">아이디</label>
								<input id="id" name="id" title="아이디 입력" type="text" value="" style="ime-mode: inactive;" class="input-text bg-off" maxlength="25" tabindex="2">
							<label for="password" class="hide">비밀번호</label>
								<input id="password" name="password" title="비밀번호 입력" type="password" value="" class="input-text bg-off"  tabindex="3">
							
								<button type="submit" id="login_btn"><span>로그인</span></button>
							
							<p>
								<a href="/pet/register/openRegister.do"><span>회원가입</span></a>
								<a href="/pet/sample/openRegister.do"><span>ID/</span></a>
								<a href="/pet/sample/openRegister.do"><span>PW찾기</span></a>
							</p>
						</fieldset>
	  				</form>
				</div>
				<div class="notice_area ">
	            	<div class="notice_tit">
	            		<a href="listType=notice" onmousedown="">공지사항</a>
	            	</div>
	            	<ul class="notice_list">
	            		<li><a href="" >공지</a></li>
	           			<li><a href="" >공지</a></li>
	            	</ul>
	            </div>
	            </div>
			</div>
			<div id="column_row" class="column_row">
				<div id="slide_area">
					<div id="slide_bar">
					  <img class="mySlides" src="/pet/resources/image/ad2.jpg">
					  <img class="mySlides" src="/pet/resources/image/ad3.jpg">
					  <img class="mySlides" src="/pet/resources/image/ad4.jpg">
					</div>
					</div>
				
				<script>
				var myIndex = 0;
				carousel();
				
				function carousel() {
				    var i;
				    var x = document.getElementsByClassName("mySlides");
				    for (i = 0; i < x.length; i++) {
				       x[i].style.display = "none";  
				    }
				    myIndex++;
				    if (myIndex > x.length) {myIndex = 1}    
				    x[myIndex-1].style.display = "block";  
				    setTimeout(carousel, 2000); // Change image every 2 seconds
				}
				</script>
				<div id="ranking_bar">
					<a>랭킹</a>
				</div>
				<div class="mission_area">
					<div class="mission_bar">
						<a>미션</a>
					</div>
				</div>
				<div>
				<div id="medi_bar">
					<a>의료정보</a>
				</div>
				<div class="walk_area">
					<div class="walk_bar">
						<a>산책로</a>
					</div>				
				</div>
			</div>
		</div>
	</div>
	</div>
	<div id="footer">footer</div>
</div>
</body>
</html>