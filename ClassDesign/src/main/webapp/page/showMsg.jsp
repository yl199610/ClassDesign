<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<base href="/ClassDesign/">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/index.css">
<link type="text/css" rel="stylesheet" href="css/right.css">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/showMsg.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var cusername = "${sessionScope.loginUser.cusername}";
						if (cusername.length == 0 || cusername == null
								|| cusername == '' || cusername == undefined) {
							$(".header-login-reg")
									.append(
											'<li class="headspan"><a id="loginSpan" class="f-bold f-cheng" href="login.jsp">登录</a><span class="f-hui-line">| </span>&nbsp;<a id="regSpan" class="f-cheng f-bold" href="login.jsp">注册</a></li>');
						}
						var cuid = "${sessionScope.loginUser.cuid}";
					})
</script>
<style>
.bookList {
	width: 80%;
	height: 1200px;
	margin-left: 150px;
	float: left;
}
.bookList ul{
	width: 100%;
	height: 100%;
	float: left;
}
.bookList ul li{
	width: 100%;
	height: 19%;
	list-style: none;
	border: 1px solid blue;
}
.bookList li .cover{
	width: 20%;
	height: 80%;
	float:left;
}
.bookList li .infor {
    float: right;
    width: 79%;
    height:90%;
    
}
</style>
<title>图书商城：Such is life</title>
</head>
<body>
	<div id="header-bg"></div>
	<div id="header-nav">
		<ul class="header-login-reg">
			<li class="headspan">您好,欢迎<label style="color: red">&nbsp;${sessionScope.loginUser.cusername}&nbsp;</label>光临网上书城
			</li>
		</ul>
		<div class="helpLink">
			<ul class="helpul">
				<input hidden="hidden" id="namesession"
					value="${sessionScope.loginUser.cusername}" />
				<input hidden="hidden" id="cuidsession"
					value="${sessionScope.loginUser.cuid}" />
				<li><a target="_blank" class="f-green"
					href="page/personCenter.jsp">个人中心</a></li>
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
				<div class="bookNum">
					共有图书<span id="countProductTotal" style="color: blue"></span>本
				</div>
			</form>
		</div>
	</div>
	<img src="images/show.jpg">


<input hidden="hidden" id="namesession"
					value="${sessionScope.loginUser.cusername}" />
<input hidden="hidden" id="cuidsession"
					value="${sessionScope.loginUser.cuid}" />
	<div class="bookList">
		<ul id="bookulshow">
			<!-- <li>
				<div class="cover">
					<a href="/7712563.htm" target="_blank" title="新书--刺杀骑士团长(全二册)">
						<img src="http://image31.bookschina.com/2018/zuo/3/s7712563.jpg"
						alt="新书--刺杀骑士团长(全二册)"
						data-original="http://image31.bookschina.com/2018/zuo/3/s7712563.jpg"
						class="lazyImg">
					</a>
				</div>
				<div class="infor">
					<h2 class="name">
						<a href="/7712563.htm" target="_blank" title="新书--刺杀骑士团长(全二册)">新书--刺杀骑士团长(全二册)</a>
					</h2>
					<div class="otherInfor">
						<a
							href="/Books/allbook/allauthor.asp?stype=author&amp;sbook=(日)村上春树 著  林少华 译"
							target="_blank" class="author">(日)村上春树 著 林少华 译</a><i>&nbsp;&nbsp;/&nbsp;&nbsp;</i><span
							class="pulishTiem" title="出版时间">2018-03-01&nbsp;&nbsp;/&nbsp;&nbsp;</span><a
							href="/publish/5327/" target="_blank" class="publisher">上海译文</a>
					</div>
					<div class="priceWrap">
						<span class="sellPrice">¥75.5</span><span class="discount">(7.7折)</span><span
							class="priceTit">定价:</span>
						<del class="">¥98.0</del>
					</div>



					<p class="recoLagu">“我”36岁，美术科班出身，原本爱好抽象画，多年来为了养家糊口成为专业肖像画家。结婚六周年纪念日前，妻子毫无征兆地提出已有外遇，要求离婚，于是“我”独自离家开车在外游荡了一个半月，*终应好友雨田政彦之邀，住进小田原郊外山...</p>
					<div class="oparateButton">
						<a href="javascript:viod(0);"
							onclick="window.open('/shopcar/shoppingcart_add.aspx?book_id=7712563');"
							class="buyButton">加入购物车</a> <a href="javascript:viod(0);"
							onclick="AddFavoriteBook('7712563')" class="collectBtn">收藏</a>
					</div>
				</div>
			</li>
			<li>
				<div class="cover">
					<a href="/6567494.htm" target="_blank" title="解忧杂货店"> <img
						src="http://image12.bookschina.com/2014/20140316/s6567494.jpg"
						alt="解忧杂货店"
						data-original="http://image12.bookschina.com/2014/20140316/s6567494.jpg"
						class="lazyImg"></a>
				</div>
				<div class="infor">
					<h2 class="name">
						<a href="/6567494.htm" target="_blank" title="解忧杂货店">解忧杂货店</a>
					</h2>
					<div class="otherInfor">
						<a
							href="/Books/allbook/allauthor.asp?stype=author&amp;sbook=东野圭吾 (作者), 李盈春 (译者)"
							target="_blank" class="author">东野圭吾 (作者), 李盈春 (译者)</a><i>&nbsp;&nbsp;/&nbsp;&nbsp;</i><span
							class="pulishTiem" title="出版时间">2014-05-01&nbsp;&nbsp;/&nbsp;&nbsp;</span><a
							href="/publish/5442/" target="_blank" class="publisher">南海出版公司</a>
					</div>
					<div class="priceWrap">
						<span class="sellPrice">¥29.6</span><span class="discount">(7.5折)</span><span
							class="priceTit">定价:</span>
						<del class="">¥39.5</del>
					</div>



					<p class="recoLagu">僻静的街道旁有一家杂货店，只要写下烦恼投进店前门卷帘门的投信口，第二天就会在店后的牛奶箱里得到回答：因男友身患绝症，年轻女孩静子在爱情与梦想间徘徊；克郎为了音乐梦想离家漂泊，却在现实中寸步难行；少年浩介面临家庭巨变，挣...</p>
					<div class="oparateButton">
						<a href="javascript:viod(0);"
							onclick="window.open('/shopcar/shoppingcart_add.aspx?book_id=6567494');"
							class="buyButton">加入购物车</a> <a href="javascript:viod(0);"
							onclick="AddFavoriteBook('6567494')" class="collectBtn">收藏</a>
					</div>
				</div>
			</li> -->
		</ul>
		<div id="productpageDiv" style=" float: left; text-align: center; width: 100%; height: 30px;">42342432</div>
	</div>
	<div id="div_test" style="display: none; color: white; line-height: 35px; position: absolute; z-index: 100; left: 50%; top: 60%; margin-left: -75px; text-align: center; width: 150px; height: 35px; background-color: green; font-size: 12px;"></div>
	
	<div id="pagesize" style="text-align: center;"></div>
			<div id="div1" ondrop="drop()" ondragover="allowDrop(event)"
				style="VISIBILITY: hidden;">
				<div class="div_panel">
					<table border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<th>名称</th>
								<th>单价</th>
								<th>数量</th>
								<th>价格</th>
							</tr>
						</thead>
						<tbody id="ul_panel"></tbody>
					</table>
				</div>
				<p class="allMoney">
					<a id="goBy" href="page/carts.jsp" style="color:red; margin-left: -200px;">去结算</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					总价：<span id="totalMoney" style="margin-right: 8px; color: orange;">￥</span>
				</p>
			</div>
</body>
</html>