<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<base href="/ClassDesign/">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/right.css" />
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/productList.js"></script>

<title>图书商城：Such is life</title>
<script type="text/javascript">
	
</script>
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
	</div>
	<hr color="red" size="4" />
	<h4>核对订单信息</h4>

	<div id="orderInfo">
		
	</div>













		<div class="cndns-right">
			<div class="cndns-right-meau meau-car">
				<a href="javascript:void(0)" onClick="openCar()"
					class="cndns-right-btn"> <span class="demo-icon"><img
						src="images/02index-banner-8.gif"></span> <sup>0</sup>
				</a>
			</div>
			<div class="cndns-right-meau meau-sev">
				<a href="javascript:" class="cndns-right-btn"><img
					src="images/customer.jpg"> <span class="demo-icon"></span>
					<p>
						在线<br /> 客服
					</p> </a>
				<div class="cndns-right-box">
					<div class="box-border">
						<div class="sev-b">
							<h4>选择下列产品马上在线沟通：</h4>
							<ul id="zixunUl">
								<li><a href="javascript:void(0);">域名/主机</a></li>
								<div class="clear"></div>
							</ul>
						</div>
						<span class="arrow-right"></span>
					</div>
				</div>
			</div>
			<div class="cndns-right-meau meau-contact">
				<a href="javascript:" class="cndns-right-btn"> <span
					class="demo-icon"><img src="images/phone.jpg"></span>
					<p>
						客服<br /> 热线
					</p>
				</a>
				<div class="cndns-right-box">
					<div class="box-border">
						<div class="sev-t">
							<span class="demo-icon">&#xe902;</span>
							<p>
								400-123-4567<br /> <i>7*24小时客服服务热线</i>
							</p>
							<div class="clear"></div>
						</div>
						<span class="arrow-right"></span>
					</div>
				</div>
			</div>
			<div class="cndns-right-meau meau-code">
				<a href="javascript:" class="cndns-right-btn"> <span
					class="demo-icon"><img src="images/code.jpg"></span>
					<p>
						关注<br /> 微信
					</p>
				</a>
				<div class="cndns-right-box">
					<div class="box-border">
						<div class="sev-t">
							<img src="images/02index-2.jpg" /> <i>关注官方微信</i>
						</div>
						<span class="arrow-right"></span>
					</div>
				</div>
			</div>
			<div class="cndns-right-meau meau-top" id="top-back">
				<a href="javascript:" class="cndns-right-btn" onclick="topBack()">
					<span class="demo-icon">&#xe904;</span> <i>顶部</i>
				</a>
			</div>

		</div>



		<div class="foot" style="margin-top: 100px;">
			<p>&copy; 2017-2018 www.baidu.com&nbsp;&nbsp;&nbsp;等待继续更新</p>
			<p>名称：XX技术有限公司&nbsp;&nbsp;&nbsp;&nbsp;地址
				：湖南省衡阳市珠晖区&nbsp;&nbsp;&nbsp;&nbsp;电话 ：xxx-xxxx-xx</p>
			<p>营业执照注册号 ：2210100224343
				&nbsp;&nbsp;&nbsp;&nbsp;许可证：SP242423665968</p>
		</div>
		<script type="text/javascript">
			//置顶图标显示
			$('#top-back').hide()
			$(window).scroll(function() {
				if ($(this).scrollTop() > 350) {
					$("#top-back").fadeIn();
				} else {
					$("#top-back").fadeOut();
				}
			})
			//置顶事件
			function topBack() {
				$('body,html').animate({
					scrollTop : 0
				}, 300);
			}
		</script>
</body>
</html>