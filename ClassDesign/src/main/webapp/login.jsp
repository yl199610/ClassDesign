<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<base href="/ClassDesign/">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>登录页面</title>
<link rel="stylesheet" type="text/css" href="js/login_files/denglu.css">
<link rel="stylesheet" type="text/css" href="js/login_files/zhuce.css">
<link rel="stylesheet" type="text/css" href="js/login_files/public.css">
<link rel="stylesheet" type="text/css" href="js/login_files/my.css">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<!-- <script type="text/javascript"
	src="js/login_files/jquery-1.4.2.min.js.下载"></script> -->
<script type="text/javascript"
	src="js/login_files/jquery.SuperSlide.2.1.js"></script>
<script type="text/javascript">

	$("#loginForm p img").click(function() {
		$(this).attr("src", "vcode.jpg?" + new Date().getTime());
	});
	function operate() {
		document.getElementById('div_test').style.display = "";
		setTimeout("disappeare()", 2000);
	}
	function disappeare() {
		document.getElementById('div_test').style.display = "none";
	}
	function validate() {
		var name = $("#uucusername").val();
		$.post("cuser/check?uname=" + name, function(data) {
			var jsonarray = JSON.stringify(data);
			if (jsonarray == "true") {
				$("#showResult").html("");
				$("#regUser").attr("disabled", false);
			} else {
				$("#showResult").html("*用户名已经存在");
				$("#showResult").css("color", "red");
				$("#regUser").attr("disabled", true);
			}
		}, "json");
	}

	function regUserMsg() {
		var params = $("#regForm").serialize();//取到添加评论数据 
		$.post("cuser/register", params, function(data) {
			var jsonarray = JSON.stringify(data);
			if (jsonarray == "true") {
				$("#div_test").html("恭喜你，注册成功");
				operate();
			} else {
				$("#div_test").html("不好意思，注册失败");
				operate();
			}
		}, "json");
	}
	
	
</script>

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
										<li style="height: 430px;"><a> <img
												src="js/login_files/bglogin.png"></a></li>
										<li style="height: 430px;"><a><img
												src="js/login_files/bglogin.png"></a></li>
										<li style="height: 430px;"><a><img
												src="js/login_files/bglogin.png"></a></li>
										<li style="height: 430px;"><a><img
												src="js/login_files/bglogin.png"></a></li>
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
												<span style="color: red; margin-left: 40%;"><label>${errorMsg}&nbsp;</label></span>&nbsp;</label>
												</p>
												<c:remove var="errorMsg" scope="session" />
												<c:remove var="errorMsg" scope="session" />
												<div class="conWrap"
													style="position: relative; width: 384px; height: 400px;">
													<div class="con"
														style="position: absolute; width: 384px; left: 0px; top: 0px; display: block;">
														<div class="yonghuming">
															<input type="text" id="clcusername" name="cusernamelogin"
																placeholder="请输入用户名" class="shurukuang">
														</div>
														<div class="yonghuming-mima">
															<input type="password" id="clcpassword"
																name="cpasswordlogin" placeholder="请输入密码"
																class="shurukuang">
														</div>
														<p style="margin-left: 50px; margin-top: 10px;">
															验证码：<img src="vcode.jpg" title="看不清，换一张" />&nbsp;&nbsp;&nbsp;&nbsp;<input
																name="vcode" placeholder="输入验证码" id="vcode"
																required="required" style="height: 26px; width: 100px;" />
														</p>

														<div class="denglu1">
															<p>
																<input type="submit" value="登录"
																	style="background-color: #e31830" />
															</p>
														</div>
														<div class="zhuce">
															<p>
																<a href="page/forgetPassword.jsp">忘记密码?</a>
															</p>
														</div>
														<div class="xieyi">
															<p>
																同意<span>《用户使用协议》</span>
															</p>
															<input type="checkbox" class="danxuan" checked="checked">
														</div>
														<div class="qqdenglu">
															<div class="qqdenglu-left"></div>
															<a>
																<div class="qqdenglu-middle">使用第三方账号登录</div>
															</a>
															<div class="qqdenglu-right"></div>
														</div>
													</div>
											</form>
											<div class="con"
												style="position: absolute; width: 384px; left: 0px; top: 0px; display: none;">
												<form id="regForm" method="post">
													<div class="nicheng">
														<input type="text" id="uucusername" name="cusername"
															value="" placeholder="昵称" required="required"
															class="shurukuang" onblur="validate()">
													</div>
													<div style="margin-left: 100px;" id="showResult"></div>
													<div class="mima">
														<input type="password" id="uucpassword" name="cpassword"
															value="" placeholder="密码" class="shurukuang">
													</div>
													<div class="yonghuming">
														<input type="email" id="uucemail" name="cemail" value=""
															placeholder="邮箱可以找回密码" class="shurukuang">
													</div>

													<!-- <div class="yonghuming_mima1">
													<div class="yonghuming_mima">
														<input type="text" id="vcode" name="vcode" value=""
															placeholder="验证码" class="shurukuang">
													</div>
													<a>
														<div class="yzmdx">发送验证码</div>
													</a>
												</div> -->
											
													<a >
														<p>
															<input type="button" value="注册" id="regUser"
																style="background-color: #e31830" onClick="regUserMsg()" />
														</p>
													</a>
												</form>

												<div class="xieyi">
													<p>
														同意<span>《用户使用协议》</span>
													</p>
													<input type="checkbox" checked="checked" class="danxuan">
												</div>
												<div class="qqdenglu">
													<div class="qqdenglu-left"></div>
													<a>
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
<div id="div_test" style="display: none; color: white; line-height: 35px; position: absolute; z-index: 100; left: 50%; top: 30%; margin-left: -75px; text-align: center; width: 150px; height: 35px; background-color: green; font-size: 12px;"></div>
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
				href="login.jsp">关于我们</a>&nbsp; |&nbsp; <a href="login.jsp">帮助中心</a>
			&nbsp;|&nbsp; <a href="login.jsp">网站合作</a>&nbsp;|&nbsp; <a
				href="login.jsp">版权说明</a>&nbsp;|&nbsp; <a href="login.jsp">诚聘英才</a>&nbsp;|&nbsp;
			<a href="login.jsp">联系我们</a>
		</div>
	</div>
	<!--登录尾部内容结束-->

</body>
</html>