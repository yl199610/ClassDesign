$('#orderInfo').datagrid({
	fitColumns : true,
	url:'corder/list',
	singleSelect : true,
	pagination:true,
	columns : [ [ {
		field : 'coid',
		title : '编号',
		width : 18,
		align:'center'
	}, {
		field : 'cordername',
		title : '订单名称',
		width : 30,
		align:'center'
	} ,{
		field : 'ctotalprice',
		title : '价格',
		width : 18,
		align:'center'
	}, {
		field : 'corderdesc',
		title : '描述',
		width : 40,
		align:'center'
	}, {
		field : 'cordertime',
		title : '时间',
		width : 26,
		align:'center'
	}, {
		field : 'cstatus',
		title : '状态',
		width : 26,
		align:'center'
	} , {
		field : 'cfulladdress',
		title : '地址',
		width : 26,
		align:'center'
	} , {
		field : 'cpostalcode',
		title : '邮编',
		width : 26,
		align:'center'
	} , {
		field : 'cphone',
		title : '电话',
		width : 26,
		align:'center'
	},{
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

function getOrderBy(){
	var formData = new FormData($("#getOrderInfoForm")[0]); // FormData
	$.ajax({
		url : 'corder/list',
		type : 'POST',
		data : formData,
		async : false,
		cache : false,
		contentType : false,
		processData : false,
		success : function(returndata) {
			$('#orderInfo').datagrid("loadData",returndata);
		}
	});
}