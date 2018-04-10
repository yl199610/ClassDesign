<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/ClassDesign/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
</head>
<body> 
	<form>  
		<input name="cuid" id="userId">
		<input name="cusername" id="username">
		<input type="submit" value="查询" onClick="getUserByName()"/>
	</form>
	<table id="userInfo"></table>
	<script type="text/javascript" src="js/userMsg.js"></script>
</body>
</html>