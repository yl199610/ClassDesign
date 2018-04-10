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
	<form id="modifyUser" enctype="multipart/form-data" style="width: 70%; margin: 0px auto">
		<input name="cuid" id="cuid" required="required" readonly="readonly"/><br />
		<input name="cusername" id="cusername" required="required" placeholder="请输入姓名" /><br />
		<input name="cemail" id="cemail" required="required" placeholder="请输入身份证" /><br />
		<input name="csex" id="csex" required="required" placeholder="请输入手机号" /><br />
		<input name="cphone" id="cphone" required="required" placeholder="请输入性别" /><br />
		<input name="clastloginip" id="clastloginip" required="required" placeholder="请输入生日" /><br />
		<label> 上传图片 </label> 
		<input type="file" name="picData"  onchange="chgPic(this)"/>
		<img src="images/1.jpg" id="pic">
		<input id="pppower" name="ppower" style="width: 145px;">
		<input name="applynum" id="applynum" required="required" placeholder="请输入地址" /><br />
		<input name="cbirthday" id="cbirthday" required="required" placeholder="请输入职务" /><br />
		<input type="button" value="修改" onClick="modifyUser()">
	</form>
	<script type="text/javascript" src="js/modifyUser.js"></script>
</body>
</html>