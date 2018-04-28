<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/ClassDesign/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
</head>
<body>  
	<form id="addCategoryFormD" method="post"  style="width: 70%;margin-left:200px;margin-top:100px;">
		<label>目录级别</label>
		<select id="amlevels" class="easyui-combobox" name="levels" style="width: 178px;">
			<option value=""></option>
			<option value="一级目录">一级目录</option>
			<option value="二级目录">二级目录</option>
			<option value="三级目录">三级目录</option>
		</select><br><br />
		<label>目录名称</label><input name="ccname" id="amcauthor" required="required" placeholder="请输入目录名称" /><br /><br />
		<label>目录描述</label><input name="description" id="amcisbn" required="required" placeholder="请输入目录描述" /><br /><br />
		<label>父目录名</label><input name="parentid" id="ambookname" placeholder="请选择父目录" /><br /><br />
		<input type="submit" value="添加" onClick="addCategory()"/>
	</form>
	<script type="text/javascript" src="js/addCategory.js"></script>
</body>
</html>