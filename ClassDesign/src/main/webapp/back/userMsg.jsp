<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/ClassDesign/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
</head>
<body>
	<form id="getUserInfoForm" method="post"
		style="width: 90%; margin: 0px auto">
		输入用户编号:<input name="cuid" id="userId"><br> 输入用户姓名:<input
			name="cusername" id="username"> <input type="button"
			value="查询用户信息" onClick="getUserByName()">
	</form>
	<div style="height:90%;">
		<table id="userInfo"></table>
	</div>
	<script type="text/javascript" src="js/userMsg.js"></script>
</body>
</html>