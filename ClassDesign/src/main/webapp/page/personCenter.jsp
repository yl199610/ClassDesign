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
		var ecusername = "${sessionScope.loginUser.cusername}";
		var cuid = "${sessionScope.loginUser.cuid}";
		$("#ecusername").val(ecusername);
		$("#emcusername").val(ecusername);
		$.post("cuser/showuser?cuid=" + cuid, function(data) {
			$("#eemail").val(data.cemail);
			$("#ecphone").val(data.cphone);
			$(":radio[name='csex'][value='" + data.csex + "']").prop("checked",
					"checked");
			$("#pic").attr("src", data.cphoto);
			$("#ecbirthday").val(data.cbirthday);
		}, "json");
		$.post("account/findapplyno?cuaid=" + cuid, function(data) {
			$("#meapplyno").val(data.account.applyno);
			$(".showapply").html(data.account.applyno);
			$(".money").html(data.account.money);
		}, "json");
		
		pageOrderFunction();//总分页界面
		
		pageCommentFunction();//评论界面
	});
	//CommentpageDiv tableOrderDetail bodyOrderDetail
	function pageCommentFunction(){
		var cuid = "${sessionScope.loginUser.cuid}";
		$.post("ccomments/listbyuserid?cuserid=" + cuid, function(data) {
			var len = data.rows.length;
			if(len<=0){
				$("#CommentpageDiv").append('<span style="color:red;">暂时没有评论</span>');
				return;
			}
			loadDataComment(data);
		}, "json");
		
	}
  
	function loadDataComment(data){
		var len = data.rows.length;
		for(var i=0;i<len;i++){
			$("#bodyCommDetail").append('<tr><td>'+data.rows[i].cid+'</td><td>'+data.rows[i].theam+'</td><td>'+data.rows[i].ccontent+'</td><td>'+data.rows[i].ccdate+'</td><td>'+data.rows[i].cproduct.cproductname+'</td>'+
			'<td>'+data.rows[i].star+'</td><td><a href="javascript:void(0)" style="color:red;" onClick="delComment('+data.rows[i].cid+')">删除评论</td></td></tr>');
		}
	}
	
	function getCommUser(){
		var cuid = "${sessionScope.loginUser.cuid}";
		var cfp = $("#cccfp").val();  
		if(cfp==null||cfp==""){
			alert("请输入产品id");
		}
		$.post("ccomments/listbyuserid?cuserid="+cuid+"&cid="+cfp,function(data) {
			$("#bodyCommDetail").empty();
			if(data.total=1){
				$("#bodyCommDetail").append('<tr><td>'+data.rows[0].cid+'</td><td>'+data.rows[0].theam+'</td><td>'+data.rows[0].ccontent+'</td><td>'+data.rows[0].ccdate+'</td><td>'+data.rows[0].cproduct.cproductname+'</td>'+
						'<td>'+data.rows[0].star+'</td><td><a href="javascript:void(0)" style="color:red;" onClick="delComment('+data.rows[0].cid+')">删除评论</td></td></tr>');
				}else{
				$("#bodyOrder").append("暂无此评论");
			}
		}, "json");
	}
	
	function delComment(cid){
		$.post("ccomments/delcomment?cid="+cid,function(data) {
			var jsonarray = JSON.stringify(data);
			if (jsonarray == "true") {
				pageCommentFunction();
				$("#div_test").html("删除评论成功！！！");
				operate();
			} else {
				$("#div_test").html("删除评论失败！！！");
				operate();
			}
		}, "json");
	}
	
	
	
	
	
	
	
	function pageOrderFunction(){
		var cuid = "${sessionScope.loginUser.cuid}";
		$.post("corder/findorderbyid?cordid=" + cuid, function(data) {
			var len = data.rows.length;
			if(len<=0){
				$("#productpageDiv").append('<span style="color:red;">暂时没有订单</span>');
				return;
			}
			loadDataOrder(data);
			pageNextAndPerOrder(data);
		}, "json");
		
	}
  
	function loadDataOrder(data){
		var len = data.rows.length;
		for(var i=0;i<len;i++){
			$("#bodyOrder").append('<tr><td>'+data.rows[i].coid+'</td><td>'+data.rows[i].corderdesc+'</td><td>'+data.rows[i].ctotalprice+'</td><td>'+data.rows[i].cordertime+'</td>'+
			'<td>'+data.rows[i].cfulladdress+'</td><td>'+data.rows[i].cpostalcode+'</td><td>'+data.rows[i].cphone+'</td><td><a href="javascript:void(0)" style="color:red;" onClick="cancelOrder('+data.rows[i].coid+','+data.rows[0].ctotalprice+')">取消订单<a href="javascript:void(0)" style="color:red;" onClick="detailOrder('+data.rows[i].coid+')">订单详情</td></tr>');
		}
	}

	//分页栏
	function pageNextAndPerOrder(data){
		var currPage=data.currPage;
		var nextPage=currPage+1;
		var perPage=currPage-1;
		var totalPage=data.totalPage;
		var total=data.total;
		var len = data.rows.length;
//		if(len<=0){
//			alert("此书暂无评论");
//			return;
//		}
		if(data.currPage>=1&&currPage<totalPage){
			$('#productpageDiv').empty();
			$('#productpageDiv').html('<a href="javascript:void(0)" onClick="getPerPage(1);">首页&nbsp;&nbsp;</a><a id="pera" href="javascript:void(0)" onClick="getPerPage('+perPage+');">上一页&nbsp;&nbsp;</a><a href="javascript:void(0)" id="nexta" onClick="getPerPage('+nextPage+');">下一页&nbsp;&nbsp;</a><a href="javascript:void(0)" onClick="getPerPage('+totalPage+');">末页</a>');
		}else if(currPage<1){
			getPerPage(1);
		}
	}


	//上下页的点击事件
	function getPerPage(perpage){
		getData(perpage);
	}


	//获得数据
	function getData(pageCurr){
		var cuid = "${sessionScope.loginUser.cuid}";
		$.post("corder/findorderbyid?cordid="+cuid+"&pageNos="+pageCurr,function(data) {
			$("#bodyOrder").html("");  
			loadDataOrder(data);
			pageNextAndPerOrder(data);
		}, "json");
	}
	function getOrderUser(){
		var cuid = "${sessionScope.loginUser.cuid}";
		var coid = $("#mmcoid").val();  
		if(coid==null||coid==""){
			$("#bodyOrder").empty();
			pageOrderFunction();//总分页界面
		}
		$.post("corder/findorderone?cordid="+cuid+"&coid="+coid,function(data) {
			$("#bodyOrder").empty();
			if(data.total=1){
				$("#bodyOrder").append('<tr><td>'+data.rows[0].coid+'</td><td>'+data.rows[0].corderdesc+'</td><td>'+data.rows[0].ctotalprice+'</td><td>'+data.rows[0].cordertime+'</td>'+
						'<td>'+data.rows[0].cfulladdress+'</td><td>'+data.rows[0].cpostalcode+'</td><td>'+data.rows[0].cphone+'</td><td><a href="javascript:void(0)" style="color:red;" onClick="cancelOrder('+data.rows[0].coid+','+data.rows[0].ctotalprice+')">取消订单<a href="javascript:void(0)" style="color:red;" onClick="detailOrder('+data.rows[0].coid+')">订单详情</td></tr>');
			}else{
				$("#bodyOrder").append("暂无此订单");
			}
		}, "json");
	}
	
	function cancelOrder(coid,price){
		 var cuid = "${sessionScope.loginUser.cuid}";
		$.post("corder/cancelorder?coid="+coid+"&cordid="+cuid+"&ctotalprice="+price, function(data) {
			var jsonarray = JSON.stringify(data);
			if (jsonarray == "true") {
				$("#div_test").html("取消订单成功！！！");
				operate();
			} else {
				$("#div_test").html("取消订单失败！！！");
				operate();
			}
		}, "json"); 
	}
	
	
	function detailOrder(coid){
		$.post("corder/findorderdetail?corid="+coid,function(data) {
			$("#bodyOrderDetail").empty();
			for(var i=0;i<data.length;i++){
				$("#bodyOrderDetail").append('<tr><td>'+data[i].corid+'</td><td>'+data[i].cproduct.cproductname+'</td><td>'+data[i].coinumber+'</td>'+
						'<td>'+data[i].ciprice+'</td></tr>');
			}
		}, "json");
	}
	
	
	
	
	function modifyUserMsg() {
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

	function addPicPath(obj) {
		var picStr = window.URL.createObjectURL(obj.files[0]);
		$("#pic").attr("src", picStr);
		$("#pic").attr("height", "100px");
		$("#pic").attr("weight", "100px");
	}

	function checkSeam() {
		var onePwd = $("#mcpassword").val();
		var twoPwd = $("#mncpassword").val();
		if (twoPwd == "" || onePwd == "") {
			return false;
		}
		if (onePwd != twoPwd) {
			$(".new").html("*输入的密码不一致");
			return false;
		} else {
			$(".new").html("");
			return true;
		}
		return true;
	}

	function updatePassword() {
		var params = $("#updatePassword").serialize();
		if (checkSeam()) {
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
	function noNull() {
		if ($("#applyno").val() != "") {
			return true;
		} else {
			return false;
		}
	}
	function addAcount() {
		if (noNull()) {
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
		} else {
			alert("请勿输入空账户");
		}

	}

	function editAcount() {
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

	function addMoney() {
		var params = $("#addMoney").serialize();
		$.post("account/addmoney", params, function(data) {
			var jsonarray = JSON.stringify(data);
			if (jsonarray == "true") {
				$(".money").html(
						parseInt($(".money").html())
								+ parseInt($("#amoney").val()));
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

#tableOrder #tableOrderDetail{
	border-collapse: collapse;
	margin: 0 auto;
	text-align: center;
}

#tableOrder td, #tableOrder th,#tableOrderDetail td, #tableOrderDetail th {
	border: 1px solid #cad9ea;
	color: #666;
	height: 30px;
}

#tableOrder thead th,#tableOrderDetail thead th {
	background-color: #CCE8EB;
	width: 100px;
}

#tableOrder tr:nth-child(odd) #tableOrderDetail tr:nth-child(odd){
	background: #fff;
}

#tableOrder tr:nth-child(even) ,#tableOrderDetail tr:nth-child(even) {
	background: #F5FAFA;
}
</style>

<body>
	<input type="hidden" id="namesession" name="proname"
		value="${sessionScope.loginUser.cusername}" />
	<input type="hidden" id="cuidsession" name="cordid"
		value="${sessionScope.loginUser.cuid}" />
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
					<form id="updateUserMsg" onsubmit="return modifyUserMsg();"
						action="cuser/usermodify" enctype="multipart/form-data"
						method="post" target="nm_iframe">
						<table width="100%">
							<tr>
								<th colspan="2" ALIGN=CENTER><font size="5"
									style="color: red;">编辑个人档案</font></th>
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
											<td><input id="ecusername" name="cusername"
												readonly="readonly" /></td>
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
											<td><input type="file" name="picData" id="mpic"
												onchange="addPicPath(this)" /><br /> <img
												src="images/1.jpg" id="pic"><br /></td>
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
											<td ALIGN="center" colspan="3"><input type="submit"
												value="修改"
												style="width: 143px; height: 40px; background: url('images/bg11.jpg') no-repeat left top; color: #FFF;">
										</tr>
									</table>
								</td>
								<td width="400"></td>
							</tr>
						</table>
					</form>
					<iframe id="id_iframe" name="nm_iframe" style="display: none;"></iframe>
				</div>








				<div id="tab2" class="tab">
					<form id="updatePassword" method="post">
						<table width="100%">
							<tr>
								<th colspan="2" ALIGN=CENTER><font size="5"
									style="color: red;">用户密码修改</font></th>
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
											<td><input id="emcusername" name="cusername"
												readonly="readonly" /></td>
										</tr>
										<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">新密码:</font></td>
											<td><input type="text" name="ncpassword" id="mcpassword"
												required="required" placeholder="请输入新密码" maxlength="16" />*长度不能超过16位</td>
										</tr>
										<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">确认新密码</font></td>
											<td><input type="text" name="cpassword" id="mncpassword"
												required="required" placeholder="请输入新密码" maxlength="16"
												onchange="checkSeam()" /><span style="color: red"
												class="new"></span></td>
										</tr>
										<tr>
											<td ALIGN="center" colspan="3">
												<div class="calBtn">
													<a id="btma" href="javascript:void(0)"
														onClick="updatePassword()">修改密码</a>
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
					<h4 style="color: red">订单信息</h4>
					<form id="getOrderInfo" method="post">
						<input name="coid" id="mmcoid" placeholder="输入订单信息"> <input
							id="aacuid" name="cordid" readonly="readonly"
							value="${sessionScope.loginUser.cuid}" /> <input type="button"
							value="查询订单信息" onClick="getOrderUser()">
					</form>
					<table id="tableOrder" align="center" border="1px"
						cellspacing="0px" cellpadding="0px" width="100%"
						style="margin-left: 100px;">
						<thead>
							<tr style="background-color: #dedede;">
								<th>订单编号</th>
								<th>订单描述</th>
								<th>订单总价</th>
								<th>订单时间</th>
								<th>收货地址</th>
								<th>邮政编码</th>
								<th>联系电话</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody align="center" id="bodyOrder">

						</tbody>
					</table>
					<div id="productpageDiv" 
						style="color: red; float: right; display: block;"></div>

					<table id="tableOrderDetail" align="center" border="1px"
						cellspacing="0px" cellpadding="0px" width="80%"
						style="margin-left: 100px;">
						<thead>
							<tr style="background-color: #dedede;">
								<th>订单编号</th>
								<th>产品名称</th>
								<th>数量</th>
								<th>价格</th>
							</tr>
						</thead>
						<tbody align="center" id="bodyOrderDetail">

						</tbody>
					</table>

				</div>

				<div id="ta-2" class="tab">
				<h4 style="color: red">评论信息</h4>
					<form id="getCommInfo" method="post">
						<input name="cfp" id="cccfp" placeholder="输入评论产品id"> <input
							id="aacuid" name="cordid" readonly="readonly"
							value="${sessionScope.loginUser.cuid}" /> <input type="button"
							value="查询评论信息" onClick="getCommUser()">
					</form>
					<table id="tableOrderComment" align="center" border="1px"
						cellspacing="0px" cellpadding="0px" width="80%"
						style="margin-left: 100px;">
						<thead>
							<tr style="background-color: #dedede;">
								<th>评价编号</th>
								<th>评价主题</th>
								<th>评价内容</th>
								<th>评价时间</th>
								<th>评价产品</th>
								<th>评价星级</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody align="center" id="bodyCommDetail">

						</tbody>
					</table>
					<div id="CommentpageDiv" style="color: red; float: right; display: block;"></div>
				</div>

				<div id="tab-3" class="tab">
					<p class="tt">3.Question11111111</p>
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
					<label>账户总金额:<span class="money" style="color: red;"></span>元
					</label>
					<form id="addMoney" method="post">
						<table width="100%">
							<tr>
								<th colspan="2" ALIGN=CENTER><font size="5"
									style="color: red;">账户充值</font></th>
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
											<td><input id="aacuid" name="cuaid" readonly="readonly"
												value="${sessionScope.loginUser.cuid}" /></td>
										</tr>
										<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">充值金额:</font></td>
											<td><input id="amoney" name="money" /></td>
										</tr>
										<tr>
											<td ALIGN="center" colspan="3">
												<div class="calBtn">
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
								<th colspan="2" ALIGN=CENTER><font size="5"
									style="color: red;">添加个人账户</font></th>
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
											<td><input id="aacuid" name="cuaid" readonly="readonly"
												value="${sessionScope.loginUser.cuid}" /></td>
										</tr>
										<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">账户名:</font></td>
											<td><input id="applyno" name="applyno" /></td>
										</tr>
										<tr>
											<td ALIGN="center" colspan="3">
												<div class="calBtn">
													<a id="btma" href="javascript:void(0)"
														onClick="addAcount()">添加账户</a>
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
								<th colspan="2" ALIGN=CENTER><font size="5"
									style="color: red;">编辑个人账户</font></th>
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
											<td><input id="aacuid" name="cuaid" readonly="readonly"
												value="${sessionScope.loginUser.cuid}" /></td>
										</tr>
										<tr>
											<td ALIGN=RIGHT><font size="3" face="微软雅黑">账户名:</font></td>
											<td><input id="meapplyno" name="applyno" /></td>
										</tr>
										<tr>
											<td ALIGN="center" colspan="3">
												<div class="calBtn">
													<a id="btma" href="javascript:void(0)"
														onClick="editAcount()">删除账户</a>
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
		<div id="div_test"
			style="display: none; color: white; line-height: 35px; position: absolute; z-index: 100; left: 50%; top: 30%; margin-left: -75px; text-align: center; width: 150px; height: 35px; background-color: green; font-size: 12px;"></div>
</body>
</html>
