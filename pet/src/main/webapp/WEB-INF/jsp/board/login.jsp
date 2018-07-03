<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<%@ include file="/WEB-INF/include/include-menuBar.jsp"%>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);
.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #0b84ba;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #d9edf5;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #2196f3;
  text-decoration: none;
}

body {
  background: linear-gradient(to left, #FFFFFF, #FFFFFF);

  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}
</style>
<!-- jQuery -->
<script src='<c:url value = "/js/jquery/jquery-3.3.1.js"/>'></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script>
$(document).ready(function(){
    $("#register").on("click", function(e){ //ȸ�����Թ�ư
        e.preventDefault();
        fn_registerForm();
    });
    $("#login").on("click", function(e){ //�α��ι�ư
        e.preventDefault();
        fn_login();
    });
});
function fn_registerForm(){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/board/openRegisterForm.do' />");
    comSubmit.submit();
    
}
</script>
</head>
<body>
<div class="login-page">
  <div class="form">
    <form class="login-form">
      <input type="text" placeholder="username"/>
      <input type="password" placeholder="password"/>
      <button>login</button>
      <p class="message">Not registered? <a href="#register" class="button" id="register">Create an account</a></p>
    </form>
  </div>
</div>
</body>
</html>