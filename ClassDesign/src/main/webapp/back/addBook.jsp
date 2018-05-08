<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/ClassDesign/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
</head>
<body>  
<form ENCTYPE="multipart/form-data" name="importForm" id="importForm"  accept-charset="utf-8" method="post">
    <input type="file" name="file"/>
    <input type="submit" name="导入" value="导入数据到数据库" onClick="addBookExcel()"/>
</form>
	<form id="addBookForm" method="post" enctype="multipart/form-data" style="width: 70%;margin-left:200px;margin-top:10px;">
		<label>图书作者</label><input name="cauthor" id="amcauthor" required="required" placeholder="图书作者" /><br /><br />
		<label> 图书图片 </label> 
		<input type="file" name="picData" id="mpic" onchange="addPicPath(this)"/><br/>
		<img src="" id="pic"><br/>
		<label>图书ISBN</label><input name="cisbn" id="cisbn" required="required" placeholder="请输入图书ISBN" /><br /><br />
		<label>图书名称</label><input name="bookname" id="bookname" required="required" placeholder="请输入图书名称" /><br /><br />
		<label>出版时间</label><input name="cpublishing" id="cpublishing"  class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" placeholder="请输入出版时间" /><br /><br />
		<label>出版社：</label><input name="cpublishtime" id="cpublishtime" required="required" placeholder="请输入出版社" /><br /><br />
		<label>总字数：</label><input name="cwordnumber" id="cwordnumber" required="required" placeholder="请输入总字数" /><br /><br />
		<label>总页数：</label><input name="ctotalpage" id="ctotalpage" required="required" placeholder="请输入总页数" /><br /><br />
		<label>书籍简介</label><input name="cintroduce" id="cintroduce" required="required" placeholder="请输入书籍简介" /><br /><br />
		<label>书籍目录</label><input name="catalogue" id="catalogue" required="required" placeholder="请输入书籍目录" /><br /><br />
		<label>印刷次数</label><input name="edition" id="edition" required="required" placeholder="请输入印刷次数" /><br /><br />
		<input type="submit" value="添加" onClick="addBook()"/>
	</form>
	<script type="text/javascript" src="js/addBook.js"></script>
</body>
</html>