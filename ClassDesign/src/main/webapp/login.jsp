<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>登录页面</title>
<link rel="stylesheet" type="text/css" href="js/login_files/denglu.css">
<link rel="stylesheet" type="text/css" href="js/login_files/zhuce.css">
<link rel="stylesheet" type="text/css" href="js/login_files/public.css">
<script type="text/javascript"
	src="js/login_files/jquery-1.4.2.min.js.下载"></script>
<script type="text/javascript"
	src="js/login_files/jquery.SuperSlide.2.1.js.下载"></script>
</head>
<body>
	<!--整体内容开始-->
	<div class="denglu">
		<!--第一部分内容开始-->
		<div class="denglu-first1">
			<div class="denglu-first1-content">
				<div class="denglu-first1-content-left">
					<div class="logo">
						<img src="images/log.jpg">
					</div>
					<div class="biaoti">
						<p>用户登录界面</p>
					</div>
				</div>
				<div class="denglu-first1-content-right">
					<p class="jiamengrexian">热线</p>
					<p class="dianhua">400-4357-570</p>
				</div>
			</div>
		</div>
		<!--第一部分内容结束-->
		<style>
.carousel {
	width: 750px;
	height: 430px;
	float: left;
}
/* 本例子css */
.focusBox {
	margin: 0 auto;
	position: relative;
	width: 750px;
	height: 430px;
	margin-top: 50px;
	padding: 5px;
	background: #f5f5f5;
	overflow: hidden;
}

.focusBox .hd {
	height: 22px;
	position: absolute;
	z-index: 1;
	bottom: 10px;
	right: 10px;
	overflow: hidden;
}

.focusBox .hd ul {
	float: right;
	overflow: hidden;
}

.focusBox .hd li {
	width: 22px;
	height: 22px;
	line-height: 22px;
	text-align: center;
	background: #999;
	color: #fff;
	font-family: Arial;
	float: left;
	margin: 0 1px;
	display: inline;
	-webkit-border-radius: 22px;
	-moz-border-radius: 22px;
	border-radius: 22px;
	cursor: pointer;
}

.focusBox .hd li.on {
	background: #c00;
}

.focusBox .bd li {
	vertical-align: middle;
}

