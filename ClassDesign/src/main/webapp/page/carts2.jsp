<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<base href="/ClassDesign/">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/index.css">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<title>图书商城：Such is life</title>
<script>
  window.onload=function(){
   document.getElementById("ckAll").onclick=function(){//当点击全选的复合框时触发事件
    var cks = document.getElementsByName("ck");//获取ck对象
    for(var i=0;i<cks.length;i++){ //循环得到单个tr
     cks[i].checked=this.checked; //得到的每个tr的点击都等于ckAll的点击
    }
   }
   var cks = document.getElementsByName("ck");//创建ck对象
   for(var i=0;i<cks.length;i++){ //循环得到单个tr
    cks[i].onclick=function(){ // 当点击每个当tr的时候都会触发点击事件
      for(var i=0;i<cks.length;i++){// 循环得到单个td
       if(!cks[i].checked){ //如果单个特点的点击等于false 就返回
        document.getElementById("ckAll").checked = false;//那么ckAll就等于false
        return;
       }
      }
     document.getElementById("ckAll").checked = true;//否则就等于true 说明为全选状态
    }
   }
   getSum();
    function getSum(){ //计算的方法
     var tbody = document.getElementsByTagName("tbody")[0];//创建tbody对象
     var sum =0;//先定义sum为0
      for(var i =0;i<tbody.children.length;i++){ //循环得到tr
       var tr = tbody.children[i]; //tbody中的子节点就是tr
       var td = tr.children; //tr的子节点是 td
       var price = parseFloat(td[2].innerText);//td的第二列是价格 得到价格
       var count = parseFloat(td[3].children[0].value); //第三列是数量
       sum+=price*count; //总和就等于价格*数量
       td[3].children[0].onblur=function(){ //当失去焦点的时候触发事件
        getSum();
       }
      }
     var tfoot = document.getElementsByTagName("tfoot")[0]; //创景tfoot对象
     tfoot.children[0].children[1].innerHTML =sum; //tfootd子节点 等于总和
    }
 
   var dels = document.getElementsByClassName("del");//创建del对象
   for(var i = 0;i<dels.length;i++){//循环得到
    dels[i].onclick=function(){
     this.parentNode.parentNode.remove();
     getSum();
    }
   }
   document.getElementsByClassName("dels")[0].onclick=function(){
     var cks = document.getElementsByName("ck");
    for(var i = cks.length-1;i>=0;i--){
      if(cks[i].checked){
       cks[i].parentNode.parentNode.remove();
      }
    }
    getSum();
 
   }
 
  }
</script>

<style>
  table{
   text-align: center;
 
  }
  table img{
   width: 50px;
  }
 a {
  text-decoration: none;
  color: red;
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



	<table border="1" cellspacing="0">
		<thead>
			<tr>
				<th>全选 <input type="checkbox" id="ckAll" /></th>
				<th>商品</th>
				<th>单价</th>
				<th>数量</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox" name="ck" /></td>
				<td>![](../img2/1.png)</td>
				<td>3</td>
				<td><input type="number" max="10" min="0" step="1" value="2" /></td>
				<td><a href="javascript:void(0);" rel="external nofollow"
					rel="external nofollow" rel="external nofollow"
					rel="external nofollow" class="del">删除</a></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="ck" /></td>
				<td>![](../img2/2.png)</td>
				<td>3</td>
				<td><input type="number" max="10" min="0" step="1" value="3" /></td>
				<td><a href="javascript:void(0);" rel="external nofollow"
					rel="external nofollow" rel="external nofollow"
					rel="external nofollow" class="del">删除</a></td>


			</tr>
			<tr>
				<td><input type="checkbox" name="ck" /></td>
				<td>![](../img2/3.png)</td>
				<td>3</td>
				<td><input type="number" max="10" min="0" step="1" value="1" /></td>
				<td><a href="javascript:void(0);" rel="external nofollow"
					rel="external nofollow" rel="external nofollow"
					rel="external nofollow" class="del">删除</a></td>


			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3" align="right">总价:</td>
				<td colspan="2"></td>
			</tr>
		</tfoot>

	</table>
	<a href="javascript:void(0);" rel="external nofollow"
		rel="external nofollow" rel="external nofollow"
		rel="external nofollow" class="dels">删除选中项</a>
</body>
</html>