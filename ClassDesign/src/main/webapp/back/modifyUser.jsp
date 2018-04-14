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
	<form id="modifyUserForm" method="post" enctype="multipart/form-data" style="width: 70%; margin-top:60px;margin-left:140px;">
		<label>用户编号</label><input name="cuid" id="mcuid" required="required" readonly="readonly"/><br />
		<label>用户姓名</label><input name="cusername" id="mcusername" required="required" placeholder="请输入姓名" /><br />
		<label>用户邮箱</label><input name="cemail" id="mcemail" required="required" placeholder="请输入身份证" /><br />
		<label>用户性别</label><input name="csex" id="mcsex" required="required" placeholder="请输入手机号" /><br />
		<label>用户电话</label><input name="cphone" id="mcphone" required="required" placeholder="请输入性别" /><br />
		<label>登录IP</label><input name="clastloginip" id="mclastloginip" required="required" placeholder="请输入生日" /><br />
		<label> 上传图片 </label> 
		<input type="file" name="picData" id="mpic" onchange="addPicPath(this)"/><br/>
		<img src="images/1.jpg" id="pic"><br/>
		<label>支付账号</label><input name="applynum" id="mapplynum" required="required" placeholder="请输入地址" /><br />
		<label>用户生日</label><input name="cbirthday" id="mcbirthday" required="required" placeholder="请输入职务" /><br />
		<input type="submit" value="修改" onClick="modifyUser()">
	</form>
	<script type="text/javascript" src="js/modifyUser.js"></script>
</body>
</html>