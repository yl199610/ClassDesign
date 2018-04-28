<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/ClassDesign/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
</head>
<body>  
	<form id="addProductForm" method="post" enctype="multipart/form-data" style="width: 70%;margin-left:100px;">
		<input name="cimage" id="amcimage"  type="hidden"/>
		<input name="cdescription" id="amcdescription"  type="hidden" />
		<input name="cproductname" id="amcproductname"  type="hidden" />
		<label>目录级别</label>
		<select id="apspcaid" class="easyui-combobox" name="spcaid" style="width: 178px;">
		</select><br/><br/>
		<label>关联书籍</label>
		<select id="apcbcpid" class="easyui-combobox" name="cbcpid" style="width: 178px;">
		</select><br/><br/>
		<label>添加时间：</label><input name="caddtime" id="amacaddtime"  class="easyui-datebox" data-options="formatter:myformatter,parser:myparser"  placeholder="请输入时间" /><br /><br />
		<label>店下价格：</label><input name="cnormalprice" id="amcnormalprice" required="required" placeholder="请输入店下价格" /><br /><br />
		<label>网上价格：</label><input name="cwsscprice" id="amcwsscprice" required="required" placeholder="请输入网上价格" /><br /><br />
		<label>关键字：</label><input name="ckeywords" id="amckeywords" required="required" placeholder="请输入关键字" /><br /><br />
		<input type="submit" value="添加" onClick="addProduct()"/>
	</form>
	<script type="text/javascript" src="js/addProduct.js"></script>
</body>
</html>