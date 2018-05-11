<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<base href="/ClassDesign/">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/index.css">
<link type="text/css" rel="stylesheet" href="css/comment.css">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<title>图书评论</title>
<script type="text/javascript">
function operate() {
	document.getElementById('div_test').style.display = "";
	setTimeout("disappeare()", 4000);
}
function disappeare() {
	document.getElementById('div_test').style.display = "none";
}
var editor;
$(function() {
	var cusername="${sessionScope.loginUser.cusername}";
	if(cusername.length == 0||cusername==null || cusername==''|| cusername == undefined){
		$(".header-login-reg").append('<li class="headspan"><a id="loginSpan" class="f-bold f-cheng" href="login.jsp">登录</a><span class="f-hui-line">| </span>&nbsp;<a id="regSpan" class="f-cheng f-bold" href="login.jsp">注册</a></li>');
 	}
	 editor = CKEDITOR.replace('ccontent'); //ckeditor的编辑区
});

function dotcomment(cuid){
	$.post("corder/list?cordid="+cuid,function(data) {
		if(data.rows.length==0){
			alert("您未购买该书籍,不能评论哦");
			return false;
		}
	}, "json");	
}

function comment(){
	var cfp1 = location.href.substring(location.href.indexOf("?"));
	var cfp=cfp1.substr(6);
	var cuid="${sessionScope.loginUser.cuid}";

	if(dotcomment(cuid)==false){
		return;
	}
	
	var b = editor.getData();
	var r = b.replace(/<.*?>/ig,"");
	if(cuid==""||cuid==null){
		alert("请先登录再评论");
	}
	var ccomment = {
		"theam" : $("#ctheam").val(),
		"star" : $("#star").html(),
		"ccontent" : r,
		"cuserid":cuid,
		"cfp":cfp
	};
	 $.post("ccomments/addcomment",ccomment,function(data) {
		var jsonarray = JSON.stringify(data);
		if (jsonarray == "true") {
			$("#div_test").html("评论成功！！！");
			operate();
		} else {
			$("#div_test").html("评论失败。。。");
			operate();
		}

	}, "json");	
}
</script>
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
				href="index.jsp"></a> <span class="f-hui-line"> </span>&nbsp; <a
				id="regSpan" class="f-cheng f-bold" href="index.jsp"></a></li>
		</ul>
		<div class="helpLink">
			<ul class="helpul">
				<input hidden="hidden" id="namesession"
					value="${sessionScope.loginUser.cusername}" />
				<input hidden="hidden" id="cuidsession"
					value="${sessionScope.loginUser.cuid}" />
				<li><a href="page/personCenter.jsp" target="_blank" class="f-green">个人中心</a></li>
			</ul>
		</div>
	</div>
		<div class="pro_pl_deta" style="float: left; ">
			<h2>发表评论</h2>
			<form id="commentForm">
				<h2>
					<span class="infor_emp">*</span>评分<span class="infor_note">（5星代表很喜欢）</span>
					<div id="startone" class="block clearfix">
						<div class="star_score"></div>
						<p style="float: left;">
							您的评分：<span class="fenshu" name="star" id="star"></span> 分
						</p>
						<div class="attitude"></div>
					</div>
					<script type="text/javascript" src="js/startScore.js"></script>
					<script>
						scoreFun($("#startone"))
						scoreFun($("#starttwo"), {
							fen_d : 22,//每一个a的宽度
							ScoreGrade : 5
						//a的个数 10或者
						})
					</script>
				</h2>

				<h2>
					评论标题<span class="infor_note">（长度在4-20个字之间）</span>
				</h2>
				<input style="height: 30px;width: 250px;" required="required" class="pl_title_box fLeft"
					placeholder="请输入评论标题" name="theam" id="ctheam" min="4" maxlength="20"> <span id="titleError"
					style="display: none; color: #f00; float: left;">*
					标题长度须在4-20个字之间</span>
				<div style="clear: both;"></div></br>
				<h2>
					<span class="infor_emp">*</span>评论内容<span class="infor_note">（长度在5-1500个字之间）</span>
				</h2>
				<textarea required="required" class="ckeditor" id="ccontent" name="ccontent"></textarea>
				<div style="clear: both;"></div>
				<a style="position: absolute; display: block; width: 100px; height: 40px; background-color: #00b3ee; color: #fff; text-decoration: none; text-align: center; font: normal normal normal 16px/40px 'Microsoft YaHei'; cursor: pointer; border-radius: 4px;"
					id="comment"  href="javascript:void(0)"  onclick="comment()">评论</a>
			</form>
			<div class="clear"></div>
		</div>
<div id="div_test" style="display: none; color: white; line-height: 35px; position: absolute; z-index: 100; left: 50%; top: 30%; margin-left: -75px; text-align: center; width: 150px; height: 35px; background-color: green; font-size: 12px;"></div>
		
</body>
</html>