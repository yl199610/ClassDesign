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
		width : 18,
		align:'center'
	}, {
		field : 'cemail',
		title : '邮箱',
		width : 40,
		align:'center'
	}, {
		field : 'csex',
		title : '性别',
		width : 26,
		align:'center'
	}, {
		field : 'cphone',
		title : '电话',
		width : 26,
		align:'center'
	} , {
		field : 'clastloginip',
		title : '登录ip',
		width : 26,
		align:'center'
	}, {
		field : 'cphoto',
		title : '头像',
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