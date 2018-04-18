<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/ClassDesign/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
</head>
<body>
	<form id="getOrderInfoForm" method="post" style="width: 70%; margin: 0px auto">
		订单号:<input name="coid" id="coid"><br>
		用户ID:<input name="cordid" id="cordid"><br>
		<input type="button" value="查询订单信息" onClick="getOrderBy()">
	</form> 
	<table id="orderInfo"></table>
	<script type="text/javascript" src="js/orderMsg.js"></script>
</body>
</html>