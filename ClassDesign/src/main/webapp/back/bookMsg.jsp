<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/ClassDesign/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
</head>
<body>
	<form id="getBookInfoForm" method="post"enctype="multipart/form-data" style="width: 70%; margin: 0px auto">
		输入作者:<input name="cauthor" id="cauthor"><br>
		输入编号:<input name="cisbn" id="cisbn"><br>
		输入书名:<input name="bookname" id="bookname"><br>
		 <input type="button" value="查询书籍信息" onClick="getBookBy()">
	</form>    
	<div style="height:90%;">
	<table id="bookInfo"></table>
	</div>
	<script type="text/javascript" src="js/bookMsg.js"></script>
</body>
</html>