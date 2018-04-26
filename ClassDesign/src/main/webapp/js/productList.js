var cpid = location.href.substring(location.href.indexOf("?"));

//detail
$(function() {
	var ccid=cpid;
	$.post("cproduct/detail"+cpid, function(data) {
		$("#topproductOne img").attr("src",data.cimage);
		$(".padLeft10 h1").html(data.cproductname);
		$(".publisher a").html(data.cbook.cpublishing);
		$(".publishertime i").html(data.cbook.cpublishtime);
		$(".otherInfor em").html(data.cbook.cwordnumber);
		$(".otherInfor i").html(data.cbook.ctotalpage);
		$(".sellPrice").html(data.cwsscprice);
		$(".price").html(data.cnormalprice);
		
	}, "json");	
});