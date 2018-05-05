var index = 0;//当前显示的图片索引
var total = 0;//总图片数
var time;
//从数据库加载分类的数据
function loadCategory(){
	$.post("ccategory/firsttype", function(data) {
		$(".list_head").empty();
		for (i=0; i < data.length; i++) {
			$(".list_head").append('<li class="divli"><div class="menu-attr"><a class="diva" onmouseover="findotherdata('+data[i].ccid+')"><span>'+data[i].ccname+'</span></a></div>'+
					'<div class="menu-panel"><ul class="hiddenul"></ul></div></li>');
			diffType();//分类
		}
	}, "json");	
}

function findotherdata(tccid){//获取二级和三级目录数据
	$.post("ccategory/secondtype?ccid="+tccid, function(d) {
		$(".hiddenul").empty();
		var ccdata=new Array();
		for (i=0; i < d.length; i++) {//数组
			ccdata[i]=d[i].ccid;
		}
		findanotherdata(ccdata);
	}, "json");	
}
function findanotherdata(ccid){
	$.post("ccategory/thridtype?tccid="+ccid, function(data) {
//		alert(data.length+"==="+data[0].ccname+"==="+data[0].ccategory.length+"==="+data[0].ccategory[1].ccname);
		for(var i=0;i<data.length;i++){
			var ccateLen=data[i].ccategory.length;
			$(".hiddenul").append('<li><h2>'+data[i].ccname+'</h2><div class="'+"menu-list"+(i)+'"></div><div class="clear"></div></li>');
			for(var j=0; j <ccateLen; j++){
				if(data[i].ccid==data[i].ccategory[j].parentid){
					$(".menu-list"+(i)).append('<div class="menu-list-div"><span>|</span><a target="_blank" class="thrida" href="page/showMsg.jsp?ccid='+data[i].ccategory[j].ccid+'">'+data[i].ccategory[j].ccname+'</a></div>');
				}
			}
		}
	}, "json");
}
function loadHotBook(){
	$("#hotBookDivFirst").empty();
	$.post("cproduct/gethotproduct",function(data) {
		for(var i=0;i<data.length;i++){
			$('#hotBookDivFirst').append('<ul id="hotDiv"><li><a href="page/productList.jsp?ccid='+data[i].cpid+'" target="_blank">'+
					'<img src="'+data[i].cimage+'"></a></li><li>'+
					'<a href="page/productList.jsp?ccid='+data[i].cpid+'" title="'+data[i].cproductname+'" target="_blank">'+data[i].cproductname+'</a></li><li>'+
					'<span class="sellPrice">¥'+data[i].cwsscprice+'</span>&nbsp;&nbsp;&nbsp; <span class="price"><del>¥'+data[i].cnormalprice+'</del></span></br></li></ul>');
		}
	}, "json");
	
	$("#hotBookDivScoend").empty();
	$.post("cproduct/getcomproduct",function(data) {
		for(var i=0;i<data.length;i++){
			$('#hotBookDivScoend').append('<ul id="hotDiv"><li><a href="page/productList.jsp?ccid='+data[i].cpid+'" target="_blank">'+
					'<img src="'+data[i].cimage+'"></a></li><li>'+
					'<a href="page/productList.jsp?ccid='+data[i].cpid+'" title="'+data[i].cproductname+'" target="_blank">'+data[i].cproductname+'</a></li><li style="color:orange;">'+data[i].ckeywords+'条评论</li><li>'+
					'<span class="sellPrice">¥'+data[i].cwsscprice+'</span>&nbsp;&nbsp;&nbsp; <span class="price"><del>¥'+data[i].cnormalprice+'</del></span></br></li></ul>');
		}
	}, "json");
	
	$("#hotBookDivThird").empty();
	$.post("cproduct/getfavproduct",function(data) {
		for(var i=0;i<data.length;i++){
			$('#hotBookDivThird').append('<ul id="hotDiv"><li><a href="page/productList.jsp?ccid='+data[i].cpid+'" target="_blank">'+
					'<img src="'+data[i].cimage+'"></a></li><li>'+
					'<a href="page/productList.jsp?ccid='+data[i].cpid+'" title="'+data[i].cproductname+'" target="_blank">'+data[i].cproductname+'</a></li><li style="color:orange;">'+data[i].ckeywords+'条收藏</li><li>'+
					'<span class="sellPrice">¥'+data[i].cwsscprice+'</span>&nbsp;&nbsp;&nbsp; <span class="price"><del>¥'+data[i].cnormalprice+'</del></span></br></li></ul>');
		}
	}, "json");
	
	$.post("cproduct/getcountproduct",function(data) {
		$('#countProductTotal').html(data);
	}, "json");
	
}
//总分页界面
function pageFunction(){
	$.post("cproduct/getproductbyman",function(data) {
		loadData(data);
		//分页栏
		pageNextAndPer(data);
	}, "json");
	 
}
//加载数据显示
function loadData(data){
	var len = data.rows.length;
	for(var i=0;i<len;i++){
		$('.imageAppear').append('<div class="oneBookDiv"><ul id="hotDiv"><li><a href="page/productList.jsp?ccid='+data.rows[i].cpid+'" target="_blank">'+
				'<img src="'+data.rows[i].cimage+'"></a></li><li>'+
				'<a href="page/productList.jsp?ccid='+data.rows[i].cpid+'" title="'+data.rows[i].cproductname+'" target="_blank">'+data.rows[i].cproductname+'</a></li><li>'+
				'<span class="sellPrice">¥'+data.rows[i].cwsscprice+'</span></br><span class="price"><del>¥'+data.rows[i].cnormalprice+'</del></span></br></li></ul></div>');
	}
}
//分页栏
function pageNextAndPer(data){
	var currPage=data.currPage;
	var nextPage=currPage+1;
	var perPage=currPage-1;
	var totalPage=data.totalPage;
	var total=data.total;
	var len = data.rows.length;
	if(data.currPage>=1&&currPage<=totalPage){
		$('#pageDiv').empty();
		$('#pageDiv').html('<a href="javascript:void(0)" onClick="getPerPage(1);">首页&nbsp;&nbsp;</a><a id="pera" href="javascript:void(0)" onClick="getPerPage('+perPage+');">上一页&nbsp;&nbsp;</a><a href="javascript:void(0)" id="nexta" onClick="getPerPage('+nextPage+');">下一页&nbsp;&nbsp;</a><a href="javascript:void(0)" onClick="getPerPage('+totalPage+');">末页</a><form id="get$("#pagenum").val()"><h4 align="center">共'+totalPage+'页 <input id="pagenum" type="text" value="'+currPage+'"name="pageNos" size="1">页 <input type="button" value="到达" onclick="decPerPage('+currPage+','+totalPage+')"></h4></form>');
	}else if(currPage<=0){
		getPerPage(1);
	}else{
		getPerPage(totalPage);
	}
}


