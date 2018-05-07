<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/ClassDesign/">
<meta charset="UTF-8">
<title>忘记密码</title>
<link type="text/css" rel="stylesheet" href="css/forgetPassword.css">
</head>
<body>
	<form action="cuser/forget" id="forgetForm" method="post">
		<p><input name="cusername" required="required" placeholder="请求输入用户名"/></p>
		<p><input type="email" name="cemail" required="required" placeholder="请求输入找出密码邮箱"/></p>
		<p><button>找回密码</button></p>
	</form>
</body>
</html>