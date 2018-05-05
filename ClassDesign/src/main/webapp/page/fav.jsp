<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<base href="/ClassDesign/">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/index.css">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<title>我的收藏</title>

<style>
#tableOrder{
	border-collapse: collapse;
	margin: 0 auto;
	text-align: center;
}

#tableOrder td, #tableOrder th{
	border: 1px solid #cad9ea;
	color: #666;
	height: 30px;
}

#tableOrder thead th {
	background-color: #CCE8EB;
	width: 100px;
}

#tableOrder tr:nth-child(odd){
	background: #fff;
}

#tableOrder tr:nth-child(even){
	background: #F5FAFA;
}
</style>
<script>
var cusername="${sessionScope.loginUser.cusername}";
var cuid="${sessionScope.loginUser.cuid}";
$(function() {
 	$(".mycar").attr('style', 'background-color:#FF2832');
 	$(document).ready(function() {
 		var cusername="${sessionScope.loginUser.cusername}";
 		if(cusername.length == 0||cusername==null || cusername==''|| cusername == undefined){
 			$(".header-login-reg").append('<li class="headspan"><a id="loginSpan" class="f-bold f-cheng" href="login.jsp">登录</a><span class="f-hui-line">| </span>&nbsp;<a id="regSpan" class="f-cheng f-bold" href="login.jsp">注册</a></li>');
 	 	}
 		var cuid="${sessionScope.loginUser.cuid}";
 	})
 	
 	
 	$.post("cfav/listuserfav?cuid="+cuid, function(data) {
/* 		$("#bodyOrder").append('<tr><td>''</td></tr>');
 */	}, "json");
 	
 	
 	
});





</script>

</head>
<body>
	<div id="header-bg"></div>
	<div id="header-nav">
		<ul class="header-login-reg">
			<li class="headspan">您好,欢迎<label style="color: red">&nbsp;${sessionScope.loginUser.cusername}&nbsp;</label>光临网上书城
			</li>
			<li class="headspan"><a id="loginSpan" class="f-bold f-cheng"
				href="index.jsp"></a> <span class="f-hui-line"> </span>&nbsp; <a
				id="regSpan" class="f-cheng f-bold" href="index.jsp"></a></li>
		</ul>
		<div class="helpLink">
			<ul class="helpul">
				<li><a target="_blank" class="f-green">个人中心</a></li>
			</ul>
		</div>
	</div>
	<div class="bg-div">
		<h1 class="loge">
			<a href="./index.jsp"> <img alt="欢迎来到网上书城" src="images/log.jpg" /></a>
		</h1>
	</div>
	
	
		<table id="tableOrder" align="center" border="1px"
						cellspacing="0px" cellpadding="0px" width="80%"
						style="margin-left: 100px;">
						<thead>
							<tr style="background-color: #dedede;">
								<th>商品名称</th>
								<th>出版社</th>
								<th>价格</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody align="center" id="bodyOrder">

						</tbody>
					</table>
	<div>
</div>
</body>
</html>