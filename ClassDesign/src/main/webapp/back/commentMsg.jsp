<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/ClassDesign/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
</head>
<body>
	<form id="getCommentInfoForm" method="post" style="width: 70%; margin: 0px auto">
		用户ID:<input name="cuserid" id="ccuserid"><br>
		产品ID:<input name="cfp" id="ccfp"><br>
		 <input type="button" value="查询评论信息" onClick="getCommentBy()">
	</form> 
	<table id="commentInfo"></table>
	<script type="text/javascript" src="js/commentMsg.js"></script>
</body>
</html>