//上下页的点击事件
function getPerPage(perpage){
	getData(perpage);
}

function decPerPage(currPage,total){
	var inputnum = $("#pagenum").val();
	if(inputnum>total){
		alert("输入有误");
	}else{
		getData(inputnum);
	}
}
//获得数据
function getData(pageCurr){
	$.post("cproduct/getproductbyman?pageNos="+pageCurr,function(data) {
		$('.imageAppear').empty();
		loadData(data);
		pageNextAndPer(data);
	}, "json");
}

function getJsoupData(){
	$.post("cproduct/getjsoupdata",function(data) {
		$(".on").empty();
		for(var i=0;i<data.length;i++){
			var redCurList =data[i].cdescription;
			var bookNameList = data[i].cproductname;
			var imgList = data[i].cimage;
			var sellPriceList = data[i].cwsscprice;
			var priceList = data[i].cnormalprice ;
			$(".on").append('<li class="red"><i>'+redCurList+'</i><em>&gt;</em><p>'+bookNameList+'</p><div class="bookCur">'+
					'<div class="bpic"><a href="" target="_blank" title="'+bookNameList+'">'+
					'<img src="'+imgList+'" alt="'+bookNameList+'"></a></div>'+
					'<div class="bDetai"><div class="bName"><a href="" target="_blank" title="'+bookNameList+'">'+
					''+bookNameList+'</a></div><div class="bPrice"><span class="sellPrice">'+sellPriceList+'</span><span class="price">'+
					''+priceList+'</span></div></div></div></li>');
			getDymicData();
		}
	}, "json");
}
function getDymicData(){
	$(".hotBook .tabTit a").hover(
			function() {
				var $this = $(this);
				var thisIndex = $this.index();
				$this.addClass("cur").siblings().removeClass("cur");
				$(".tabCon .tabConList").eq(thisIndex).addClass("cur")
						.siblings().removeClass("cur")
			})

	$(".tabConList .leftArrow").click(function() {
		var $this = $(this);
		var obj = $this.parents(".tabConList");
		var tabPanel = obj.find(".tabPanel");
		tabPanel.find(".tabItem").removeClass("cur");
		var lastLi = tabPanel.find(".tabItem:last");
		lastLi.addClass("cur");
		lastLi.prependTo(tabPanel);
	})

	$(".tabConList .rightArrow").click(function() {
		var $this = $(this);
		var obj = $this.parents(".tabConList");
		var tabPanel = obj.find(".tabPanel");
		tabPanel.find(".tabItem").removeClass("cur");
		var firstLi = tabPanel.find(".tabItem:first");
		firstLi.appendTo(tabPanel);
		tabPanel.find(".tabItem:first").addClass("cur");
	})

	var len = $(".navDot ul li").length;

	$(".navDot ul li").hover(
			function() {
				var $this = $(this);
				var thisIndex = $this.index();
				$this.addClass("cur").siblings().removeClass("cur");
				$(".hotCon ul").eq(thisIndex).addClass("on").siblings()
						.removeClass("on");

			})

	/*畅销榜*/
	$(".hotNav .rightArrow").click(function() {
		$(".hotNav .leftArrow").show();
		$(".hotNav .rightArrow").hide();
		$(".navDot ul").css("left", -55 * (len - 4) + 10 + "px");
	})
	$(".hotNav .leftArrow").click(function() {

		$(".navDot ul").css("left", 0);
		$(".hotNav .leftArrow").hide();
		$(".hotNav .rightArrow").show();
	})

	$(".hotCon ul li").hover(function() {
		var $this = $(this);
		$this.addClass("cur").siblings().removeClass("cur");

	})
}


