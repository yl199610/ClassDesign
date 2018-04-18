<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/ClassDesign/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
</head>
<body>   
	<form id="getFavInfoForm" method="post" style="width: 70%; margin: 0px auto">
		用户ID:<input name="cuserid" id="cuserid"><br>
		产品ID:<input name="cfp" id="cfp"><br>
		输入状态::<select id="cfstatus" class="easyui-combobox" name="cfstatus" style="width: 178px;">
			<option value=""></option>
			<option value="收藏">收藏</option>
			<option value="不收藏">不收藏</option>
		</select><br>
		 <input type="button" value="查询收藏信息" onClick="getFavBy()">
	</form> 
	<table id="favInfo"></table>
	<script type="text/javascript" src="js/favMsg.js"></script>
</body>
</html>