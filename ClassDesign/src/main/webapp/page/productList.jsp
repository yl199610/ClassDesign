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
<style type="text/css">


</style>
<script type="text/javascript">

	var money = 0;
	var name = "";
	var data = [];
	function allowDrop(e){
		e.preventDefault();
	}
	function getValue() {
		var name = $(".padLeft10 h1").html();
		var money = $(".sellPrice").html();
		var productid = $(".otherInfor3 i").html();
		/* money=$("#inp_money1").val();
		name = $("#inp_name").val(); */
		$("#div1").attr("style", "display:block;");
		addJson(name, money);
		addHtml();
	}

	function addJson(name, money) {
		for (var j = 0; j < data.length; j++) {
			if (data[j].name == name) {
				data[j].num++;
				return;
			}
		}
		data.push({
			money : money,
			name : name,
			num : 1
		});
	}
	function addHtml(){
		var text_html='';
		var totalMoney=0;
		$("#ul_panel").html("");
		for(var i=0;i<data.length;i++){
			text_html+='<tr><td>'+data[i].name+'</td><td>'+data[i].money+'</td><td><a onclick="reduce(\'\'+'+i+',this)">-</a> '+data[i].num+' ';
			text_html+='<a onclick="addNum(\'\'+'+i+',this)">+</a></td><td>￥'+(data[i].money*data[i].num)+'</td></tr>';
			totalMoney+=data[i].money*data[i].num;
			$("#totalMoney").text('￥'+totalMoney);
		}
		$("#ul_panel").append(text_html);
	}
	function drop(){
		addJson(name,money);
		addHtml();
	}
	function reduce(a,t){
		data[a].num--;
		if(data[a].num==0){
			data.splice(a,1);
		}
		if(data.length==0){
			$("#totalMoney").text(0);
		}
		addHtml();
	}
	function addNum(a,t){
		data[a].num++;
		addHtml();
	}
	
	
	
	
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
	<div class="getdest">
		<a href="./index.jsp">中国图书网</a>&gt;<a href="./index.jsp">一级标题</a>&gt;<a
			href="./index.jsp">二级标题</a>&gt;<a href="./index.jsp">三级标题</a>&gt;<span>书名</span>
	</div>

	<div id="bigproductDiv">
		<div id="topproductDiv">
			<div id="topproductOne">
				<img id="bigImageShow" src="images/ts.jpg" width="80%" height="80%"
					style="margin-top: 50px;">
			</div>
			<div id="topproductTwo">
				<div class="padLeft10">
					<h1></h1>
					</br>
					<!-- 					<p class="recomand">语文新课标必读丛书</p>
 -->
					<div class="author">
						<span>作者：</span><span id="authBymy" style="color: red;"></span>
					</div>
					<div class="publisher">
						<span>出版社：</span><a style="color: red;"></a>
					</div>
					<div class="publishertime">
						<span>出版时间：</span><i style="color: red;"></i>
					</div>
					<div class="otherInfor">
						<span>开本：</span> <em style="color: red;"></em>
					</div>
					<div class="otherInfor2">
						<span>页数：</span> <i style="color: red;"></i>
					</div>
					<div class="otherInfor3">
						<span>产品Id：</span> <i style="color: red;"></i>
					</div>					<!-- <div class="startWrap">
						<i class="one"></i><i class="one"></i><i
							class="one"></i><i class="one"></i><i class="half"></i><a
							href="#tabookReco">98条评论</a>
					</div>
					<div class="sort">
						<span>排名：</span><a href="/24hour/63000000/" target="_blank">中小学教辅销量榜</a>
						<b>第<i>2</i>位
						</b>
					</div> -->
				</div>

				<div id="showPrice">
					<div class="priceWrap">
						<span class="sellPriceTit">中 图 价:&nbsp;&nbsp;</span><i>¥&nbsp;</i><span
							class="sellPrice">1.7</span><span class="discount"></span> <span
							class="priceTit">定价:&nbsp;</span> <i>¥&nbsp;</i>
						<del class="price">8.0 </del>
						<a href="/RegUser/login.aspx?url=/522126.htm" target="_blank"></a>
						<div>促销活动</div>
					</div>
				</div>
				<div id="addCar">
					<div id="addCarBig">
						<input id="addCarpriduct" type="button" value="加入购物车"
							onClick="getValue()" />
						<!-- 						<a id="addCarpriduct" href="page/car.jsp" target="_blank"> <span>加入购物车</span>
 -->
						</a> <a id="addfavpriduct" href="#"> <span>收藏</span>
						</a>
					</div>

					<div id="addCarThree">
						<span style="color: #E60000;">温馨提示</span>：5折以下图书主要为出版社尾货，大部分为全新，个别图书品相8-9成新、切口
						有划线标记、光盘等附件不全
					</div>
				</div>
			</div>
			<div id="topproductThree">
				<h3>本类五星好评</h3>
				<ul>
					<li>231321</li>
					<li>231321</li>
					<li>231321</li>
					<li>231321</li>
					<li>231321</li>
				</ul>
			</div>
		</div>
		<div id="bottomproductDiv">
			<div id="productleftDiv">
				<h3 style="background-color: #f3f3f3;">图书推荐</h3>
				<hr>
				<div id="recommendDiv"></div>
				<h3>浏览历史</h3>
				<hr>
				<div id="historyDiv"></div>
			</div>
			<div id="productRightDiv">
				<h3
					style="color: white; line-height: 40px; height: 40px; background-color: #3b3b3b">
					图书详情&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: red;">商品评价</a>
				</h3>
				<div id="productbookmsg" style="margin-top: 10px;">
					<h3
						style="line-height: 40px; height: 40px; background-color: #f5f5f5">版权信息</h3>
					<ul id="bookowner"
						style="list-style: none; line-height: 22px; margin-top: 17px; overflow: hidden; padding-left: 22px;">
						<li id="first1"></li>
						<li id="first2"></li>
						<li id="first3"></li>
						<li id="first4"></li>
						<li id="first5"></li>
						<li id="first6"></li>
						<li id="first7"></li>
					</ul>
				</div>
				<div id="intrducebookmsg">
					<h3
						style="line-height: 40px; height: 40px; background-color: #f5f5f5">图书简介</h3>
					<p></p>
				</div>
				<div id="commentsMsg">
					<h3
						style="margin-left: -40px; line-height: 40px; height: 40px; background-color: #f5f5f5">图书评价</h3>
					<div class="tabookRecoCon">
						<div class="recoList">
							<ul style="list-style: none; line-height: 40px;"
								id="commentsDivcar">
							</ul>

							<div class="pro_r_b">
								<h3>写评论，赢评论积分，快快行动吧！</h3>
								<a class="pro_r_c" href="productList.jsp" target="_blank">如何参与评论和打分</a>
								<a class="pro_r_x" href="page/Comment.jsp"></a>
							</div>
						</div>
					</div>

				</div>
				<div id="productpageDiv" style="margin-top: 20px; float: left; text-align: center; width: 100%; height: 30px;">dfsd</div>
			</div>
		<div id="div1" ondrop="drop()" ondragover="allowDrop(event)"style="VISIBILITY: hidden;">
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
			<p class="allMoney">总价：<span id="totalMoney" style="margin-right:8px;color:orange;">￥69</span></p>
		</div>
		</div>
	</div>


