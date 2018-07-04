<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<caption>관리자 페이지</caption>
	<p>관리자님 안녕하세요.</p>
	<input type="button" id="manage_member" value="회원관리"/>
	<a href="/pet/admin/openMemberList.do" class="btn" id="manage_member">회원관리</a>
	<input type="button" id="write_recipe" value="조리법 올리기"/>
	<a href="#this" class="btn" id="write_recipe">조리법 올리기</a>
	<input type="button" id="write_medical" value="의료 올리기"/>
	<a href="#this" class="btn" id="write_medical">의료 올리기</a>
	<input type="button" id="write_training" value="훈련법 올리기"/>
	<a href="#this" class="btn" id="write_training">훈련법 올리기</a>
</body>
</html>