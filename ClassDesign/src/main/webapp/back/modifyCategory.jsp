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
	<form id="modifyCateForm" method="post" enctype="multipart/form-data" style="width: 70%; margin-top:60px;margin-left:140px;">
		<label>目录编号</label><input name="ccid" id="mccid" required="required" readonly="readonly"/><br />
		<label>目录级别</label><input name="levels" id="mlevels" required="required" placeholder="请输入姓名" /><br />
		<label>目录名称</label><input name="ccname" id="mccname" required="required" placeholder="请输入身份证" /><br />
		<label>目录描述</label><input name="description" id="mdescription" required="required" placeholder="请输入手机号" /><br />
		<label>父目录</label><input name="parentid" id="mparentid" required="required" placeholder="请输入性别" /><br />
		<input type="submit" value="修改" onClick="modifyCate()">
	</form>
	<script type="text/javascript" src="js/modifyCategory.js"></script>
</body>
</html>