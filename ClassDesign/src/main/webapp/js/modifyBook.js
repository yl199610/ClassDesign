//获取对应信息
$.get("cbook/detail?cbid="+cnid,function(data){
	$("#mcbid").val(cnid);
	$("#mcauthor").val(data.cauthor);
	$("#mcisbn").val(data.cisbn);
	$("#mbookname").val(data.bookname);
	$("#mcpublishtime").val(data.cpublishtime);
	$("#mcpublishing").val(data.cpublishing);
	$("#mcwordnumber").val(data.cwordnumber);
	$("#pic").attr("src", data.cimage);
	$("#mctotalpage").val(data.ctotalpage);
	$("#mcintroduce").val(data.cintroduce);
	$("#mcatalogue").val(data.catalogue);
	$("#medition").val(data.edition);
},"json");

//修改书籍
function modifyBook(){
	$("#modifyBookForm").form({
		  url: 'cbook/modify',
		  success : function(data) {
			if (data.trim() == "true") {
				$("#modifyBook").dialog("close"); //关闭修改框
				$("#bookInfo").datagrid("reload"); // 刷新修改数据
			}  else {
				$.messager.show({
					title : '修改信息',
					msg : '修改失败',
					showType : 'show',
					style : {
						right : '',
						top : document.body.scrollTop + document.documentElement.scrollTop,
					}
				});
			}
		}
	});
}

function addPicPath(obj){
	var picStr=window.URL.createObjectURL(obj.files[0]);
	$("#pic").attr("src",picStr);
	$("#pic").attr("height","200px");
	$("#pic").attr("weight","200px");
}