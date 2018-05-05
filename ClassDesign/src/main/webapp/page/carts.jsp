<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<base href="/ClassDesign/">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/index.css">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<title>我的购物车</title>

<style>
table {
	text-align: center;
}

table img {
	width: 50px;
}

a {
	text-decoration: none;
	color: red;
}

.bar-wrapper {
	width: 1200px;
	height: 50px;
	position: fixed;
	bottom: -1px;
	z-index: 99;
	background: #e5e5e5;
}

.bar-wrapper .bar-right {
	float: right;
	color: #3c3c3c;
}

.bar-wrapper .bar-right strong {
	color: #f40;
}

.bar-wrapper .bar-right .piece {
	float: left;
	min-width: 110px;
	margin-right: 20px;
	height: 50px;
	line-height: 50px;
}

.bar-wrapper .bar-right .piece .piece_num {
	display: inline-block;
	padding: 0 10px;
	font-weight: 700;
	font-size: 18px;
	font-family: tohoma, arial;
}

.bar-wrapper .bar-right .totalMoney {
	float: left;
	min-width: 100px;
	height: 50px;
	line-height: 50px;
}

.bar-wrapper .bar-right .totalMoney .total_text {
	float: right;
	font-weight: 400;
	font-size: 20px;
	font-family: Arial;
	vertical-align: middle;
	margin-right: 10px;
	margin-left: 15px;
}

.bar-wrapper .bar-right .calBtn {
	float: left;
}

.bar-wrapper .bar-right .calBtn a {
	display: block;
	width: 120px;
	height: 50px;
	color: #fff;
	background: #B0B0B0;
	font-size: 22px;
	letter-spacing: 5px;
	text-decoration: none;
	line-height: 50px;
	text-align: center;
	border-radius: 2px;
	cursor: pointer;
	border: 1px solid red;
}

#btma{
display: block;
	width: 120px;
	height: 50px;
	color: #fff;
	background: #FF2832;
	font-size: 22px;
	letter-spacing: 5px;
	text-decoration: none;
	line-height: 50px;
	text-align: center;
	border-radius: 2px;
	cursor: pointer;
}


.shoppingProcedure {
	width: 617px;
    height: 36px;
    line-height: 36px;
    overflow: hidden;
    margin-left: 400px;
    margin: 28px 0px;
}

.shoppingProcedure span{
	width: 100px;
    height: 46px;
    display:block;
    background-color: #F2F2F2;
    padding-left: 26px;
    margin-left: 70px;
    float:left;
    color:#666666;
}
input, button{
    text-rendering: auto;
    color: initial;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    margin: 0em;
    font: 400 13.3333px Arial;
}

#orderTalbe input{
	width: 200px;
	height: 30px;
}

</style>
<script>

$(function() {
 	$(".mycar").attr('style', 'background-color:#FF2832');
 	$(document).ready(function() {
 		var cusername="${sessionScope.loginUser.cusername}";
 		if(cusername.length == 0||cusername==null || cusername==''|| cusername == undefined){
 			$(".header-login-reg").append('<li class="headspan"><a id="loginSpan" class="f-bold f-cheng" href="login.jsp">登录</a><span class="f-hui-line">| </span>&nbsp;<a id="regSpan" class="f-cheng f-bold" href="login.jsp">注册</a></li>');
 	 	}
 		var cuid="${sessionScope.loginUser.cuid}";
 	})
});
var cusername="${sessionScope.loginUser.cusername}";
var cuid="${sessionScope.loginUser.cuid}";
$.post("account/findaccountbyId?cuid="+cuid,function(data) {
	$(".MtotalM").html(data.money);
}, "json");	

$.post("cproduct/showproductMsg",{"ckeywords": cusername, "cproductname": null, "cwsscprice": null, "spcaid": null, "cpfree": null },function(data) {
	for(var i=0;i<data.length;i++){
		$("#tbodytable").append('<tr><td><input id="checkinput" type="checkbox" name="car" onClick="selects(this)" value="'+data[i].cnormalprice+'"/><img src="'+data[i].cimage+'"><p>'+data[i].cproductname+'</p>'+
		'</td><td>'+data[i].caddtime+'</td><td>'+data[i].cwsscprice+'</td><td class="taclass">'+data[i].cpfree+'</td><td class="total">'+data[i].cnormalprice+'</td><td class="spid">'+data[i].spcaid+'</td></tr>');
	}

}, "json");	

var totalNum=0;
var spid = "";

