$('#categoryInfo').datagrid({
	fitColumns : true,
	url:'ccategory/listlevels',
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
			var str = '<a class="operatorBtn" href="javascript:void(0)" onClick="cateOperatorFun(1, ' 
				+ row.ccid + ')">删除</a>&nbsp;'
				+ '<a class="operatorBtn" href="javascript:void(0)" onClick="cateOperatorFun(2, ' 
				+ row.ccid + ')">修改</a>&nbsp;'
				+ '<script>$(".operatorBtn").linkbutton();</script>';
			return str;
		}
	} ]]
});

function cateOperatorFun(operType, id){
	switch(operType){
	case 1:
		delCate(id);
		break;	
	case 2:
		parent.openCate(id);
		break;
	}
}


function delCate(id){
	$.messager.confirm('确认','您确认想要删除记录吗,删除后记录将无法恢复？',function(r){    
	    if (r){
	        $.get("ccategory/archive?ccid="+id,function(data){
				$('#categoryInfo').datagrid("reload");
	        	$.messager.show({
					title:'删除用户',
					msg:data.trim()=="true"?"删除成功...":"删除失败!!!",
					showType:'show',
					style:{
						top:document.body.scrollTop+document.documentElement.scrollTop+40,
					}
				});
	        },"json");   
	    }    
	});
}

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
			$('#categoryInfo').datagrid("loadData",returndata);
		}
	});
}