.focusBox .bd li img {
	width: 750px;
	height: 430px;
	display: block;
	background: url(img/loading.gif) center center no-repeat;
}
</style>
		<!--第二部分内容开始-->
		<div class="denglu-frist2">
			<div class="denglu-first2-content">
				<div class="denglu-first2-content-top">
					<div class="carousel">
						<div class="focusBox">
							<div class="bd">
								<div class="tempWrap"
									style="overflow: hidden; position: relative; height: 430px">
									<ul
										style="top: -860px; position: relative; padding: 0px; margin: 0px;">
										<li style="height: 430px;"><a target="_blank"
											href="http://yanshi.sucaihuo.com/modals/7/701/demo/#"><img
												src="js/login_files/bg.png"></a></li>
										<li style="height: 430px;"><a target="_blank"
											href="http://yanshi.sucaihuo.com/modals/7/701/demo/#"><img
												src="js/login_files/bg.png"></a></li>
										<li style="height: 430px;"><a target="_blank"
											href="http://yanshi.sucaihuo.com/modals/7/701/demo/#"><img
												src="js/login_files/bg.png"></a></li>
										<li style="height: 430px;"><a target="_blank"
											href="http://yanshi.sucaihuo.com/modals/7/701/demo/#"><img
												src="js/login_files/bg.png"></a></li>
									</ul>
								</div>
							</div>
							<div class="hd">
								<ul>
									<li class="">1</li>
									<li class="">2</li>
									<li class="on">3</li>
									<li class="">4</li>
								</ul>
							</div>
						</div>

						<script type="text/javascript">
							jQuery(".focusBox").slide({
								titCell : ".hd ul",
								mainCell : ".bd ul",
								effect : "top",
								autoPlay : true,
								autoPage : true,
								switchLoad : "_src"
							});
						</script>
					</div>
					<div class="denglu-top-contents">
						<div class="denglu-top-contents-top">
							<p>
								<span>最新公告：</span>如果没有注册请先注册
							</p>
						</div>
						<div class="denglu-top-contents-bottom">
							<div class="contents-bottom-neirong">
								<div class="contents-bottom-neirong-first1">
									<div class="hasMoreTab" style="margin: 0 auto">
										<div class="hd">
											<ul>
												<li class="li1 on">使用本站账户</li>
												<li class="">注册</li>
											</ul>
										</div>
										<div class="bd">
											<form id="loginForm" action="cuser/login" method="post">
											<p style="color: red;"><label>${errorMsgu}&nbsp;</label></p><c:remove var="errorMsgu" scope="session"/>
											<div class="conWrap"
												style="position: relative; width: 384px; height: 420px;">
												<div class="con"
													style="position: absolute; width: 384px; left: 0px; top: 50px; display: block;">
													<div class="yonghuming">
														<input type="text" id="clcusername" name="cusername" value=""
															placeholder="请输入用户名" class="shurukuang">
													</div>
													<div class="yonghuming-mima">
														<input type="password" id="clcpassword" name="cpassword" value=""
															placeholder="请输入密码" class="shurukuang">
													</div>
														<div class="denglu1">
															<p><input type="submit" value="登录" style="background-color: #e31830"/></p>
														</div>
													<div class="zhuce">
														<p>还没有登录账号？</p>
													</div>
													<div class="xieyi">
														<p>
															同意<span>《用户使用协议》</span>
														</p>
														<input type="checkbox" class="danxuan">
													</div>
													<div class="qqdenglu">
														<div class="qqdenglu-left"></div>
														<a href="http://yanshi.sucaihuo.com/modals/7/701/demo/#">
															<div class="qqdenglu-middle">使用第三方账号登录</div>
														</a>
														<div class="qqdenglu-right"></div>
													</div>
												</div>
												</form>
												<div class="con"
													style="position: absolute; width: 384px; left: 0px; top: 0px; display: none;">
													<div class="nicheng">
														<input type="text" id="name" name="name" value=""
															placeholder="昵称" class="shurukuang">
													</div>
													<div class="mima">
														<input type="password" id="name" name="name" value=""
															placeholder="密码" class="shurukuang">
													</div>
													<div class="yonghuming">
														<input type="text" id="name" name="name" value=""
															placeholder="邮箱" class="shurukuang">
													</div>

													<div class="yonghuming_mima1">
														<div class="yonghuming_mima">
															<input type="text" id="name" name="name" value=""
																placeholder="验证码" class="shurukuang">
														</div>
														<a href="http://yanshi.sucaihuo.com/modals/7/701/demo/#">
															<div class="yzmdx">发送验证码</div>
														</a>
													</div>

													<a href="http://yanshi.sucaihuo.com/modals/7/701/demo/#">
														<div class="denglu1">
															<p>登录</p>
														</div>
													</a>
													<div class="xieyi">
														<p>
															同意<span>《用户使用协议》</span>
														</p>
														<input type="checkbox" class="danxuan">
													</div>
													<div class="qqdenglu">
														<div class="qqdenglu-left"></div>
														<a href="http://yanshi.sucaihuo.com/modals/7/701/demo/#">
															<div class="qqdenglu-middle">使用第三方账号登录</div>
														</a>
														<div class="qqdenglu-right"></div>
													</div>
												</div>
											</div>

										</div>
									</div>
									<script type="text/javascript">
										jQuery(".hasMoreTab").slide({
											mainCell : ".conWrap",
											targetCell : ".more a",
											effect : "fold"
										});
									</script>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="denglu-first2-content-bottom">
					<div class="bottom-left">
						<div class="bottom-left-top">
							<p>安全保障</p>
						</div>
						<div class="bottom-left-footer">
							<p>****网站保障消费者账号密码等重要信息的安全</p>
						</div>
					</div>
					<div class="bottom-middle">
						<div class="bottom-left-top">
							<p>一键找回</p>
						</div>
						<div class="bottom-left-footer">
							<p>支持邮箱、手机号、昵称等多种其他账号找回，方便快捷</p>
						</div>
					</div>
					<div class="bottom-right">
						<div class="bottom-left-top">
							<p>贴心客服</p>
						</div>
						<div class="bottom-left-footer">
							<p>客服热线：400-4357-570</p>
							<p>客服邮箱：********@qq.com</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--第二部分内容结束-->
	</div>
	<!--整体内容结束-->
	<!--登录尾部内容开始-->
	<div class="denglu-footer">
		<div class="denglu-footer-content">
			*****有限公司 版权所有 2015-2016 备10216464645号&nbsp;&nbsp; <a
				href="http://yanshi.sucaihuo.com/modals/7/701/demo/#">关于我们</a>&nbsp;
			|&nbsp; <a href="http://yanshi.sucaihuo.com/modals/7/701/demo/#">帮助中心</a>
			&nbsp;|&nbsp; <a
				href="http://yanshi.sucaihuo.com/modals/7/701/demo/#">网站合作</a>&nbsp;|&nbsp;
			<a href="http://yanshi.sucaihuo.com/modals/7/701/demo/#">版权说明</a>&nbsp;|&nbsp;
			<a href="http://yanshi.sucaihuo.com/modals/7/701/demo/#">诚聘英才</a>&nbsp;|&nbsp;
			<a href="http://yanshi.sucaihuo.com/modals/7/701/demo/#">联系我们</a>
		</div>
	</div>
	<!--登录尾部内容结束-->


</body>
</html>