function selectAll(val,obj){
	var totalNum=0;
	var totalPrice=0;
	$(".taclass").each(function() { 
		totalNum+=parseInt($(this).text());
	})
	$(".total").each(function() {
		totalPrice+=parseInt($(this).text());
	})
	if(!val){
		$(".taclass").each(function() { 
			totalNum-=parseInt($(this).text());
		})
		$(".total").each(function() {
			totalPrice-=parseInt($(this).text());
		})
	}
	var num="";
	var lastindex = $("#tableDiv").find("tr").length;//总行数
	for(var i=0;i<parseInt(lastindex)+1;i++){
		if(i>2){
			var pid1 = $("tr:nth-child("+i+") td:nth-child(6)").html();
			var num1 = $("tr:nth-child("+i+") td:nth-child(4)").html();
			s= pid1+"-"+num1+",";
	    	 spid+=s;
		};
	}
		/* 	alert("===");
			 $("#tableDiv tr td:nth-child(4)").each(function(){
			     alert($("#tableDiv tr:!eq(1) td:nth-child(1)").html());
			  }); */
	
	
/*  	  var s="";
 	if ($('#checkinput').prop('checked')) {
    	var x = $(obj).parent().parent().find("td");  
    	 y= x.eq(3).text();
    	 s= x.eq(5).text()+"-"+x.eq(3).text()+",";
    	 totalNum+=parseInt(y);
    	 spid+=s;
    }
 	alert(spid)
	 */
	
	$(".piece_num").html(totalNum);
	$(".total_text").html(totalPrice);
	$("#btma").attr('style', 'background-color:#e50211');
	var cars=document.getElementsByName("car");
	for(var i=0,len=cars.length;i<len;i++){
		if(cars.item(i).type=="checkbox"){
			cars.item(i).checked=val;
		}
	}
}

function selects(obj){
	var totalPrice=0;
/* 	 $.each($('input:checkbox:checked'),function(){
    	one = $(this).val();
    	var x = $(obj).parent().parent().find("td");  
    	var y = x.eq(3).text();
    	alert(y);
    	var s=x.eq(5).text();
    	spid+=parseInt(s);
	   	totalPrice+=parseInt(one);
    	totalNum+=parseInt(y);
    	alert(totalNum);
    });  */
    var y=0;
    var s="";
 	if ($('#checkinput').prop('checked')) {
    	var x = $(obj).parent().parent().find("td"); 
    	 y= x.eq(3).text();
    	 s= x.eq(5).text()+"-"+x.eq(3).text()+",";
    	 totalNum+=parseInt(y);
    	 spid+=s;
    }

	 $.each($('input:checkbox:checked'),function(){
	    	one = $(this).val();
		   	totalPrice+=parseInt(one);
	 }); 
   
    
/*  	$.each($('input:checkbox:disabled'),function(){
    	var x = $(obj).parent().parent().find("td");  
    	var y = x.eq(3).text();
    	totalNum-=parseInt(y);
    });  */
	
	$(".piece_num").html(totalNum);
	$(".total_text").html(totalPrice);
	$("#btma").attr('style', 'background-color:#e50211');
	var cars=document.getElementsByName("car");
	for(var i=0,len=cars.length;i<len;i++){
		if(cars.item(i).type=="checkbox" && cars.item(i).checked==false){
			document.getElementById("allcar").checked=false;
			return;
		}
	}

	document.getElementById("allcar").checked=true;
}
function goBy(){
	var num = $(".piece_num").html();
	var price=  $(".total_text").html();
	var priceuser=  $(".MtotalM").html();
	if(parseInt(price)>parseInt(priceuser)){
		alert("用户余额不足请充值");
		return ;
	}
	if(price!=0&&num!=0){
		$("#tableDiv").attr("style", "display:none;");
		$(".bar-wrapper").attr("style", "display:none;");
		$(".mycar").attr('style', 'background-color:#F2F2F2');
		$(".current").attr('style', 'background-color:#FF2832');
		$(".orderInfo").attr("style", "display:block;");
		var totalNum = $(".piece_num").html();
		var totalPrice = $(".total_text").html();
		$("#unum").val(totalNum);
		$("#pricetotal").val(totalPrice);
		$("#spid").val(spid);
		
	}else{
		alert("请选择购物车的商品");
	}
}


