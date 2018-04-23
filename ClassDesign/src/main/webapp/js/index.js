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
					$(".menu-list"+(i)).append('<div class="menu-list-div"><span>|</span><a class="thrida" href="#">'+data[i].ccategory[j].ccname+'</a></div>');
				}
			}
		}
	}, "json");
}
function loadHotBook(){
	$("#hotBookDivFirst").empty();
	$.post("cproduct/gethotproduct",function(data) {
		for(var i=0;i<data.length;i++){
			$('#hotBookDivFirst').append('<ul id="hotDiv"><li><a href="/1076435.htm" target="_blank">'+
					'<img src="'+data[i].cimage+'"></a></li><li>'+
					'<a href="/1076435.htm" title="'+data[i].cproductname+'" target="_blank">'+data[i].cproductname+'</a></li><li>'+
					'<span class="sellPrice">¥'+data[i].cwsscprice+'</span>&nbsp;&nbsp;&nbsp; <span class="price"><del>¥'+data[i].cnormalprice+'</del></span></br></li></ul>');
		}
	}, "json");
	
	$("#hotBookDivScoend").empty();
	$.post("cproduct/getcomproduct",function(data) {
		for(var i=0;i<data.length;i++){
			$('#hotBookDivScoend').append('<ul id="hotDiv"><li><a href="/1076435.htm" target="_blank">'+
					'<img src="'+data[i].cimage+'"></a></li><li>'+
					'<a href="/1076435.htm" title="'+data[i].cproductname+'" target="_blank">'+data[i].cproductname+'</a></li><li style="color:orange;">'+data[i].ckeywords+'条评论</li><li>'+
					'<span class="sellPrice">¥'+data[i].cwsscprice+'</span>&nbsp;&nbsp;&nbsp; <span class="price"><del>¥'+data[i].cnormalprice+'</del></span></br></li></ul>');
		}
	}, "json");
	
	$("#hotBookDivThird").empty();
	$.post("cproduct/getfavproduct",function(data) {
		for(var i=0;i<data.length;i++){
			$('#hotBookDivThird').append('<ul id="hotDiv"><li><a href="/1076435.htm" target="_blank">'+
					'<img src="'+data[i].cimage+'"></a></li><li>'+
					'<a href="/1076435.htm" title="'+data[i].cproductname+'" target="_blank">'+data[i].cproductname+'</a></li><li style="color:orange;">'+data[i].ckeywords+'条收藏</li><li>'+
					'<span class="sellPrice">¥'+data[i].cwsscprice+'</span>&nbsp;&nbsp;&nbsp; <span class="price"><del>¥'+data[i].cnormalprice+'</del></span></br></li></ul>');
		}
	}, "json");
	
	$.post("cproduct/getproductbyman",function(data) {
		for(var i=0;i<data.length;i++){
			$('.combookDiv').append('<div class="oneBookDiv"><ul id="hotDiv"><li><a href="/1076435.htm" target="_blank">'+
					'<img src="'+data[i].cimage+'"></a></li><li>'+
					'<a href="/1076435.htm" title="'+data[i].cproductname+'" target="_blank">'+data[i].cproductname+'</a></li><li>'+
					'<span class="sellPrice">¥'+data[i].cwsscprice+'</span></br><span class="price"><del>¥'+data[i].cnormalprice+'</del></span></br></li></ul></div>');
		}
	}, "json");
	
	
	$.post("cproduct/getcountproduct",function(data) {
		$('#countProductTotal').html(data);
	}, "json");
	
}

//页面加载出现
$(function() {
	tabChange();//选项卡
	imgChange();//图片轮转
	consume();//客服
	loadCategory();//从数据库加载分类的数据
	loadHotBook();//加载热门图书  评论 收藏	//加载书籍推荐
	//加载书的总数
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
