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
<link type="text/css" rel="stylesheet" href="css/hotbookAppear.css">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<!-- <script type="text/javascript">
	var cusername="${sessionScope.loginUser.cusername}";
	var cuid="${sessionScope.loginUser.cuid}";
</script> -->
<title>图书商城：Such is life</title>
</head>
<body>
	<div id="header-bg"></div>
	<div id="header-nav">
		<ul class="header-login-reg">
			<li class="headspan">您好,欢迎<label style="color:red">&nbsp;${sessionScope.loginUser.cusername}&nbsp;</label>光临网上书城</li>
			<li class="headspan"><a id="loginSpan" class="f-bold f-cheng"
				href="index.jsp">==</a> <span
				class="f-hui-line">| </span>&nbsp; <a id="regSpan"
				class="f-cheng f-bold" href="index.jsp">==</a></li>
		</ul>
		<div class="helpLink">
			<ul class="helpul">
			<input hidden="hidden" id="namesession" value="${sessionScope.loginUser.cusername}"/>
			<input hidden="hidden" id="cuidsession" value="${sessionScope.loginUser.cuid}"/>
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
				<div class="bookNum">
					共有图书<span id="countProductTotal" style="color: blue"></span>本
				</div>
			</form>
		</div>
	</div>
	<div class="firstHead">
		<div class="menu">
			<ul>
				<li><a>首页</a></li>
				<li><a>我的收藏</a></li>
				<li><a>购物车</a></li>

			</ul>
		</div>

		<div id="type-menu">
			<h1
				style="background-color: #E60000; text-align: center; color: white;">图书分类</h1>
			<ul class="list_head">
				<li class="first">
					<div class="menu-attr"
						style="background-image: url(images/tubiao.jpg);">
						<span>青春图书</span>
					</div>
					<div class="menu-panel">
						<ul>
							<li>
								<h2>高考图书</h2>
								<div class="menu-list">
									<div class="menu-list-div">
										<span>|</span><a href="#">物理习题</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">生物</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">高考复习题</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">语文作文大全</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">政治时事</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">历年高考真题解析与答案</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">考试题</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">化学实验测试</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">生物测试</a>
									</div>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<h2>专辑</h2>
								<div class="menu-list">
									<div class="menu-list-div">
										<span>|</span><a href="#">郑智化专辑</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">台湾伍佰</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">大陆张含韵</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">刘德华</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">成龙</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">王菲</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">最新歌曲排行榜</a>
									</div>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<h2>生活图书</h2>
								<div class="menu-list">
									<div class="menu-list-div">
										<span>|</span><a href="#">领悟人生</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">天文地理</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">旅游百科</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">炒菜一本通</a>
									</div>
								</div>
								<div class="clear"></div>
							</li>
						</ul>
					</div>
				</li>
				<li>
					<div class="menu-attr"
						style="background-image: url(images/tubiao.jpg);">
						<span>文艺类</span>
					</div>
					<div class="menu-panel">
						<ul>
							<li>
								<h2>炒菜宝典</h2>
								<div class="menu-list">
									<div class="menu-list-div">
										<span>|</span><a href="#">领悟人生</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">天文地理</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">旅游百科</a>
									</div>
									<div class="menu-list-div">
										<span>|</span><a href="#">炒菜一本通</a>
									</div>
								</div>
								<div class="clear"></div>
							</li>
						</ul>
					</div>
				</li>
				<li>
					<div class="menu-attr">
						<span>励志书籍</span>
					</div>
					<div class="menu-panel">商品分类内容......</div>
				</li>
				<li>
					<div class="menu-attr">
						<span>生活体验</span>
					</div>
					<div class="menu-panel">商品分类内容......</div>
				</li>
				<li>
					<div class="menu-attr">
						<span>考试教育</span>
					</div>
					<div class="menu-panel">商品分类内容......</div>
				</li>
				<li>
					<div class="menu-attr">
						<span>人文社科</span>
					</div>
					<div class="menu-panel">商品分类内容......</div>
				</li>
				<li>
					<div class="menu-attr">
						<span>科技</span>
					</div>
					<div class="menu-panel">商品分类内容......</div>
				</li>
				<li class="last">
					<div class="menu-attr">
						<span>期刊其他</span>
					</div>
					<div class="menu-panel">商品分类内容......</div>
				</li>
			</ul>
		</div>
		<div id="picMsgConter">
			<div id="containerDiv">
				<div id="listDiv" style="left: -600px;">
					<img src="images/0.jpg" alt="1" /> <img src="images/1.jpg" alt="1" />
					<img src="images/2.jpg" alt="2" /> <img src="images/3.jpg" alt="3" />
					<img src="images/4.jpg" alt="4" /> <img src="images/4.jpg" alt="4" />
				</div>
				<div id="buttonsDiv">
					<span index="1" class="on"></span> <span index="2"></span> <span
						index="3"></span> <span index="4"></span> <span index="5"></span>
				</div>
			</div>

			<!-- 客服 -->
			<div id="top"></div>

			<div class="message">
				<h4>公告</h4>
				<ul>
					<li>123123</li>
					<li>weqweqw</li>
					<li>cxvx</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="secondDiv">
		<div id="command_top">
			<h3 class="active">热卖图书</h3>
			<h3>评论排行</h3>
			<h3>热门收藏</h3>
			<div id="hotBookDivFirst" style="display: block;">
				<ul id="hotDiv">
					<li><a href="/1076435.htm" target="_blank"><img
							src="images/hot1.jpg"></a></li>
					<li><a href="/1076435.htm" title="写给大家的欧美现代美术史"
						target="_blank">写给大家的欧美现代美术史</a></li>
					<li><span class="sellPrice">¥25.0</span>&nbsp;&nbsp;&nbsp; <span
						class="price">¥78.0</span></li>
				</ul>
				<ul id="hotDiv">
					<li><a href="/1076435.htm" target="_blank"><img
							src="images/hot1.jpg"></a></li>
					<li><a href="/1076435.htm" title="写给大家的欧美现代美术史"
						target="_blank">写给大家的欧美现代美术史</a> <span class="sellPrice">¥25.0</span><span
						class="price">¥78.0</span></li>
				</ul>
			</div>
			<div id="hotBookDivScoend"></div>
			<div id="hotBookDivThird"></div>
		</div>

		<div class="biaryCode">
			<img src="images/biaryCode.jpg"> <span style="color: red;">客服:在线时间9:00-17:00</span>
		</div>
	</div>
	<div class="hotbook">
		<div class="combookDiv">
			<h3 style="text-align: center; color: red; font-size: 24px;">书籍推荐</h3>
			<div class="imageAppear"></div>
			<div id="pageDiv" style="text-align: center;">
			</div>
		</div>