function byProduct(){
 	var params = $("#formAddress").serialize();//取到添加评论数据 
	$.post("corder/add", params, function(data) {
		var jsonarray = JSON.stringify(data);
		if (jsonarray == "true") {
			$(".orderInfo").attr("style", "display:none;");
			$(".bar-wrapper").attr("style", "display:none;");
			$(".orderSuccess").attr("style", "display:block;");
			$(".mycar").attr('style', 'background-color:#F2F2F2');
			$(".current").attr('style', 'background-color:#F2F2F2');
			$(".success").attr('style', 'background-color:#FF2832');
		} else {
			alert("付款失败");
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
			</ul>
		</div>
	</div>
	<div class="bg-div">
		<h1 class="loge">
			<a href="./index.jsp"> <img alt="欢迎来到网上书城" src="images/log.jpg" /></a>
		</h1>
	</div>
	
	
	
	
<div class="shoppingProcedure" style="background: url(images/shoppingProcedure2.png) no-repeat">
         <span class="mycar">我的购物车</span>
         <span class="current">填写核对订单</span>
         <span class="success">成功提交订单</span>
</div>

	
		<table id="tableDiv" align="center" border="1px" cellspacing="0px" cellpadding="0px"
			width="80%" style="margin-left: 100px;">
			<tbody align="center" id="tbodytable">
				<tr>
					<td colspan="7"><input type="checkbox" name="allcar"
						id="allcar" onClick="selectAll(this.checked,this)">全选</td>
				</tr>
				<tr>
					<td>商品信息</td>
					<td>商品参数</td>
					<td>单价</td>
					<td>数量</td>
					<td>总价</td>
					<td>商品编号</td>
				</tr>
	
			</tbody>
		</table>
		<div class="bar-wrapper">
			<div class="bar-right">
		<label>总余额：</label><label style="color:red;" class="MtotalM"></label>
				<div class="piece">
					已选商品<strong class="piece_num">0</strong>件
				</div>
				<div class="totalMoney">
					共计: <strong class="total_text">0</strong>
				</div>
				<div class="calBtn">
					<a id="btma" href="javascript:void(0)" onClick="goBy()">结算</a>
				</div>
			</div>
		</div>
		
		

<div class="orderInfo" style="visibility:hidden;width: 1000px;height: 360px;border: 1px solid #DBDBDB;margin-left: 100px;">
	<div class="stepTit clearfix"style="width: 960px;height: 30px;background:#E9E9E9;margin-left: 100px; "><strong>收货人信息</strong></div>
		<form name="formAddress" id="formAddress" method="post">
	      <input type="text" id="namesession" name="proname"
					value="${sessionScope.loginUser.cusername}" />
	      <input type="text" id="cuidsession" name="cordid"
					value="${sessionScope.loginUser.cuid}" />
			<input type="text" id="unum" name="unum"
					value="" />
	      	<input type="text" id="pricetotal" name="pricetotal"
					value="" />
			<input type="text" id="spid" name="spid"
					value="" />
							
	      <table id="orderTalbe" align="center">
	        <tr>
	         <td align="right">收货人:</td>
	         <td align="left"><input type="text" size="20" name="cordername" required="required"/><span style="color:red ">*</span></td>
	        </tr>
	        <tr>
	         <td align="right">地&nbsp;&nbsp;址:</td>
	         <td align="left"><input type="text" size="20" name="cfulladdress" required="required"/><span style="color:red ">*</span></td>
	        </tr>
	        <tr>
	         <tr>
	         <td align="right">邮政编码:</td>
	         <td align="left"><input type="text" size="20" name="cpostalcode" required="required"/><span style="color:red ">*</span></td>
	        </tr>
	        <tr>
	         <td align="right">电&nbsp;&nbsp;话:</td>
	         <td align="left"><input type="text" size="20" name="cphone" required="required"/><span style="color:red ">*</span></td>
	        </tr>
	         <tr>
	         <td align="right">备&nbsp;&nbsp;注:</td>
	         
	         <td align="left"><textarea name="corderdesc" rows="5" cols="50"></textarea><span style="color:red ">*</span></td>
	        </tr>
	        <tr>
	         <td colspan="2" align="center">
	         <div class="calBtn">
					<a id="btma" href="javascript:void(0)" onClick="byProduct()">确认信息</a>
				</div>
<!-- 	         <input type="submit" value="确认收货地址" onclick="byProduct()" style="text-align:center;background: red;border-radius: 10px;" />
 -->	         </td>
	        </tr>
      </table>
    </form>
</div>
		
<div class="orderSuccess" style="visibility: hidden;width: 100px;height: 30px;border: 1px solid #DBDBDB;margin-left: 100px;">
	购买书籍成功!!!<a href="./index.jsp">返回首页继续购买</a>
</div>	
		
		
	<div>
</div>
</body>
</html>