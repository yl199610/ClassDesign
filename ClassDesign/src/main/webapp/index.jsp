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
<link type="text/css" rel="stylesheet" href="css/indexb.css">
<link type="text/css" rel="stylesheet" href="css/hotbookAppear.css">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
function logout(){
	$.post("cuser/logout",function(data) {
		$("#username1").html("");
		$(".header-login-reg").append('<li class="headspan"><a id="loginSpan" class="f-bold f-cheng" href="login.jsp">登录</a><span class="f-hui-line">| </span>&nbsp;<a id="regSpan" class="f-cheng f-bold" href="login.jsp">注册</a></li>');
	}, "json");	

}

$(document).ready(function() {
	var cusername="${sessionScope.loginUser.cusername}";
	if(cusername.length == 0||cusername==null || cusername==''|| cusername == undefined){
		$(".header-login-reg").append('<li class="headspan"><a id="loginSpan" class="f-bold f-cheng" href="login.jsp">登录</a><span class="f-hui-line">| </span>&nbsp;<a id="regSpan" class="f-cheng f-bold" href="login.jsp">注册</a></li>');
 	}
	var cuid="${sessionScope.loginUser.cuid}";
	$.post("cproduct/saveProductModel",{"ckeywords": cusername, "cproductname": null, "cwsscprice": null, "spcaid": null, "cpfree": null },function(data) {
		loadCarData(data);
		var totalAmount1=0;
		$("#ul_panel").find("tr").each(function () {
			$(this).find('td:eq(2) span').each(function() { 
				var total= parseInt($(this).text());
				totalAmount1+=total;
			})
		});
		$(".cndns-right-btn sup").html(totalAmount1);	
	}, "json");	
})
function get(){
	var cproductname = "?cproductname="+$("#bbcproductname").val();
	 window.open('page/showMsg.jsp'+cproductname);
}

function loadCarData(data){
	var cusername="${sessionScope.loginUser.cusername}";
	var text_html='';
	var totalMoney=0;
	$("#ul_panel").html("");
	for(var i=0;i<data.length;i++){
		if(data[i].ckeywords===cusername){
			text_html+='<tr class="'+"alltd"+(i)+'"><td  class="'+"product"+(i)+'">'+data[i].cproductname+'</td><td  class="'+"price"+(i)+'">'+data[i].cwsscprice+'</td><td class="thrid"><a class="red" onclick="reduce(\'\'+'+data[i].spcaid+','+data[i].cpfree+','+i+',this)">-</a><span class="'+"spand"+(i)+'">'+data[i].cpfree+' </span> ';
			text_html+='<a class="add" onclick="addNum(\'\'+'+data[i].spcaid+','+data[i].cpfree+','+i+',this)">+</a></td><td class="ontTotal'+(i)+'">￥'+(data[i].cwsscprice*data[i].cpfree)+'</td></tr>';
			totalMoney+=data[i].cwsscprice*data[i].cpfree;
			$("#totalMoney").text(totalMoney);
		}
	}
	$("#ul_panel").append(text_html); 
}
function addNum(spcaid,a,i,t){
	var textval = $(".spand"+(i)).html();
	var num2 = parseInt(textval)+1;
	$(".spand"+(i)).html(num2); 
	var onetotal2 = $(".price"+(i)).html();
	var onetotal = parseInt(onetotal2)*num2;
	$(".ontTotal"+(i)).html('￥'+onetotal)
	var one = $("#totalMoney").html();
	$("#totalMoney").text(parseInt(one)+parseInt(onetotal2));

	var cproductname= $(".product"+(i)).html();
	var cwsscprice= $(".price"+(i)).html();
	var cpfree =$(".spand"+(i)).html(); 
	var cpfree1 = ontTotal=$(".ontTotal"+(i)).html(); 
	var cpfree2 = cpfree1.substr(1);
	saveCar(cproductname,cwsscprice,spcaid,cpfree,cusername);
	
}

