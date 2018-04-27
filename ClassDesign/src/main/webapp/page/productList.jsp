<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<base href="/ClassDesign/">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/index.css">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/productList.js"></script>
<title>图书商城：Such is life</title>
<style type="text/css">
* {
	margin: 0 auto;
	padding: 0 auto;
}

body {
	margin: 0px auto;
	padding: 0px;
	overflow-x: hidden;
}

#bigproductDiv {
	width: 80%;
	margin-left: 100px;
}

#topproductDiv {
	width: 100%;
	height: 400px;
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
	float: left;
}

#topproductThree {
	width: 24%;
	height: 100%;
	float: left;
}

.padLeft10 {
	width: 90%;
	height: 46%;
}

.padLeft10 h1 {
	line-height: 24px;
	margin-top: 7px;
	font-family: 'Microsoft YaHei';
	font-size: 18px;
	color: #333333;
}
/* 
.padLeft10 .recomand {
	line-height: 24px;
	color: #e60000;
	margin-top: 7px;
	overflow: hidden;
} */
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

#addCarBig {
	width: 100%;
	height: 40%;
}

#addCarpriduct {
	width: 160px;
	line-height: 32px;
	text-indent: 45px;
	color: #fff;
	font-size: 16px;
	font-family: 'Microsoft YaHei';
	background: url(images/childredSprit.png) no-repeat;
	text-decoration: none;
	margin-left: 0px;
	margin-top: 6px;
	float: left;
	border-radius: 10px;
}

#addfavpriduct {
	width: 120px;
	line-height: 32px;
	text-indent: 45px;
	color: #fff;
	font-size: 16px;
	font-family: 'Microsoft YaHei';
	background-color: #63b7ff;
	text-decoration: none;
	margin-left: 10px;
	margin-top: 6px;
	float: left;
	border-radius: 10px;
}

#bottomproductDiv {
	width: 90%;
	margin-left: 90px;
}

#productleftDiv {
	width: 23%;
	height: 1100px;
	float: left;
}

#recommendDiv {
	width: 100%;
	height: 50%;
}

#historyDiv {
	width: 100%;
	height: 50%;
}

#productRightDiv {
	width: 76%;
	float: left;
}

#productbookmsg {
	width: 100%;
	height: 150px;
}

#intrducebookmsg {
	width: 100%;
	height: 150px;
}

#commentsMsg {
	width: 100%;
	height: 600px;
}

#bookowner li {
	float: left;
	width: 276px;
	color: #666666;
	color: black;
	font-size: 14px;
}

#commentsMsg {
	display: block;
	list-style-type: disc;
	-webkit-margin-before: 1em;
	-webkit-margin-after: 1em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
	-webkit-padding-start: 40px;
}

#listLeft #listRight {
	display: block;
}

#commentsMsg li {
	display: list-item;
	text-align: -webkit-match-parent;
}

.listLeft {
	padding-top: 16px;
	float: left;
	width: 80%;
}

.theme {
	float: left;
	width: 600px;
	height: 22px;
	line-height: 22px;
	overflow: hidden;
	color: #666666;
	font-weight: bold;
}

.con p {
	color: #666666;
	font-size: 14px;
}

.listRight {
	float: right;
	width: 18%;
	margin-top: 20px;
}

.userIcon1 {
	width: 100px;
	height: 130px;
	text-align: center;
}

.userIcon1 a {
	color: red;
	margin-bottom: -1220px;
}
.pro_r_b {
    float: right;
    margin-right: 10px;
    background: #f3f3f3;
    border: solid 1px #e6e6e6;
    padding: 15px;
    text-align: center;
    margin-top: 30px;
}
.pro_r_c {
    display: block;
    background: url(images/problem.gif) no-repeat;
    width: 110px;
    margin: 0 auto;
    padding-left: 20px;
}
.pro_r_x {
    display: block;
    background: url(images/add.gif) no-repeat;
    width: 128px;
    height: 33px;
    margin: 5px auto;
}
</style>

