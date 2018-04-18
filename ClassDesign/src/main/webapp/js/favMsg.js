$('#favInfo').datagrid({
	fitColumns : true,
	url:'cfav/list',
	singleSelect : true,
	pagination:true,
	columns : [ [ {
		field : 'cfid',
		title : '编号',
		width : 18,
		align:'center'
	}, {
		field : 'cuserid',
		title : '用户ID',
		width : 30,
		align:'center',
		formatter: function(value,row,index){
			return row['cuser']['cusername'];
		}
	} ,{
		field : 'cfp',
		title : '产品名',
		width : 18,
		align:'center',
		formatter: function(value,row,index){
			return row['cproduct']['cproductname'];
		}
	}, {
		field : 'cfstatus',
		title : '状态',
		width : 40,
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


function getFavBy(){
	var formData = new FormData($("#getFavInfoForm")[0]); // FormData
	$.ajax({
		url : 'cfav/list',
		type : 'POST',
		data : formData,
		async : false,
		cache : false,
		contentType : false,
		processData : false,
		success : function(returndata) {
			$('#favInfo').datagrid("loadData",returndata);
		}
	});
}