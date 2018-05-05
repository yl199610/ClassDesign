var ccid = location.href.substring(location.href.indexOf("?"));
var num=0;
$(function() {
	pageGetProductFunction();//总分页界面

});
function operate() {
	document.getElementById('div_test').style.display = "";
	setTimeout("disappeare()", 2000);
}
function disappeare() {
	document.getElementById('div_test').style.display = "none";
}

function fav(productid){
	var cuid =$("#cuidsession").val();
	$.post("cfav/favbook",{"cuserid": cuid, "cfp": productid},function(data) {
		var jsonarray = JSON.stringify(data);
		if (jsonarray == "true") {
			$("#div_test").html("收藏图书成功！！！");
			operate();
		} else {
			$("#div_test").html("请勿重复收藏图书！！！");
			operate();
		}
	}, "json");	
	
}

function pageGetProductFunction(){
	$.post("cproduct/getproductbyccid"+ccid, function(data) {
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
	$('#bookulshow').empty();
	var len = data.rows.length;
	for(var i=0;i<len;i++){
		$("#bookulshow").append('<li><div class="cover"><a title="'+data.rows[i].cproductname+'" href="#"><img src="'+data.rows[i].cimage+'" class="lazyImg"></a></div>'+
		'<div class="infor"><h2 class="name"><a href="#">'+data.rows[i].cproductname+'</a></h2><div class="otherInfor">'+
		'<a href="#" class="author">'+data.rows[i].cbook.cauthor+'</a><i>&nbsp;&nbsp;/&nbsp;&nbsp;</i><span class="pulishTiem" title="出版时间">'+data.rows[i].cbook.cpublishtime+'&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;<span class="paid">'+data.rows[i].cpid+'</span></span>'+
		'</div><div class="priceWrap"><span class="priceTit">定价:</span><span class="sellPrice">'+data.rows[i].cwsscprice+'</span></div><p class="recoLagu">'+data.rows[i].cbook.cintroduce+'</p><div class="oparateButton">'+
		'<input id="addCarpriduct" type="button" value="加入购物车" onClick="getValue()" /><a id="addfavpriduct" href="javascript:void(0);" onClick="fav('+data.rows[i].cpid+')"> <span>收藏</span></div></div></li>');
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
	if(data.currPage>=1&&currPage<=totalPage){
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
	$.post("cproduct/getproductbyccid"+ccid+"&pageNos="+pageCurr,function(data) {
		$("#bodyOrder").html("");  
		loadDataOrder(data);
		pageNextAndPerOrder(data);
	}, "json");
}

//加入购物车
function getValue() {
	var cusername = $("#namesession").val();
 	if(cusername==null||cusername==""){
		alert("请先登录再加入商品到购物车");
		return;
	} 
	num++;
	var name = $(".name a").html();
	var money = $(".sellPrice").html();
	var productid = $(".paid").html();
	saveCar(name,money,productid,num,cusername);
	$("#div1").attr("style", "display:block;");
}


function saveCar(cproductname,cwsscprice,spcaid,cpfree,ckeywords){
	$.post("cproduct/saveProductModel",{"ckeywords": ckeywords, "cproductname": cproductname, "cwsscprice": cwsscprice, "spcaid": spcaid, "cpfree": cpfree },function(data) {
		loadCarData(data);
	}, "json");	
}
function loadCarData(data){
	var cusername = $("#namesession").val();
	var text_html='';
	var totalMoney=0;
	$("#ul_panel").html("");
	for(var i=0;i<data.length;i++){
		if(data[i].ckeywords===cusername){
			text_html+='<tr class="'+"alltd"+(i)+'"><td  class="'+"product"+(i)+'">'+data[i].cproductname+'</td><td  class="'+"price"+(i)+'">'+data[i].cwsscprice+'</td><td class="thrid"><a class="red" onclick="reduce(\'\'+'+data[i].spcaid+','+data[i].cpfree+','+i+',this)">-</a><span class="'+"spand"+(i)+'">'+data[i].cpfree+' </span> ';
			text_html+='<a class="add" onclick="addNum(\'\'+'+data[i].spcaid+','+data[i].cpfree+','+i+',this)">+</a></td><td class="ontTotal'+(i)+'">￥'+(data[i].cwsscprice*data[i].cpfree)+'</td></tr>';
			totalMoney+=data[i].cwsscprice*data[i].cpfree;
			$("#totalMoney").text(totalMoney);
		}
	}
	$("#ul_panel").append(text_html); 
}


function addNum(spcaid,a,i,t){
	var textval = $(".spand"+(i)).html();
	var num2 = parseInt(textval)+1;
	$(".spand"+(i)).html(num2); 
	var onetotal2 = $(".price"+(i)).html();
	var onetotal = parseInt(onetotal2)*num2;
	$(".ontTotal"+(i)).html('￥'+onetotal)
	var one = $("#totalMoney").html();
	$("#totalMoney").text(parseInt(one)+parseInt(onetotal2));

	var cproductname= $(".product"+(i)).html();
	var cwsscprice= $(".price"+(i)).html();
	var cpfree =$(".spand"+(i)).html(); 
	var cpfree1 = ontTotal=$(".ontTotal"+(i)).html(); 
	var cpfree2 = cpfree1.substr(1);
	saveCar(cproductname,cwsscprice,spcaid,cpfree,cusername);
	
}

function reduce(spcaid,a,i,t){
	var totalAmount1=0;
	$("#ul_panel").find("tr").each(function () {
		$(this).find('td:eq(2) span').each(function() { 
			var total= parseInt($(this).text());
			totalAmount1+=total;
		})
	});
	var totalAmount=totalAmount1-1;
	$(".cndns-right-btn sup").html(totalAmount);
	var textval = $(".spand"+(i)).html();
	var num2 = parseInt(textval)-1;
	var onetotal2 = $(".price"+(i)).html();
	var one = $("#totalMoney").html();
	if(num2==0){
		num2=1;
		$(".alltd"+(i)).empty();
		$("#totalMoney").text(parseInt(one)-parseInt(onetotal2));
		saveCar(cproductname,cwsscprice,spcaid,cpfree);
		return;
	}
	var red1 = $(".ontTotal"+(i)).html();
	var red = red1.substr(1);
	var onetotal = parseInt(red)-parseInt(onetotal2);
	$(".ontTotal"+(i)).html('￥'+onetotal);
	
	$("#totalMoney").text(parseInt(one)-parseInt(onetotal2));
	$(".spand"+(i)).html(num2);

	var cproductname= $(".product"+(i)).html();
	var cwsscprice= $(".price"+(i)).html();
	var cpfree =$(".spand"+(i)).html(); 
	var cpfree1 = ontTotal=$(".ontTotal"+(i)).html(); 
	var cpfree2 = cpfree1.substr(1);
	saveCar(cproductname,cwsscprice,spcaid,cpfree,cusername);
	
}