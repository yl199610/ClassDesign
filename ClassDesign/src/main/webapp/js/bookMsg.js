$('#bookInfo').datagrid({
	fitColumns : true,
	url:'cbook/list',
	singleSelect : true,
	pagination:true,
	columns : [ [ {
		field : 'cbid',
		title : '编号',
		width : 18,
		align:'center'
	}, {
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
	}, {
		field : 'cintroduce',
		title : '介绍',
		width : 26,
		align:'center'
	} , {
		field : 'edition',
		title : '印刷次数',
		width : 26,
		align:'center'
	} , {
		field : 'cimage',
		title : '出版社',
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