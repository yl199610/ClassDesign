<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<base href="/ClassDesign/">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/index.css">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<title>图书商城：Such is life</title>
<style type="text/css">
.pro_pl_deta {
	padding-left: 10px;
}

h2 {
	font-size: 14px;
	margin-bottom: 5px;
}

#right .right_pro_pl .pro_pl_deta .pro_pl_note {
	background: #f3f3f3;
	padding: 10px 15px;
	border: 1px solid #ddd;
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<div id="header-bg"></div>
	<div id="header-nav">
		<ul class="header-login-reg">
			<li class="headspan">您好,欢迎<label style="color: red">&nbsp;${sessionScope.loginUser.cusername}&nbsp;</label>光临网上书城
			</li>
			<li class="headspan"><a id="loginSpan" class="f-bold f-cheng"
				href="index.jsp">==</a> <span class="f-hui-line">| </span>&nbsp; <a
				id="regSpan" class="f-cheng f-bold" href="index.jsp">==</a></li>
		</ul>
		<div class="helpLink">
			<ul class="helpul">
				<input hidden="hidden" id="namesession"
					value="${sessionScope.loginUser.cusername}" />
				<input hidden="hidden" id="cuidsession"
					value="${sessionScope.loginUser.cuid}" />
				<li><a target="_blank" class="f-green">帮助中心</a></li>
			</ul>
		</div>
	</div>
	<div class="bg-div">
		<h1 class="loge">
			<a href="./index.jsp"> <img alt="欢迎来到网上书城" src="images/log.jpg" /></a>
		</h1>
	</div>
	<div id="right">
		<div class="right_pro_pl">
			<div class="pro_pl_deta" style="float: left; margin-left: 240px;">
				<h2>发表评论</h2>
				<ul class="pro_pl_note" style="list-style: none">
					<li>欢迎您发表原创、与商品质量相关，对其它用户有参考价值的商品评价；</li>
					<li>您的评论通过审核后可以获得一定的积分奖励，好的评价可能会有额外的积分奖励！</li>
					<li>注：为保证评分真实公正，未购买图书的用户只能进行评论，不能评分，请见谅！</li>
				</ul>
				<form id="commentForm">
					<h2>
						<span class="infor_emp">*</span>评分<span class="infor_note">（5星代表很喜欢）</span>
					</h2>
					<div id="five_star" class="five_star"></div>

					<h2>
						评论标题<span class="infor_note">（长度在4-20个字之间）</span>
					</h2>
					<input id="pltitle" class="pl_title_box fLeft"
						placeholder="请输入评论标题"> <span id="titleError"
						style="display: none; color: #f00; float: left;">*
						标题长度须在4-20个字之间</span>
					<div style="clear: both;"></div>
					<h2>
						<span class="infor_emp">*</span>评论内容<span class="infor_note">（长度在5-1500个字之间）</span>
					</h2>
					<textarea id="pltxt" rows="15" cols="70"></textarea>
					<span id="contentError" style="color: rgb(255, 0, 0);">*
						内容长度须在5-1500个字之间</span>
					<div style="clear: both;"></div>
					<input
						style="position: absolute; display: block; width: 100px; height: 40px; background-color: #00b3ee; color: #fff; text-decoration: none; text-align: center; font: normal normal normal 16px/40px 'Microsoft YaHei'; cursor: pointer; border-radius: 4px;"
						id="comment" type="submit" value="评论" onclick="comment()">
				</form>
				<div class="clear"></div>
			</div>
		</div>
	</div>
</body>
</html>