//页面加载出现
$(function() {
	tabChange();//选项卡
	getDymicData();//动态排行
	imgChange();//图片轮转
	consume();//客服
	loadCategory();//从数据库加载分类的数据
	loadHotBook();//加载热门图书  评论 收藏	//加载书籍推荐
	pageFunction();//总分页界面
	getJsoupData();
	var username = $("#namesession").val();
	var cuid = $("#cuidsession").val();
});
function diffType(){//分类
	$("#type-menu > ul > li").hover(function() {
		$(this).addClass("selected");
		$(".menu-panel", this).addClass("selected");
	}, function() {
		$(this).removeClass("selected");
		$(".menu-panel", this).removeClass("selected");
	});
}


function tabChange(){//选项卡
	var TabsMenu = document.getElementById("command_top");
	var hTag = TabsMenu.getElementsByTagName("h3");
	var manydiv = TabsMenu.getElementsByTagName("div");
	for (var i = 0; i < hTag.length; i++) {
		hTag[i].index = i;
		hTag[i].onclick = function() {
			for (var i = 0; i < hTag.length; i++) {
				hTag[i].className = "";
				manydiv[i].style.display = "none";
			}
			this.className = "active";
			manydiv[this.index].style.display = "block";
		}
	}
}

function imgChange(){//图片轮转
	var conDiv = $('#conDivDiv');
	var list = document.getElementById('listDiv');
	var buttons = document.getElementById('buttonsDiv').getElementsByTagName('span');
	var prev = $('.prev');
	var next = $('.next');
	var index = 1;
	var time;
	function dest(offset) {
		var newLeft = parseInt(list.style.left) + offset;
		list.style.left = newLeft + 'px';
		if (newLeft > -600) {
			list.style.left = -3000 + 'px';
		}
		if (newLeft < -3000) {
			list.style.left = -600 + 'px';
		}
	}
	function play() {
		time = setInterval(function() {
			next.onclick();
		}, 2000)
	}
	function stop() {
		clearInterval(time);
	}
	function clickChange() {
		for (var i = 0; i < buttons.length; i++) {
			if (buttons[i].className == "on") {
				buttons[i].className = "";
			}
		}
		buttons[index - 1].className = "on";
	}
	prev.onclick = function() {
		index -= 1;
		if (index < 1) {
			index = 5
		}
		clickChange();
		dest(600);
	};
	next.onclick = function() {
		index += 1;
		if (index > 5) {
			index = 1
		}
		dest(-600);
		clickChange();
	};
	for (var i = 0; i < buttons.length; i++) {
		(function(i) {
			buttons[i].onclick = function() {
				var clickIndex = parseInt(this.getAttribute('index'));
				var offset = 600 * (index - clickIndex); //这个index是当前图片停留时的index
				dest(offset);
				index = clickIndex; //存放鼠标点击后的位置，用于小圆点的正常显示
				clickChange();
			}
		})(i)
	}
	conDiv.onmouseover = stop;
	conDiv.onmouseout = play;
	play();
}



function consume(){//客服
	var tophtml = "<div id='menuId' class='izl-rmenu'><div class='btn botton-phone'></div><div class='btn returnTop'></div></div>";
	$("#top").html(tophtml);
	$("#menuId").each(function() {
		$(this).find(".botton-phone").mouseenter(function() {
			$(this).find(".phone").fadeIn("fast");
		});
		$(this).find(".botton-phone").mouseleave(function() {
			$(this).find(".phone").fadeOut("fast");
		});
		$(this).find(".returnTop").click(function() {
			$("html, body").animate({
				"scroll-top" : 0
			}, "fast");
		});
	});
	var lastRmenuStatus = false;
	$(window).scroll(function() {
		var _top = $(window).scrollTop();
		if (_top > 200) {
			$("#menuId").data("expanded", true);
		} else {
			$("#menuId").data("expanded", false);
		}
		if ($("#menuId").data("expanded") != lastRmenuStatus) {
			lastRmenuStatus = $("#menuId").data("expanded");
			if (lastRmenuStatus) {
				$("#menuId .returnTop").slideDown();
			} else {
				$("#menuId .returnTop").slideUp();
			}
		}
	});
}