var cpid = location.href.substring(location.href.indexOf("?"));

//detail
$(function() {
	var ca = cpid.split("=");
	var productid = ca[1];
	var cusername="${sessionScope.loginUser.cusername}";
	var cuid="${sessionScope.loginUser.cuid}";
	var ccid=cpid;

	
	$.post("cproduct/detail"+cpid, function(data) {
		$("#topproductOne img").attr("src",data.cimage);
		$("#authBymy").html(data.cbook.cauthor);
		$(".padLeft10 h1").html(data.cproductname);
		$(".publisher a").html(data.cbook.cpublishing);
		$(".publishertime i").html(data.cbook.cpublishtime);
		$(".otherInfor em").html(data.cbook.cwordnumber);
		$(".otherInfor2 i").html(data.cbook.ctotalpage);
		$(".otherInfor3 i").html(productid);
		$(".sellPrice").html(data.cwsscprice);
		$(".price").html(data.cnormalprice);
		$("#first1").html("ISBN："+data.cbook.cisbn);
		$("#first2").html("条形码："+data.cbook.cisbn+"9787514614794");
		$("#first3").html("装帧：简裝本");
		$("#first4").html("版次："+data.cbook.edition);
		$("#first5").html("册数：暂无");
		$("#first6").html("重量：暂无");
		$("#first7").html("印刷次数："+data.cbook.edition);
		$("#intrducebookmsg p").html(data.cbook.cintroduce);
	}, "json");	
	
	pageProductFunction();//总分页界面

});

function pageProductFunction(){
	$.post("ccomments/getcommentsbyId"+cpid, function(data) {
		var len = data.rows.length;
		if(len<=0){
			$("#commentsDivcar").append('<span style="color:red;">此书籍暂无评论！！！</span>');
			return;
		}
		loadDataProduct(data);
		pageNextAndPerProduct(data);
	}, "json");	
}

function loadDataProduct(data){
	var len = data.rows.length;
//	if(len<=0){
//		$("#commentsDivcar").append('<span style="color:red;">此书籍暂无评论！！！</span>');
//		return;
//	}
	for(var i=0;i<len;i++){
		$("#commentsDivcar").append('<li><div class="listLeft" style="width:80%; border-bottom: 1px solid red;">'+
				'<div class="tit"><div class="startWrap"><i class="one"></i><i class="one"></i><i></i><i></i><i></i></div>'+
				'<div class="theme">主题：'+data.rows[i].theam+'</div></div></br><div class="con"><p>'+data.rows[i].ccontent+'</p>'+
				'</div><div class="oparaButWrap"><span class="time">'+data.rows[i].ccdate+'</span><div class="oparaBut" data-id="685252" data-bookid="6474240">'+
				'<a href="javascript:void(0)" class="support"><span class="icon"></span></a><a href="javascript:void(0)" class="disagree"><span class="icon"></span></a>'+
				'</div></div></div><div class="listRight"><div class="userIcon1"><img style="text-align:vertical-align;display:block" src="'+data.rows[i].cuser.cphoto+'"></a>'+
				'<span><a target="_blank">读者：'+data.rows[i].cuser.cusername+'</a></span></div></li></hr>');
	}
}


//分页栏
function pageNextAndPerProduct(data){
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
//	else{
//		getPerPage(totalPage);
//	}
}


//上下页的点击事件
function getPerPage(perpage){
	getData(perpage);
}


//获得数据
function getData(pageCurr){
	$.post("ccomments/getcommentsbyId"+cpid+"&pageNos="+pageCurr,function(data) {
		$('#commentsDivcar').empty();
		loadDataProduct(data);
		pageNextAndPerProduct(data);
	}, "json");
}

//function success(){
//	setTimeout(function(){
//		alert("加入购物车成功");
//	},1000)
//}


