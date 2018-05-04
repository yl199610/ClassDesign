<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<base href="/ClassDesign/">
<head>
<meta charset="UTF-8">
<title>个人中心</title>
<script src="js/jquery-latest.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" type="text/css" href="css/stylepc.css">
<script type="text/javascript" src="js/pc.js"></script>
</head>
<script>
function operate() {
	document.getElementById('div_test').style.display = "";
	setTimeout("disappeare()", 2000);
}
function disappeare() {
	document.getElementById('div_test').style.display = "none";
}
$(function() {
	var ecusername="${sessionScope.loginUser.cusername}";
	var cuid="${sessionScope.loginUser.cuid}";
	$("#ecusername").val(ecusername);
	$("#emcusername").val(ecusername);
	$.post("cuser/showuser?cuid="+cuid,function(data) {
		$("#eemail").val(data.cemail);
		$("#ecphone").val(data.cphone);
		$(":radio[name='csex'][value='" + data.csex + "']").prop("checked", "checked");
		$("#pic").attr("src", data.cphoto);
		$("#ecbirthday").val(data.cbirthday);
	}, "json");	
	$.post("account/findapplyno?cuaid="+cuid,function(data) {
		$("#meapplyno").val(data.account.applyno);
		$(".showapply").html(data.account.applyno);
		$(".money").html(data.account.money);
	}, "json");	
});
function modifyUserMsg(){
	var params = $("#updateUserMsg").serialize();
	$.post("cuser/usermodify", params, function(data) {
		var jsonarray = JSON.stringify(data);
		if (jsonarray == "true") {
			$("#div_test").html("修改信息成功！！！");
			operate();
		} else {
			$("#div_test").html("修改信息失败。。。");
			operate();
		}
	}, "json");  
} 
	
function addPicPath(obj){
	var picStr=window.URL.createObjectURL(obj.files[0]);
	$("#pic").attr("src",picStr);
	$("#pic").attr("height","100px");
	$("#pic").attr("weight","100px");
}


function checkSeam(){
	var onePwd = $("#mcpassword").val();
	var twoPwd = $("#mncpassword").val();
	if(twoPwd==""||onePwd==""){
		return false;
	}
	if(onePwd!=twoPwd){	
		$(".new").html("*输入的密码不一致");
		return false;
	}else{
		$(".new").html("");
		return true;
	}
	return true;
} 


function updatePassword(){
	var params = $("#updatePassword").serialize();
	if(checkSeam()){
		$.post("cuser/updatepassword", params, function(data) {
			var jsonarray = JSON.stringify(data);
			if (jsonarray == "true") {
				$("#div_test").html("修改密码成功！！！");
				operate();
			} else {
				$("#div_test").html("修改密码失败。。。");
				operate();
			}
		}, "json");
	}
}
function noNull(){
	if($("#applyno").val()!=""){
		return true;
	}else{
		return false;
	}
}
function addAcount(){
	if(noNull()){
		var params = $("#addCount").serialize();
		$.post("account/addacount", params, function(data) {
			var jsonarray = JSON.stringify(data);
			if (jsonarray == "true") {
				$(".showapply").html($("#applyno").val());
				$("#meapplyno").val($("#applyno").val());
				$("#div_test").html("用户添加账户成功！！！");
				operate();
			} else {
				$("#div_test").html("用户添加账户失败。。。");
				operate();
			}
		}, "json");
	}else{
		alert("请勿输入空账户");
	}
	
}

function editAcount(){
		var params = $("#editCount").serialize();
		$.post("account/editacount", params, function(data) {
			var jsonarray = JSON.stringify(data);
			if (jsonarray == "true") {
				$("#div_test").html("用户编辑账户成功！！！");
				operate();
			} else {
				$("#div_test").html("用户编辑账户失败。。。");
				operate();
			}
		}, "json");	
	
}

