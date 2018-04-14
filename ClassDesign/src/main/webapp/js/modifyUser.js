//获取对应信息
$.get("cuser/detail?sid="+cnid,function(data){
	$("#mcuid").val(cnid);
	$("#mcusername").val(data.cusername);
	$("#mcemail").val(data.cemail);
	$("#mcsex").val(data.csex);
	$("#mcphone").val(data.cphone);
	$("#mclastloginip").val(data.clastloginip);
	$("#pic").attr("src", data.cphoto);
	$("#mapplynum").val(data.applynum);
	$("#mcbirthday").val(data.cbirthday);
},"json");
//修改用户
function modifyUser(){
	$("#modifyUserForm").form({
		  url: 'cuser/modify',
		  success : function(data) {
			if (data.trim() == "true") {
				$("#modifyUser").dialog("close"); //关闭修改框
				$("#userInfo").datagrid("reload"); // 刷新修改数据
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
}