<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/ClassDesign/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
</head>
<body>  
	<form id="getProInfoForm" method="post" style="width: 70%; margin: 0px auto">
		输入名称:<input name="cproductname" id="mcproductname"><br>
		 <input type="button" value="查询产品信息" onClick="getProductBy()">
	</form> 
	<div style="height:90%;">
	<table id="productInfo"></table></div>
	<script type="text/javascript" src="js/productMsg.js"></script>
</body>
</html>