<div class="cndns-right">
    <div class="cndns-right-meau meau-car" >
        <a href="#" class="cndns-right-btn">
            <span class="demo-icon"><img src="images/02index-banner-8.gif"></span>
            <sup>0</sup>
        </a>
    </div>
    <div class="cndns-right-meau meau-sev">
        <a href="javascript:" class="cndns-right-btn"><img src="images/customer.jpg">
            <span class="demo-icon"></span>
            <p>
                在线<br />
                客服
            </p>
        </a>
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
        <a href="javascript:" class="cndns-right-btn">
            <span class="demo-icon"><img src="images/phone.jpg"></span>
            <p>
                客服<br />
                热线
            </p>
        </a>
        <div class="cndns-right-box">
            <div class="box-border">
                <div class="sev-t">
                    <span class="demo-icon">&#xe902;</span>
                    <p>400-123-4567<br /><i>7*24小时客服服务热线</i></p>
                    <div class="clear"></div>
                </div>
                <span class="arrow-right"></span>
            </div>
        </div>
    </div>
    <div class="cndns-right-meau meau-code">
        <a href="javascript:" class="cndns-right-btn">
            <span class="demo-icon"><img src="images/code.jpg"></span>
            <p>
                关注<br />
                微信
            </p>
        </a>
        <div class="cndns-right-box">
            <div class="box-border">
                <div class="sev-t">
                    <img src="images/02index-2.jpg" />
                    <i>关注官方微信</i>
                </div>
                <span class="arrow-right"></span>
            </div>
        </div>
    </div>
    <div class="cndns-right-meau meau-top" id="top-back">
        <a href="javascript:" class="cndns-right-btn" onclick="topBack()">
            <span class="demo-icon">&#xe904;</span>
            <i>顶部</i>
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
$(window).scroll(function(){
	 if($(this).scrollTop() > 350){
		$("#top-back").fadeIn();
	 }
	 else{
		$("#top-back").fadeOut();
	 }
  })	
//置顶事件
function topBack(){
  $('body,html').animate({scrollTop:0},300);
}
</script>
</body>
</html>