function reduce(spcaid,a,i,t){
	var totalAmount1=0;
	$("#ul_panel").find("tr").each(function () {
		$(this).find('td:eq(2) span').each(function() { 
			var total= parseInt($(this).text());
			totalAmount1+=total;
		})
	});
	var totalAmount=totalAmount1-1;
	$(".cndns-right-btn sup").html(totalAmount);
	var textval = $(".spand"+(i)).html();
	var num2 = parseInt(textval)-1;
	var onetotal2 = $(".price"+(i)).html();
	var one = $("#totalMoney").html();
	if(num2==0){
		num2=1;
		$(".alltd"+(i)).empty();
		$("#totalMoney").text(parseInt(one)-parseInt(onetotal2));
		saveCar(cproductname,cwsscprice,spcaid,cpfree);
		return;
	}
	var red1 = $(".ontTotal"+(i)).html();
	var red = red1.substr(1);
	var onetotal = parseInt(red)-parseInt(onetotal2);
	$(".ontTotal"+(i)).html('￥'+onetotal);
	
	$("#totalMoney").text(parseInt(one)-parseInt(onetotal2));
	$(".spand"+(i)).html(num2);

	var cproductname= $(".product"+(i)).html();
	var cwsscprice= $(".price"+(i)).html();
	var cpfree =$(".spand"+(i)).html(); 
	var cpfree1 = ontTotal=$(".ontTotal"+(i)).html(); 
	var cpfree2 = cpfree1.substr(1);
	saveCar(cproductname,cwsscprice,spcaid,cpfree,cusername);
	
}
function saveCar(cproductname,cwsscprice,spcaid,cpfree,ckeywords){
	$.post("cproduct/saveProductModel",{"ckeywords": ckeywords, "cproductname": cproductname, "cwsscprice": cwsscprice, "spcaid": spcaid, "cpfree": cpfree },function(data) {
		loadCarData(data);
	}, "json");	
}
function openCar() {
	if($("#div1")[0].style.display=="none"){
		$("#div1").attr("style", "display:block;");
	}else{
		$("#div1").attr("style", "display:none;");
	}
}
</script>
<style>

</style>
<title>图书商城：Such is life</title>
</head>
<body>
	<div id="header-bg"></div>
	<div id="header-bg"></div>
	<div id="header-nav">
		<ul class="header-login-reg">
			<li class="headspan">您好,欢迎<label id="username1" style="color: red">&nbsp;${sessionScope.loginUser.cusername}&nbsp;</label>光临网上书城
			</li>
			<li class="headspan"><a id="loginSpan" class="f-bold f-cheng"
				href="index.jsp"></a> <span class="f-hui-line"> </span>&nbsp; <a
				id="regSpan" class="f-cheng f-bold" href="index.jsp"></a></li>
		</ul>
		<div class="helpLink">
			<ul class="helpul">
				<input hidden="hidden" id="namesession" value="${sessionScope.loginUser.cusername}" />
				<input hidden="hidden" id="cuidsession" value="${sessionScope.loginUser.cuid}" />
				<li><a style="float:left" href="javascript:void(0)" onClick="logout()">退出登录&nbsp;&nbsp;</a></li>
				<li><a style="float:right" href="page/personCenter.jsp" target="_blank"  class="f-green">个人中心</a></li>
			</ul>
		</div>
	</div>
	<div class="bg-div">
		<h1 class="loge">
			<a href="./index.jsp"> <img alt="欢迎来到网上书城" src="images/log.jpg" /></a>
		</h1>
		<div class="searchinput d2">
			<form method="post" id="searchaForm" onSubmit="return false">
				<input type="text" name="cproductname" id="bbcproductname" placeholder="搜索从这里开始...">
				<button id="searbottom" onclick="get()" >搜索</button>
				<div class="searhot">
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
				<li><a href="#">首页</a></li>
				<li><a href="page/fav.jsp" target="_blank">我的收藏</a></li>
				<li><a href="page/carts.jsp" target="_blank">购物车结算</a></li>
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
				<h4 style="text-align: center;">公告</h4>
				<ul style="list-style: none;text-align: center;margin-top: 10px;">
					<li>123123</li>
					<li>广告位招商</li>
					<li><img src="images/gg.jpg"></li>
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
					<a id="goBy" href="page/carts.jsp" style="color:red; margin-left: -200px;">去结算</a>&nbsp;&nbsp;
					总价：<span id="totalMoney" style="margin-right: 8px; color: orange;">￥</span>
				</p>
			</div>
	
		<div class="cndns-right">
		<div class="cndns-right-meau meau-car">
			<a href="javascript:void(0)" onClick="openCar()"
				class="cndns-right-btn"> <span class="demo-icon"><img
					src="images/02index-banner-8.gif"></span> <sup>0</sup>
			</a>
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