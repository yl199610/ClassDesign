$('#productInfo').datagrid({
	fitColumns : true,
	url:'cproduct/list',
	singleSelect : true,
	fit:true,
	pagination:true,
	pageList:[4,6],
	pageSize:4,
	columns : [ [ {
		field : 'cpid',
		title : '编号',
		width : 14,
		align:'center'
	}, {
		field : 'cproductname',
		title : '图书名称',
		width : 30,
		align:'center'
	} ,{
		field : 'caddtime',
		title : '添加时间',
		width : 38,
		align:'center'
	}, {
		field : 'cdescription',
		title : '描述',
		width : 46,
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
	}, {
		field : 'cimage',
		title : '图片',
		width : 50,
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
			var str = '<a class="operatorBtn" href="javascript:void(0)" onClick="productOperatorFun(1, ' 
				+ row.cpid + ')">删除</a>&nbsp;'
				+ '<a class="operatorBtn" href="javascript:void(0)" onClick="productOperatorFun(2, ' 
				+ row.cpid + ')">修改</a>&nbsp;'
				+ '<script>$(".operatorBtn").linkbutton();</script>';
			return str;
		}
	} ]]
});

function productOperatorFun(operType, id){
	switch(operType){
	case 1:
		stopProduct(id);
		break;	
	case 2:
		parent.openProduct(id);
		break;
	}
}


function stopProduct(id){
	$.messager.confirm('确认','您确认想要删除记录吗,删除后记录将无法恢复？',function(r){    
	    if (r){
	        $.get("cproduct/archive?cuid="+id,function(data){
				$('#productInfo').datagrid("reload");
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

function getProductBy(){
	var formData = new FormData($("#getProInfoForm")[0]);
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