function addMoney(){
	var params = $("#addMoney").serialize();
	$.post("account/addmoney", params, function(data) {
		var jsonarray = JSON.stringify(data);
		if (jsonarray == "true") {
			$(".money").html(parseInt($(".money").html())+parseInt($("#amoney").val()));
			$("#div_test").html("账户充值成功！！！");
			operate();
		} else {
			$("#div_test").html("账户充值失败。。。");
			operate();
		}
	}, "json");	
}

</script>
<style>
#btma {
	display: block;
	width: 100px;
	height: 40px;
	color: #fff;
	background: #FF2832;
	font-size: 16px;
	letter-spacing: 5px;
	text-decoration: none;
	line-height: 40px;
	text-align: center;
	border-radius: 2px;
	cursor: pointer;
}
</style>

<body>
	<input type="text" id="namesession" name="proname" value="${sessionScope.loginUser.cusername}" />
	<input type="text" id="cuidsession" name="cordid" value="${sessionScope.loginUser.cuid}" />
	<div class="container">
		<div class="menu">
			<h3>
				<i class="q-menu-img positionIicon"></i>个人信息
			</h3>
			<ul class="ulmenu1">
				<li><a class="selected" href="page/personCenter.jsp#tab1">编辑个人档案</a></li>
				<li><a href="page/personCenter.jsp#">修改密码</a></li>
			</ul>

			<h3>
				<i class="q-menu-doit positionIicon"></i>站内管理
			</h3>
			<ul class="ulmenu2">
				<li><a href="page/personCenter.jsp#" class="selected">订单查询</a></li>
				<li><a href="page/personCenter.jsp#">我的收藏</a></li>
				<li><a href="page/personCenter.jsp#">我的评价</a></li>

			</ul>

			<h3>
				<i class="q-menu-three positionIicon"></i>账户管理
			</h3>
			<ul class="ulmenu3">
				<li><a class="selected" href="page/personCenter.jsp#tab1">账户金额/充值</a></li>
				<li><a href="page/personCenter.jsp#">添加个人账号</a></li>
			</ul>
		</div>

		<div class="content">

			<div class="menu1 menu_tab">
				<div id="tab1" class="tab active">
					<form id="updateUserMsg" onsubmit="return modifyUserMsg();" action="cuser/usermodify" enctype="multipart/form-data" method="post"  target="nm_iframe">
						<table width="100%">
							<tr>
								<th colspan="2" ALIGN=CENTER><font size="5" style="color: red;">编辑个人档案</font></th>
							</tr>
							<tr>
								<td colspan="3"><hr></td>
							</tr>

							<tr>
								<td width="400"></td>
								<td ALIGN=CENTER BGCOLOR="#ffffff">
									<table width="400" cellpadding="4">
										<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">用户名:</font></td>
											<td><input id="ecusername" name="cusername" readonly="readonly"/></td>
										</tr>
										<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">邮箱</font></td>
											<td><input name="cemail" id="eemail" placeholder="请输入邮箱" />
											</td>
										</tr>
										<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">电话</font></td>
											<td><input name="cphone" id="ecphone"
												placeholder="请输入电话" /></td>
										</tr>
										<tr>
											<td ALIGN=RIGHT><label> 上传图片 </label></td>
											<td><input type="file" name="picData" id="mpic" onchange="addPicPath(this)"/><br/>
										<img src="images/1.jpg" id="pic"><br/></td>
										</tr>
										 
										
										
										<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">性别</font></td>
											<td><input type="radio" name="csex" value="男">男
												<input type="radio" name="csex" value="女">女</td>
										</tr>
										
										<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">用户生日</font></td>
											<td><input type="date" name="cbirthday" id="ecbirthday"
												placeholder="请输入用户生日" /></td>
										</tr>
										<tr>
											<td ALIGN="center" colspan="3">
											<input type="submit" value="修改" style="width:143px; height:40px; background:url('images/bg11.jpg') no-repeat left top; color:#FFF;">
										</tr>
									</table>
								</td>
								<td width="400"></td>
							</tr>
						</table>
					</form>
