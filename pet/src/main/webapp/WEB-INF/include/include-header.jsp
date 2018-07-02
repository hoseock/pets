<%@ page pageEncoding="utf-8"%>
 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title></title>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
 
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />

<!-- jQuery -->
<script src='<c:url value = "/js/jquery/jquery-3.3.1.js"/>'></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<head>
<style>
div,ul,ol,p,td,input,{color:#444;font-family:inherit;font-size:12px;font-weight:normal}
img,fieldset{border:none}
img,input{vertical-align:top}
menu,ul,ol,li{list-style:none}
hr{display:none}
a{text-decoration:none}
a:hover{text-decoration:underline}
button{border:0;background:none;cursor:pointer}
.hide{visibility:hidden;overflow:hidden;position:absolute;left:-1000em;width:0;height:0;font-size:0;line-height:0}
.root{min-width:960px}
#wrap {position:relative;text-align:left; }
#register {position:relative; margin:}
#container {margin: 0 auto; width: 960px;}
/* header */
#header{position: relative;height: 110px; }
#header h1{display: block;margin: 0;position: absolute;top: 0; left: 0;height:110px;overflow-y:hidden;}
#header.main h1{top:0;}
#header h1 img{display: block; vertical-align: top;}
.sub{position: relative;margin-left:1000px;top:0;}
.sub a span{font-size: 11px; top:0;}
#header{width:1100px; height:130px;  background:white;}
</style>
<script src='<c:url value = "/js/jquery/jquery-3.3.1.js"/>'></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script>
$(document).ready(function(){
    $("#register").on("click", function(e){ //글쓰기 버튼
        e.preventDefault();
        fn_register();
    });
    $("#login_sub").on("click", function(e){ //글쓰기 버튼
        e.preventDefault();
        fn_login();
    });
});
function fn_register(){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/file/openRegister.do' />");
    comSubmit.submit();
    
}function fn_login(){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/file/openLoginForm.do' />");
    comSubmit.submit();
}
</script>
</head>
<body>
<div class="sub">	
				<a href="#register" class="button" id="register"><span>회원가입</span></a>	
				<a href="#login" class="button" id="login_sub"><span>로그인</span></a>
	</div>
	<div id="header" class="main">
		<h1>
			<a title="anifinderhelper" href="/anifinder/" target="_top">
			<img border="0" src="/anifinder/resources/image/logo.jpg">
			</a>
		</h1>
	</div>
</body>