<div class="hot_sale">
		<div class="hot_saleInner">
			<div class="hotTitle">
				<h2 style="margin-bottom:10px;margin-top:10px;margin-left:60px;color:blue;">图书畅销榜</h2>
			</div>
			<div class="hotNav">
				
				<span class="arrow leftArrow"></span> <span class="arrow rightArrow"></span>
			</div>
			<div class="hotCon">
				<ul class="on">
					<!-- <li class="red"><i>01</i><em>&gt;</em>
					<p>我们悲惨的宇宙</p>
						<div class="bookCur">
							<div class="bpic">
								<a href="http://www.bookschina.com/5774948.htm" target="_blank"
									title="我们悲惨的宇宙"><img
									src="./中国图书网（中图网）：网上书店，尾货特色书店，5万种特价书低至2折！_files/s5774948.jpg"
									alt="我们悲惨的宇宙"></a>
							</div>
							<div class="bDetai">
								<div class="bName">
									<a href="http://www.bookschina.com/5774948.htm" target="_blank"
										title="我们悲惨的宇宙">我们悲惨的宇宙</a>
								</div>
								<div class="bPrice">
									<span class="sellPrice">￥9.9 </span><span class="price">￥36.0
									</span>
								</div>
							</div>
						</div></li>
					<li class="red"><i>02</i><em>&gt;</em>
					<p>枪与玫瑰的使用方法</p>
						<div class="bookCur">
							<div class="bpic">
								<a href="http://www.bookschina.com/6444156.htm" target="_blank"
									title="枪与玫瑰的使用方法"><img
									src="./中国图书网（中图网）：网上书店，尾货特色书店，5万种特价书低至2折！_files/s6444156.jpg"
									alt="枪与玫瑰的使用方法"></a>
							</div>
							<div class="bDetai">
								<div class="bName">
									<a href="http://www.bookschina.com/6444156.htm" target="_blank"
										title="枪与玫瑰的使用方法">枪与玫瑰的使用方法</a>
								</div>
								<div class="bPrice">
									<span class="sellPrice">￥9.9 </span><span class="price">￥32.8
									</span>
								</div>
							</div>
						</div></li>
					<li class="red"><i>03</i><em>&gt;</em>
					<p>尘世是唯一的天堂(名家笔下的生老病死)</p>
						<div class="bookCur">
							<div class="bpic">
								<a href="http://www.bookschina.com/2466676.htm" target="_blank"
									title="尘世是唯一的天堂(名家笔下的生老病死)"><img
									src="./中国图书网（中图网）：网上书店，尾货特色书店，5万种特价书低至2折！_files/s2466676.jpg"
									alt="尘世是唯一的天堂(名家笔下的生老病死)"></a>
							</div>
							<div class="bDetai">
								<div class="bName">
									<a href="http://www.bookschina.com/2466676.htm" target="_blank"
										title="尘世是唯一的天堂(名家笔下的生老病死)">尘世是唯一的天堂(名家笔下的生老病死)</a>
								</div>
								<div class="bPrice">
									<span class="sellPrice">￥5.9 </span><span class="price">￥28.0
									</span>
								</div>
							</div>
						</div></li>
				</ul>
			</div> -->
			<div class="moreHotSale">
				<a href="http://www.bookschina.com/24hour/" target="_blank">查看完整榜单&gt;&gt;</a>
			</div>
		</div>
	</div>
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