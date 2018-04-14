$('#categoryInfo').datagrid({
	fitColumns : true,
	url:'ccategory/list',
	singleSelect : true,
	pagination:true,
	columns : [ [ {
		field : 'ccid',
		title : '编号',
		width : 18,
		align:'center'
	}, {
		field : 'ccname',
		title : '图书名称',
		width : 30,
		align:'center'
	} ,{
		field : 'levels',
		title : '目录级别',
		width : 18,
		align:'center'
	}, {
		field : 'description',
		title : '描述',
		width : 26,
		align:'center'
	}, {
		field : 'cafree',
		title : '父目录',
		width : 26,
		align:'center'
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

function getCatroryBy(){
	var formData = new FormData($("#getCatInfoForm")[0]); // FormData
	$.ajax({
		url : 'ccategory/listlevels',
		type : 'POST',
		data : formData,
		async : false,
		cache : false,
		contentType : false,
		processData : false,
		success : function(returndata) {
			$('#userInfo').datagrid("loadData",returndata);
		}
	});
}