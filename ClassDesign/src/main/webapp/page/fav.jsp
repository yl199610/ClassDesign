<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<base href="/ClassDesign/">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/index.css">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<title>我的收藏</title>

<style>
#tableOrder{
	border-collapse: collapse;
	margin: 0 auto;
	text-align: center;
}

#tableOrder td, #tableOrder th{
	border: 1px solid #cad9ea;
	color: #666;
	height: 30px;
}

#tableOrder thead th {
	background-color: #CCE8EB;
	width: 100px;
}

#tableOrder tr:nth-child(odd){
	background: #fff;
}

#tableOrder tr:nth-child(even){
	background: #F5FAFA;
}
</style>
<script>
function operate() {
	document.getElementById('div_test').style.display = "";
	setTimeout("disappeare()", 2000);
}
function disappeare() {
	document.getElementById('div_test').style.display = "none";
}
var cusername="${sessionScope.loginUser.cusername}";
var cuid="${sessionScope.loginUser.cuid}";
$(function() {
 	$(".mycar").attr('style', 'background-color:#FF2832');
 	$(document).ready(function() {
 		var cusername="${sessionScope.loginUser.cusername}";
 		if(cusername.length == 0||cusername==null || cusername==''|| cusername == undefined){
 			$(".header-login-reg").append('<li class="headspan"><a id="loginSpan" class="f-bold f-cheng" href="login.jsp">登录</a><span class="f-hui-line">| </span>&nbsp;<a id="regSpan" class="f-cheng f-bold" href="login.jsp">注册</a></li>');
 	 	}
 		var cuid="${sessionScope.loginUser.cuid}";
 	})
 	
 	pageGetProductFunction();
 
 	
 	
});
function pageGetProductFunction(){
	$.post("cfav/listuserfav?cuid="+cuid, function(data) {
		var len = data.length;
		if(len<=0){
			$("#productpageDiv").append('<span style="color:red;">该目录暂时没有数据</span>');
			return;
		}

		loadDataOrder(data);
		pageNextAndPerOrder(data);
	}, "json");
}

function loadDataOrder(data){
	$('#bodyOrder').empty();
	var len = data.rows.length;
	for(var i=0;i<data.rows.length;i++){
		$("#bodyOrder").append('<tr><td>'+data.rows[i].cfid+'</td><td>'+data.rows[i].cproduct.cproductname+'</td><td>'+data.rows[i].cproduct.cwsscprice+'元</td>'+
		'<td>'+data.rows[i].cproduct.cnormalprice+'元</td><td>'+data.rows[i].cproduct.cpid+'</td><td><a href="javascript:void(0);" onclick="calcelFav('+data.rows[i].cfid+')">'+
		'取消收藏</a>&nbsp;&nbsp;&nbsp;<input id="addCarpriduct" type="button" value="加入购物车" onClick=getValue("'+data.rows[i].cproduct.cproductname+'","'+data.rows[i].cproduct.spcaid+'","'+data.rows[i].cproduct.cwsscprice+'") /></td></tr>');
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
//	if(len<=0){
//		alert("此书暂无评论");
//		return;
//	}
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
	var cuid = $("#cuidsession").val();
	$.post("cfav/listuserfav?cuid="+cuid+"&pageNos="+pageCurr,function(data) {
		$("#bodyOrder").html("");  
		loadDataOrder(data);
		pageNextAndPerOrder(data);
	}, "json");
}	


function calcelFav(cfid){
	var msg = "您真的确定要取消收藏吗？\n\n请确认！"; 
	 if (confirm(msg)==true){ 
		 $.post("cfav/calcelfav?cfid="+cfid,function(data) {
				pageGetProductFunction();
			}, "json");
		}else{ 
	  		return false; 
	 } 
	
}


//加入购物车
function getValue(cproductname,spcaid,cwsscprice) {
	var cusername = $("#namesession").val();
	var num=1;
 	if(cusername==null||cusername==""){
		alert("请先登录再加入商品到购物车");
		return;
	} 
	saveCar(cproductname,cwsscprice,spcaid,num,cusername);
}





function saveCar(cproductname,cwsscprice,spcaid,cpfree,ckeywords){
 	$.post("cproduct/saveProductModel",{"ckeywords": ckeywords, "cproductname": cproductname, "cwsscprice": cwsscprice, "spcaid": spcaid, "cpfree": cpfree },function(data) {
 		if (data.length>0) {
			$("#div_test").html("添加购物车成功！！！");
			operate();
		} else {
			$("#div_test").html("添加购物车失败。。。");
			operate();
		}
	}, "json");
}




</script>

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
				<li><a target="_blank" class="f-green">个人中心</a></li>
				<input hidden="hidden" id="namesession"
					value="${sessionScope.loginUser.cusername}" />
				<input hidden="hidden" id="cuidsession"
					value="${sessionScope.loginUser.cuid}" />
			</ul>
		</div>
	</div>
	<div class="bg-div">
		<h1 class="loge">
			<a href="./index.jsp"> <img alt="欢迎来到网上书城" src="images/log.jpg" /></a>
		</h1>
	</div>
	
	
		<table id="tableOrder" align="center" border="1px"
						cellspacing="0px" cellpadding="0px" width="80%"
						style="margin-left: 100px;">
						<thead>
							<tr style="background-color: #dedede;">
								<th>收藏编号</th>
								<th>商品名称</th>
								<th>网上价格</th>
								<th>线下价格</th>
								<th>产品编号</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody align="center" id="bodyOrder">

						</tbody>
					</table>
					
	<div id="productpageDiv" style=" float: left; text-align: center; width: 100%; height: 30px;"></div>
	<div id="div_test" style="display: none; color: white; line-height: 35px; position: absolute; z-index: 100; left: 50%; top: 60%; margin-left: -75px; text-align: center; width: 150px; height: 35px; background-color: green; font-size: 12px;"></div>
	
	<div>
</div>
</body>
</html>