</head>
<body>
	<img src="images/topList.png" />
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
				<img id="bigImageShow" src="images/ts.jpg" width="80%" height="80%"
					style="margin-top: 50px;">
			</div>
			<div id="topproductTwo">
				<div class="padLeft10">
					<h1>谈美书简——语文新课标必读丛书</h1>
					</br>
					<!-- 					<p class="recomand">语文新课标必读丛书</p>
 -->
					<div class="author">
						<span>作者：</span><span id="authBymy" style="color: red;"></span>
					</div>
					<div class="publisher">
						<span>出版社：</span><a style="color: red;"></a>
					</div>
					<div class="publishertime">
						<span>出版时间：</span><i style="color: red;"></i>
					</div>
					<div class="otherInfor">
						<span>开本：</span> <em style="color: red;"></em>
					</div>
					<div class="otherInfor2">
						<span>页数：</span> <i style="color: red;"></i>
					</div>
					<!-- <div class="startWrap">
						<i class="one"></i><i class="one"></i><i
							class="one"></i><i class="one"></i><i class="half"></i><a
							href="#tabookReco">98条评论</a>
					</div>
					<div class="sort">
						<span>排名：</span><a href="/24hour/63000000/" target="_blank">中小学教辅销量榜</a>
						<b>第<i>2</i>位
						</b>
					</div> -->
				</div>

				<div id="showPrice">
					<div class="priceWrap">
						<span class="sellPriceTit">中 图 价:&nbsp;&nbsp;</span><i>¥&nbsp;</i><span
							class="sellPrice">1.7</span><span class="discount"></span> <span
							class="priceTit">定价:&nbsp;</span> <i>¥&nbsp;</i>
						<del class="price">8.0 </del>
						<a href="/RegUser/login.aspx?url=/522126.htm" target="_blank"></a>
						<div>促销活动</div>
					</div>
				</div>
				<div id="addCar">
					<div id="addCarBig">
						<a id="addCarpriduct" href="page/car.jsp" target="_blank"> <span>加入购物车</span>
						</a> <a id="addfavpriduct" href="#"> <span>收藏</span>
						</a>
					</div>

					<div id="addCarThree">
						<span style="color: #E60000;">温馨提示</span>：5折以下图书主要为出版社尾货，大部分为全新，个别图书品相8-9成新、切口
						有划线标记、光盘等附件不全
					</div>
				</div>
			</div>
			<div id="topproductThree">
				<h3>本类五星好评</h3>
				<ul>
					<li>231321</li>
					<li>231321</li>
					<li>231321</li>
					<li>231321</li>
					<li>231321</li>
				</ul>
			</div>
		</div>
		<div id="bottomproductDiv">
			<div id="productleftDiv">
				<h3 style="background-color: #f3f3f3;">图书推荐</h3>
				<hr>
				<div id="recommendDiv"></div>
				<h3>浏览历史</h3>
				<hr>
				<div id="historyDiv"></div>
			</div>
			<div id="productRightDiv">
				<h3
					style="color: white; line-height: 40px; height: 40px; background-color: #3b3b3b">
					图书详情&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: red;">商品评价</a>
				</h3>
				<div id="productbookmsg" style="margin-top: 10px;">
					<h3
						style="line-height: 40px; height: 40px; background-color: #f5f5f5">版权信息</h3>
					<ul id="bookowner"
						style="list-style: none; line-height: 22px; margin-top: 17px; overflow: hidden; padding-left: 22px;">
						<li id="first1"></li>
						<li id="first2"></li>
						<li id="first3"></li>
						<li id="first4"></li>
						<li id="first5"></li>
						<li id="first6"></li>
						<li id="first7"></li>
					</ul>
				</div>
				<div id="intrducebookmsg">
					<h3
						style="line-height: 40px; height: 40px; background-color: #f5f5f5">图书简介</h3>
					<p></p>
				</div>
				<div id="commentsMsg">
					<h3
						style="margin-left: -40px; line-height: 40px; height: 40px; background-color: #f5f5f5">图书评价</h3>
					<div class="tabookRecoCon">
						<div class="recoList">
							<ul style="list-style: none; line-height: 40px;"
								id="commentsDivcar">
							</ul>

							<div class="pro_r_b">
								<h3>写评论，赢评论积分，快快行动吧！</h3>
								<a class="pro_r_c"
									href="productList.jsp"
									target="_blank">如何参与评论和打分</a> <a class="pro_r_x"
									href="page/Comment.jsp"></a>
							</div>
						</div>
					</div>

				</div>
				<div id="productpageDiv"
					style="margin-top: 20px; float: left; text-align: center; width: 100%; height: 30px;">dfsd</div>
			</div>
		</div>
	</div>

	<div class="foot" style="margin-top: 100px;">
		<p>&copy; 2017-2018 www.baidu.com&nbsp;&nbsp;&nbsp;等待继续更新</p>
		<p>名称：XX技术有限公司&nbsp;&nbsp;&nbsp;&nbsp;地址
			：湖南省衡阳市珠晖区&nbsp;&nbsp;&nbsp;&nbsp;电话 ：xxx-xxxx-xx</p>
		<p>营业执照注册号 ：2210100224343
			&nbsp;&nbsp;&nbsp;&nbsp;许可证：SP242423665968</p>
	</div>

</body>
</html>