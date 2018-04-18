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
	<form id="getCatInfoForm" method="post" style="width: 70%; margin: 0px auto">
		输入目录名称:<input name="ccname" id="cuname"><br>
		 输入目录级别:<select id="clevels" class="easyui-combobox" name="levels" style="width: 178px;">
			<option value=""></option>
			<option value="一级目录">一级目录</option>
			<option value="二级目录">二级目录</option>
			<option value="三级目录">三级目录</option>
		</select>
		 <input type="button" value="查询目录信息" onClick="getCatroryBy()">
	</form>
	<table id="categoryInfo"></table>
	<script type="text/javascript" src="js/categoryMsg.js"></script>
</body>
</html>