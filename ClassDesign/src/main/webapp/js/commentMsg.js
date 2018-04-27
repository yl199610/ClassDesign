$('#commentInfo').datagrid({
	fitColumns : true,
	url:'ccomments/list',
	singleSelect : true,
	pagination:true,
	columns : [ [ {
		field : 'cid',
		title : '编号',
		width : 18,
		align:'center'
	}, {
		field : 'cfp',
		title : '产品名',
		width : 30,
		align:'center',
			formatter: function(value,row,index){
				return row['cproduct']['cproductname'];
			}
	} ,{
		field : 'cuserid',
		title : '用户名',
		width : 18,
		align:'center',
		formatter: function(value,row,index){
			return row['cuser']['cusername'];
		}
	}, {
		field : 'theam',
		title : '主题',
		width : 30,
		align:'center'
	}, {
		field : 'ccontent',
		title : '内容',
		width : 40,
		align:'center'
	}, {
		field : 'ccdate',
		title : '日期',
		width : 40,
		align:'center'
	}
//	,{
//		field : 'operator',
//		title : '操作',
//		width : 40,
//		align:'center',
//		formatter: function(value,row,index){
//			var str = '<a class="operatorBtn" href="javascript:void(0)" onClick="songOperatorFun(1, ' 
//				+ row.kuSongId + ')">删除</a>&nbsp;'
//				+ '<a class="operatorBtn" href="javascript:void(0)" onClick="songOperatorFun(2, ' 
//				+ row.kuSongId + ')">修改</a>&nbsp;'
//				+ '<script>$(".operatorBtn").linkbutton();</script>';
//			return str;
//		}
//	} 
	]]
});


function getCommentBy(){
	var formData = new FormData($("#getCommentInfoForm")[0]); // FormData
	$.ajax({
		url : 'ccomments/list',
		type : 'POST',
		data : formData,
		async : false,
		cache : false,
		contentType : false,
		processData : false,
		success : function(returndata) {
			$('#commentInfo').datagrid("loadData",returndata);
		}
	});
}