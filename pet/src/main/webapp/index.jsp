<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%-- <script src='<c:url value="js/ajax.js"/>'></script> --%>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js/jquery/jquery-3.3.1.js"></script>
<script src='<c:url value="js/jquery.min.js"/>'></script>
<script src='<c:url value="js/jquery.oLoader.min.js"/>'></script>
<script>
	$(function(){
		$('#load').on("click", function(){
			console.log("start");
			$('#test').oLoader({
			      backgroundColor:'#f00',
			      fadeInTime: 500,
			      fadeOutTime: 1000,
			      fadeLevel: 0.5
			 });
		});
	});
	
</script>
</head>
<body>
<div id ="test">
	<h1>This is index.jsp.</h1>
	<input type='submit' id='load' value='Show loader' />
	<input type='submit' id='hide' value='Hide loader' />
	</div>
</body>
</html>