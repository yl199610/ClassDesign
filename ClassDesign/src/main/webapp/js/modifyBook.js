//获取对应信息
$.get("cbook/detail?cbid="+cnid,function(data){
	$("#mcbid").val(cnid);
	$("#mcauthor").val(data.levels);
	$("#mcisbn").val(data.ccname);
	$('#mbookname').combobox('setValue',data.parentid);
	$('#mcpublishtime').combobox('setText',data.cafree);
	$("#mcpublishing").val(data.description);
	$("#mcwordnumber").val(data.description);
	$("#pic").attr("src", data.cphoto);
	$("#mctotalpage").val(data.description);
	$("#mcintroduce").val(data.description);
	$("#mcatalogue").val(data.description);
	$("#medition").val(data.description);
},"json");

//修改用户
function modifyCate(){
	$("#modifyCateForm").form({
		  url: 'ccategory/modify',
		  success : function(data) {
			if (data.trim() == "true") {
				$("#modifyCategory").dialog("close"); //关闭修改框
				$("#categoryInfo").datagrid("reload"); // 刷新修改数据
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