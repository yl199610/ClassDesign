<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<base href="/ClassDesign/">
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/manageLogin.css">
<title>管理员登录界面</title>
</head>
<body>
	<div class="wrap">
		<div class="container">
			<h1>Welcome&nbsp;Admin</h1>
			<form id="aloginForm" action="cadmin/alogin" method="post">
				<p style="color: red;margin-left: 46%;"><label>${errorMsg }&nbsp;</label></p><c:remove var="errorMsg" scope="session"/>
				<input name="caname" type="text" placeholder="user login"  required="required"/>
				<input name="capwd" type="password" placeholder="password"  required="required"/>
				<input type="submit" value="Login" />
			</form>
		</div>
		<ul>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
</body>
</html>