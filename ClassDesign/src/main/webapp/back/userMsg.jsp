<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/ClassDesign/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
</head>
<body> 
	<form id="getUserInfoForm" method="post" style="width: 70%; margin: 0px auto">
		输入用户编号:<input name="cuid" id="userId"><br>
		输入用户姓名:<input name="cusername" id="username"><br>
		<input type="button" value="查询用户信息" onClick="getUserByName()">
	</form>
	<table id="userInfo"></table>
	<script type="text/javascript" src="js/userMsg.js"></script>
</body>
</html>