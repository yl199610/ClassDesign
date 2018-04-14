$('#userInfo').datagrid({
	fitColumns : true,
	url:'cuser/userlist',
	singleSelect : true,
	pagination:true,
	columns : [ [ {
		field : 'cuid',
		title : '编号',
		width : 18,
		align:'center'
	}, {
		field : 'cusername',
		title : '姓名',
		width : 30,
		align:'center'
	} ,{
		field : 'cpassword',
		title : '密码',
		width : 22,
		align:'center'
	}, {
		field : 'cemail',
		title : '邮箱',
		width : 45,
		align:'center'
	}, {
		field : 'csex',
		title : '性别',
		width : 16,
		align:'center'
	}, {
		field : 'cphone',
		title : '电话',
		width : 26,
		align:'center'
	} , {
		field : 'clastloginip',
		title : '登录ip',
		width : 40,
		align:'center'
	},  {
		field : 'cbirthday',
		title : '生日',
		width : 40,
		align:'center'
	}, {
		field : 'cphoto',
		title : '头像',
		width : 50,
		align:'center',
		formatter: function(value,row,index){
			if(value==null){
			return '<img width="100" src="images/notpic.jpg">';  
			}else{
				return '<img width="100" src="'+value+'"/>'
			}
		}
	},{
		field : 'operator',
		title : '操作',
		width : 40,
		align:'center',
		formatter: function(value,row,index){
			var str = '<a class="operatorBtn" href="javascript:void(0)" onClick="userOperatorFun(1, ' 
				+ row.cuid + ')">删除</a>&nbsp;'
				+ '<a class="operatorBtn" href="javascript:void(0)" onClick="userOperatorFun(2, ' 
				+ row.cuid + ')">修改</a>&nbsp;'
				+ '<script>$(".operatorBtn").linkbutton();</script>';
			return str;
		}
	} ]]
});


function userOperatorFun(operType, id){
	switch(operType){
	case 1:
		stopUser(id);
		break;	
	case 2:
		parent.openPerson(id);
		break;
	}
}


function stopUser(id){
	$.messager.confirm('确认','您确认想要删除记录吗,删除后记录将无法恢复？',function(r){    
	    if (r){
	        $.get("cuser/archive?cuid="+id,function(data){
				$('#userInfo').datagrid("reload");
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
function getUserByName(){
	var formData = new FormData($("#getUserInfoForm")[0]); // FormData
	$.ajax({
		url : 'cuser/userlist',
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
