$('#productInfo').datagrid({
	fitColumns : true,
	url:'cproduct/list',
	singleSelect : true,
	pagination:true,
	columns : [ [ {
		field : 'cpid',
		title : '编号',
		width : 18,
		align:'center'
	}, {
		field : 'cproductname',
		title : '图书名称',
		width : 30,
		align:'center'
	} ,{
		field : 'caddtime',
		title : '添加时间',
		width : 18,
		align:'center'
	}, {
		field : 'cdescription',
		title : '描述',
		width : 26,
		align:'center'
	}, {
		field : 'cnormalprice',
		title : '正常价格',
		width : 26,
		align:'center'
	} , {
		field : 'cwsscprice',
		title : '网上价格',
		width : 26,
		align:'center'
	} , {
		field : 'cpstatus',
		title : '状态',
		width : 26,
		align:'center'
	}, {
		field : 'cimage',
		title : '图片',
		width : 100,
		align:'center',
		formatter: function(value,row,index){
			if(value==null){
			var opStr='<image width="100" src="images/notpic.jpg">';  
			return opStr;
			}else{
				return '<image width="100" src="'+value+'"/>'
				
			}
		}
	} ,{
		field : 'operator',
		title : '操作',
		width : 40,
		align:'center',
		formatter: function(value,row,index){
			var str = '<a class="operatorBtn" href="javascript:void(0)" onClick="songOperatorFun(1, ' 
				+ row.kuSongId + ')">删除</a>&nbsp;'
				+ '<a class="operatorBtn" href="javascript:void(0)" onClick="songOperatorFun(2, ' 
				+ row.kuSongId + ')">修改</a>&nbsp;'
				+ '<script>$(".operatorBtn").linkbutton();</script>';
			return str;
		}
	} ]]
});


function getProductBy(){
	var formData = new FormData($("#getProInfoForm")[0]); // FormData
	$.ajax({
		url : 'cproduct/list',
		type : 'POST',
		data : formData,
		async : false,
		cache : false,
		contentType : false,
		processData : false,
		success : function(returndata) {
			$('#productInfo').datagrid("loadData",returndata);
		}
	});
}