<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>
				</div>


					





				<div id="tab2" class="tab">
					<form id="updatePassword" method="post">
						<table width="100%">
							<tr>
								<th colspan="2" ALIGN=CENTER><font size="5" style="color: red;">用户密码修改</font></th>
							</tr>
							<tr>
								<td colspan="3"><hr></td>
							</tr>

							<tr>
								<td width="400"></td>
								<td ALIGN=CENTER BGCOLOR="#ffffff">
									<table width="500" cellpadding="4">
										<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">用户名:</font></td>
											<td><input id="emcusername" name="cusername" readonly="readonly"/></td>
										</tr>
										<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">新密码:</font></td>
											<td><input type="text" name="ncpassword" id="mcpassword" required="required" placeholder="请输入新密码" maxlength="16"/>*长度不能超过16位</td>
										</tr>
										<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">确认新密码</font></td>
											<td><input type="text" name="cpassword" id="mncpassword"  required="required" placeholder="请输入新密码" maxlength="16" onchange="checkSeam()"/><span style="color:red" class="new"></span></td>
										</tr>
										<tr>
											<td ALIGN="center" colspan="3">
											<div class="calBtn" >
												<a id="btma" href="javascript:void(0)" onClick="updatePassword()">修改密码</a>
											</div>
										</tr>
									</table>
								</td>
								<td width="400"></td>
							</tr>
						</table>
					</form>

				</div>

			<!-- 	<div id="tab3" class="tab">
					<p class="tt">6.新增银行账号处”是否现金账户”什么意思？</p>
					<p>This is Answer！6.新增银行账号处”是否现金账户”什么意思？6.新增银行账号处”是否现金账户”什么意思？</p>


				</div>

				<div id="tab4" class="tab">
					<p class="tt">13.为什么关账后损益类科目还有余额？</p>
					<p>This is Answer！</p>




				</div>

				<div id="tab5" class="tab">
					<p class="tt">22.账龄表初始化是什么意思？</p>
					<p>This is Answer！</p>



				</div>


				<div id="tab6" class="tab">
					<p class="tt">26.如何录入科目期初余额？</p>
					<p>This is Answer！</p>

					<p class="tt">27.初始化的时候期初余额录入错误怎么修改?</p>
					<p>初始化的时候期初余额录入错误怎么修改?</p>


				</div> -->

			</div>

			<div class="menu2 menu_tab">
				<div id="tab-1" class="tab">
					<p class="tt">1. Question</p>
					<p>This is Answer！</p>


				</div>

				<div id="ta-2" class="tab">
					<p class="tt">3. Question</p>
					<p>This is Answer！</p>
					<p>This is Answer！</p>
				</div>

				<div id="tab-3" class="tab">
					<p class="tt">3.Question</p>
					<p>This is Answer！</p>
					<p>This is Answer！</p>
				</div>

				<div id="tab-4" class="tab">
					<p class="tt">2.Question</p>
					<p>This is Answer！</p>
					<p>This is Answer！</p>
				</div>

				<div id="tab-5" class="tab">table5</div>
				<div id="tab-6" class="tab">table6</div>
				<div id="tab-7" class="tab">table7</div>
				<div id="tab-8" class="tab">table8</div>
				<div id="tab-9" class="tab">table9</div>
				<div id="tab-10" class="tab">table10</div>
				<div id="tab-11" class="tab">table11</div>
				<div id="tab-12" class="tab">table12</div>
			</div>

			<div class="menu3 menu_tab">
				<div id="tab-3-1" class="tab">
					<label>账户总金额:<span class="money" style="color:red;"></span>元</label>
					<form id="addMoney" method="post">
						<table width="100%">
							<tr>
								<th colspan="2" ALIGN=CENTER><font size="5" style="color: red;">账户充值</font></th>
							</tr>
							<tr>
								<td colspan="3"><hr></td>
							</tr>

							<tr>
								<td width="400"></td>
								<td ALIGN=CENTER BGCOLOR="#ffffff">
									<table width="500" cellpadding="4">
									<tr>
									
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">用户ID:</font></td>
											<td><input id="aacuid" name="cuaid" readonly="readonly"  value="${sessionScope.loginUser.cuid}" /></td>
										</tr>
										<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">充值金额:</font></td>
											<td><input id="amoney" name="money" /></td>
										</tr>
										<tr>
											<td ALIGN="center" colspan="3">
											<div class="calBtn" >
												<a id="btma" href="javascript:void(0)" onClick="addMoney()">充值</a>
											</div>
										</tr>
									</table>
								</td>
								<td width="400"></td>
							</tr>
						</table>
					</form>
				</div>
				<div id="tab-3-3" class="tab">
					<form id="addCount" method="post">
						<table width="100%">
							<tr>
								<th colspan="2" ALIGN=CENTER><font size="5" style="color: red;">添加个人账户</font></th>
							</tr>
							<tr>
								<td colspan="3"><hr></td>
							</tr>

							<tr>
								<td width="400"></td>
								<td ALIGN=CENTER BGCOLOR="#ffffff">
									<table width="500" cellpadding="4">
									<tr>
									
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">用户ID:</font></td>
											<td><input id="aacuid" name="cuaid" readonly="readonly"  value="${sessionScope.loginUser.cuid}" /></td>
										</tr>
										<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">账户名:</font></td>
											<td><input id="applyno" name="applyno" /></td>
										</tr>
										<tr>
											<td ALIGN="center" colspan="3">
											<div class="calBtn" >
												<a id="btma" href="javascript:void(0)" onClick="addAcount()">添加账户</a>
											</div>
										</tr>
									</table>
								</td>
								<td width="400"></td>
							</tr>
						</table>
					</form>
					<form id="editCount" method="post">
						<table width="100%">
							<tr>
								<th colspan="2" ALIGN=CENTER><font size="5" style="color: red;">编辑个人账户</font></th>
							</tr>
							<tr>
								<td colspan="3"><hr></td>
							</tr>

							<tr>
								<td width="400"></td>
								<td ALIGN=CENTER BGCOLOR="#ffffff">
									<table width="500" cellpadding="4">
										<label>当前账户：<span class="showapply"></span></label>
									<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">用户ID:</font></td>
											<td><input id="aacuid" name="cuaid" readonly="readonly"  value="${sessionScope.loginUser.cuid}" /></td>
										</tr>
										<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">账户名:</font></td>
											<td><input id="meapplyno" name="applyno" /></td>
										</tr>
										<tr>
											<td ALIGN="center" colspan="3">
											<div class="calBtn" >
												<a id="btma" href="javascript:void(0)" onClick="editAcount()">删除账户</a>
											</div>
										</tr>
									</table>
								</td>
								<td width="400"></td>
							</tr>
						</table>
					</form>
				</div>
				<div id="tab-3-4" class="tab">
					<p class="tt">1. 。。。</p>
					<p>。。。的个人版用户，100套账免费记，只需注册即可直接使用。。。。的代账公司版，多人操作且有服务运营管理系统，总账套数300套收费980元/年，总账套数1000套收费1980元/年。</p>
					<div id="tab-3-5" class="tab">table5</div>
					<div id="tab-3-6" class="tab">table6</div>
					<div id="tab-3-7" class="tab">table7</div>
					<div id="tab-3-8" class="tab">table8</div>
					<div id="tab-3-9" class="tab">table9</div>
					<div id="tab-3-10" class="tab">table10</div>
					<div id="tab-3-11" class="tab">table11</div>
					<div id="tab-3-12" class="tab">table12</div>
				</div>
			</div>
		</div>


		<div
			style="text-align: center; margin: 50px 0; font: normal 14px/24px 'MicroSoft YaHei';">

		</div>
		<div id="div_test" style="display: none; color: white; line-height: 35px; position: absolute; z-index: 100; left: 50%; top: 30%; margin-left: -75px; text-align: center; width: 150px; height: 35px; background-color: green; font-size: 12px;"></div>
		
</body>
</html>
