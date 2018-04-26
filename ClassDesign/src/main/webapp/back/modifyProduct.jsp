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
	<form id="modifyProductBookForm" method="post" enctype="multipart/form-data" style="width: 70%;margin-left:100px;">
		<label>产品编号</label><input name="cpid" id="mcpid"readonly="readonly"/><br />
		<label>所属种类</label><input name="spcaid" id="mspcaid"placeholder="请输入所属种类" /><br />
		<label>书籍编号</label><input name="cbcpid" id="mcbcpid"placeholder="请输入编号" /><br />
		<label>产品名称</label><input name="cproductname" id="mcproductnamea"placeholder="请输入产品名称" /><br />
		<label>产品描述</label><textarea  rows="6" cols="30" name="cdescription" id="mcdescription"placeholder="请输入描述"></textarea><br />
		<label>添加时间</label><input name="caddtime" id="mcaddtime"placeholder="请输入时间" /><br />
		<label> 上传图片 </label> 
		<input type="file" name="picData" id="mpic" onchange="addPicPath(this)"/><br/>
		<img src="images/1.jpg" id="pic"><br/>
		<label>正常价格</label><input name="cnormalprice" id="mcnormalprice"placeholder="请输入价格" /><br />
		<label>网上特价</label><input name="cwsscprice" id="mcwsscprice"placeholder="请输入网上特价" /><br />
		<label>关键字</label><input name="ckeywords" id="mckeywords"placeholder="请输入关键字" /><br />
		<input type="submit" value="修改" onClick="modifyProduct()">
	</form>
	<script type="text/javascript" src="js/modifyProduct.js"></script>
</body>
</html>