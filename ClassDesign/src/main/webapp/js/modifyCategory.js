$(document).ready(function() {
	find();
	
})

function find(){
	$('#mparentid').combobox({
		editable:false,
	    url:'ccategory/secondtype?ccid='+cnid,
	    valueField:'ccid',
	    textField:'ccname'
	});
}
//获取对应信息
$.get("ccategory/detail?ccid="+cnid,function(data){
	$("#mccid").val(cnid);
	$("#mlevels").val(data.levels);
	$("#mccname").val(data.ccname);
	$("#mdescription").val(data.description);
},"json");

//修改用户
function modifyCate(){
	$("#modifyCateForm").form({
		  url: 'ccategory/modify',
		  success : function(data) {
			if (data.trim() == "true") {
				$("#modifyCategory").dialog("close"); //关闭修改框
				$("#getCatInfoForm").datagrid("reload"); // 刷新修改数据
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