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
* {
	margin: 0 auto;
	padding: 0 auto;
}

body {
	margin: 0px auto;
	padding: 0px;
	width: 1365px;
	overflow-x: hidden;
}

#bigproductDiv {
	width: 80%;
	height: 1000px;
	margin-left: 100px;
	border: 1px solid red;
}

#topproductDiv {
	width: 100%;
	height: 50%;
	border: 1px solid green;
}

#topproductOne {
	width: 25%;
	height: 80%;
	float: left;
	text-align: center;
}

#topproductTwo {
	width: 50%;
	height: 100%;
	border: 1px solid blue;
	float: left;
}

#topproductThree {
	width: 24%;
	height: 100%;
	border: 1px solid orange;
	float: left;
}

.padLeft10 {
	width: 90%;
	height: 46%;
	border: 1px solid orange;
}

.padLeft10 h1 {
	line-height: 24px;
	margin-top: 7px;
	font-family: 'Microsoft YaHei';
	font-size: 18px;
	color: #333333;
}

.padLeft10 .recomand {
	line-height: 24px;
	color: #e60000;
	margin-top: 7px;
	overflow: hidden;
}

.padLeft10 div {
	font-size: 14px;
	line-height: 20px;
}

#showPrice {
	width: 90%;
	height: 20%;
	background-color: #fff4f8;
	text-align: center;
	line-height: 30px;
}

#addCar {
	width: 90%;
	height: 30%;
	border: 1px solid orange;
}
#addCarfirst{
    width: 160px;
    line-height: 32px;
    text-indent: 45px;
    color: #fff;
    font-size: 16px;
    font-family: 'Microsoft YaHei';
    background: url(images/childredSprit.png) no-repeat;
    text-decoration: none;
}
</style>

</head>
<body>
	<img src="images/topList.png" />
	<div id="header-bg"></div>
	<div id="header-nav">
		<ul class="header-login-reg">
			<li class="headspan">您好,欢迎光临网上书城</li>
			<li class="headspan"><a id="loginSpan" class="f-bold f-cheng"
				href="http://login.99read.com/Sign-in.aspx"> 登录</a> <span
				class="f-hui-line">| </span>&nbsp; <a id="regSpan"
				class="f-cheng f-bold" href="http://login.99read.com/register.aspx">注册</a></li>
		</ul>
		<div class="helpLink">
			<ul class="helpul">
				<li><a target="_blank" class="f-green"
					href="http://www.99read.com/Help/Index.aspx"> 帮助中心</a></li>
			</ul>
		</div>
	</div>
	<div class="bg-div">
		<h1 class="loge">
			<a href="./index.jsp"> <img alt="欢迎来到网上书城" src="images/log.jpg" /></a>
		</h1>
		<div class="searchinput d2">
			<form>
				<input type="text" placeholder="搜索从这里开始...">
				<button type="submit">搜索</button>
				<div class="searhot">
					<h7>热门搜索:</h7>
					<span>刘德华</span><span>李宗盛</span>
				</div>
			</form>
		</div>
	</div>
	<hr color="red" size="4" />
	<div class="getdest">
		<a href="./index.jsp">中国图书网</a>&gt;<a href="./index.jsp">一级标题</a>&gt;<a
			href="./index.jsp">二级标题</a>&gt;<a href="./index.jsp">三级标题</a>&gt;<span>书名</span>
	</div>

	<div id="bigproductDiv">
		<div id="topproductDiv">
			<div id="topproductOne">
				<img src="images/ts.jpg" width="80%" height="80%"
					style="margin-top: 50px;">
			</div>
			<div id="topproductTwo">
				<div class="padLeft10">
					<h1>谈美书简——语文新课标必读丛书</h1>
					<p class="recomand">语文新课标必读丛书</p>
					<div class="author">
						<span>作者：</span><a
							href="/Books/allbook/allauthor.asp?stype=author&amp;sbook=朱光潜"
							target="_blank">朱光潜</a>
					</div>
					<div class="publisher">
						<span>出版社：</span><a href="/publish/80115/" target="_blank">当代世界出版社</a><span>出版时间：</span><i>2003-09-01</i>
					</div>
					<div class="series">
						<span>所属丛书：</span> <a href="/congshu/56570/" target="_blank"
							style="padding-right: 5px;">语文新课标必读丛书（译林出版）</a>
					</div>
					<div class="otherInfor">
						<span>开本：</span> <em>大32开</em> <span>页数：</span> <i>118</i>
					</div>
					<div class="startWrap">
						<span>读者评分：</span><em>4.6分</em><i class="one"></i><i class="one"></i><i
							class="one"></i><i class="one"></i><i class="half"></i><a
							href="#tabookReco">98条评论</a>
					</div>
					<div class="sort">
						<span>排名：</span><a href="/24hour/63000000/" target="_blank">中小学教辅销量榜</a>
						<b>第<i>2</i>位
						</b>
					</div>
				</div>

				<div id="showPrice">
					<div class="priceWrap">
						<span class="sellPriceTit">中 图 价:</span><span class="sellPrice"><i>¥</i>1.7</span><span
							class="discount">(2.1折)</span> <span class="priceTit">定价:</span>
						<del class="price">¥8.0 </del>
						<a href="/RegUser/login.aspx?url=/522126.htm" target="_blank">登录后可看到会员价</a>
						<div>促销活动</div>
					</div>
				</div>
				<div id="addCar">
					<div id="addCarfirst">
						<a style="">加入购物车</a>
					</div>
					<div id="addCarTwo"></div>
					<div id="addCarThree"></div>
				</div>
			</div>
			<div id="topproductThree"></div>
		</div>
		<div id="bottomproductDiv"></div>
	</div>










	<div class="foot">
		<p>&copy; 2017-2018 www.baidu.com&nbsp;&nbsp;&nbsp;等待继续更新</p>
		<p>名称：XX技术有限公司&nbsp;&nbsp;&nbsp;&nbsp;地址
			：湖南省衡阳市珠晖区&nbsp;&nbsp;&nbsp;&nbsp;电话 ：xxx-xxxx-xx</p>
		<p>营业执照注册号 ：2210100224343
			&nbsp;&nbsp;&nbsp;&nbsp;许可证：SP242423665968</p>
	</div>

</body>
</html>