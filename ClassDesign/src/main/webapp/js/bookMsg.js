$('#bookInfo').datagrid({
	fitColumns : true,
	url:'cbook/list',
	fit:true,
	singleSelect : true,
	pagination:true,
	columns : [ [ {
		field : 'cbid',
		title : '编号',
		width : 18,
		align:'center'
	}, {
		field : 'bookname',
		title : '书名',
		width : 30,
		align:'center'
	} , {
		field : 'cauthor',
		title : '作者',
		width : 30,
		align:'center'
	} ,{
		field : 'cisbn',
		title : '发布编号',
		width : 18,
		align:'center'
	}, {
		field : 'cpublishtime',
		title : '印刷时间',
		width : 26,
		align:'center'
	} , {
		field : 'cpublishing',
		title : '出版社',
		width : 26,
		align:'center'
	} , {
		field : 'cwordnumber',
		title : '总字数',
		width : 26,
		align:'center'
	} , {
		field : 'ctotalpage',
		title : '总页数',
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
			var str = '<a class="operatorBtn" href="javascript:void(0)" onClick="bookOperatorFun(1, ' 
				+ row.cbid + ')">删除</a>&nbsp;'
				+ '<a class="operatorBtn" href="javascript:void(0)" onClick="bookOperatorFun(2, ' 
				+ row.cbid + ')">修改</a>&nbsp;'
				+ '<script>$(".operatorBtn").linkbutton();</script>';
			return str;
		}
	} ]]
});


function bookOperatorFun(operType, id){
	switch(operType){
	case 1:
		delBook(id);
		break;	
	case 2:
		parent.openBook(id);
		break;
	}
}


function delBook(id){
	$.messager.confirm('确认','您确认想要删除记录吗,删除后记录将无法恢复？',function(r){    
	    if (r){
	        $.get("cbook/archive?cbid="+id,function(data){
				$('#bookInfo').datagrid("reload");
	        	$.messager.show({
					title:'删除书籍',
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


function getBookBy(){
	var formData = new FormData($("#getBookInfoForm")[0]); // FormData
	$.ajax({
		url : 'cbook/list',
		type : 'POST',
		data : formData,
		async : false,
		cache : false,
		contentType : false,
		processData : false,
		success : function(returndata) {
			$('#bookInfo').datagrid("loadData",returndata);
		}
	});
}
