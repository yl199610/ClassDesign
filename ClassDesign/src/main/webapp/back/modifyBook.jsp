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
	<form id="modifyBookForm" method="post" enctype="multipart/form-data" style="width: 70%;margin-left:100px;">
		<label>书籍编号</label><input name="cbid" id="mcbid" required="required" readonly="readonly"/><br />
		<label>编写作者</label><input name="cauthor" id="mcauthor" required="required" placeholder="请输入作者" /><br />
		<label>书籍ISBN</label><input name="cisbn" id="mcisbn" required="required" placeholder="请输入ISBN" /><br />
		<label>书籍名称</label><input name="bookname" id="mbookname" required="required" placeholder="请输入书籍" /><br />
		<label>出版时间</label><input name="cpublishtime" id="mcpublishtime" required="required" placeholder="请输入出版时间" /><br />
		<label>出版社</label><input name="cpublishing" id="mcpublishing" required="required" placeholder="请输入出版社" /><br />
		<label> 上传图片 </label> 
		<input type="file" name="picData" id="mpic" onchange="addPicPath(this)"/><br/>
		<img src="images/1.jpg" id="pic"><br/>
		<label>书籍字数</label><input name="cwordnumber" id="mcwordnumber" required="required" placeholder="请输入字数" /><br />
		<label>书籍页数</label><input name="ctotalpage" id="mctotalpage" required="required" placeholder="请输入页数" /><br />
		<label>书籍介绍</label><textarea rows="6" cols="30" name="cintroduce" id="mcintroduce" required="required" placeholder="请输入介绍" ></textarea><br />
		<label>书籍目录</label><textarea  rows="6" cols="30" name="catalogue" id="mcatalogue" required="required" placeholder="请输入目录" ></textarea><br />
		<label>edition</label><input name="edition" id="medition" required="required" placeholder="请输入职务" /><br />
		<input type="submit" value="修改" onClick="modifyBook()">
	</form>
	<script type="text/javascript" src="js/modifyBook.js"></script>
</body>	
</html>