$("#leftSider").accordion({
	fit : true,
});

var urlJson = {
	"用户信息" : "userMsg.jsp",
	"图书类别信息" : "categoryMsg.jsp",
	"图书产品信息" : "productMsg.jsp",
	"书籍信息" : "bookMsg.jsp",
	"订单信息" : "orderMsg.jsp",
	"收藏信息" : "favMsg.jsp",
	"评论信息" : "commentMsg.jsp"
}

$(".menutree").tree({
	onClick : function(node) {
		// alert(node.text); // 当单击时弹出节点的文本值
		var nt = node.text;
		if ($('#main').tabs('exists', nt)) { // 判断面板是否存在
			// 打开显示为当前面板
			$('#main').tabs('select', nt);
		} else {
			// 添加面板
			if (urlJson[nt]) {
				$('#main').tabs('add', {
					title : nt,
					href : "back/" + urlJson[nt],
					closable : true,
				});
			} else {
				$('#main').tabs('add', {
					title : nt,
					content : '<h1>' + nt + '</h1>',
					closable : true,
				});
			}
		}
	}
});

$("#main").tabs({
	fit : true,
});

var cnid;
var pid;
// 修改用户信息
function openPerson(id) {
	cnid = id;
	$("#modifyUser").dialog({
		title : 'modifyUser',
		width : 600,
		height : 500,
		left : 300,
		modal : true,
		href : 'back/modifyUser.jsp'
	});
}
//修改目录信息
function openCate(id) {
	cnid = id;
	$("#modifyCategory").dialog({
		title : 'modifyCategory',
		width : 500,
		height : 350,
		left : 300,
		modal : true,
		href : 'back/modifyCategory.jsp'
	});
}


//修改书籍信息
function openBook(id) {
	cnid = id;
	$("#modifyBook").dialog({
		title : 'modifyBook',
		width : 650,
		height : 600,
		left : 300,
		modal : true,
		href : 'back/modifyBook.jsp'
	});
}


function openProduct(id){
	cnid = id;
	$("#modifyProduct").dialog({
		title : 'modifyProduct',
		width : 500,
		height : 600,
		left : 300,
		modal : true,
		href : 'back/modifyProduct.jsp'
	});
}