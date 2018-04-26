$(document).ready(function() {
	find();
	
})

function find(){

	$('#mspcaid').combobox({
		editable:false,
	    url:'ccategory/getallthridtype',
//	    onSelect: function(row){
//            $('#mspcaid').combobox('setText', data.ccategory.ccname);
//        }
	    valueField:'ccid',
	    textField:'ccname'
	});
	$('#mcbcpid').combobox({
		editable:false,
	    url:'cbook/listallbook',
	    valueField:'cbid',
	    textField:'bookname'
	});
	
}
//获取对应信息
$.get("cproduct/detail?ccid="+cnid,function(data){
	$("#mcpid").val(cnid);
	$('#mcproductnamea').val(data.cproductname);
	$('#mcdescription').val(data.cdescription);
	$("#mcaddtime").val(data.caddtime);
	$("#pic").attr("src", data.cimage);
	$("#mcnormalprice").val(data.cnormalprice);
	$("#mcwsscprice").val(data.cwsscprice);
	$("#mckeywords").val(data.ckeywords);
	$('#mspcaid').combobox('setValue',data.ccategory.ccid);
	$('#mspcaid').combobox('setText',data.ccategory.ccname);
	$('#mcbcpid').combobox('setValue',data.cbook.cbid);
	$('#mcbcpid').combobox('setText',data.cbook.bookname);

},"json");

//修改用户
function modifyProduct(){
	$("#modifyProductBookForm").form({
		  url: 'cproduct/modify',
		  success : function(data) {
			if (data.trim() == "true") {
				$("#modifyProduct").dialog("close"); //关闭修改框
				$("#productInfo").datagrid("reload"); // 刷新修改数据
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
	$("#mpic").attr("height","100px");
	$("#mpic").attr("weight","100px");
}