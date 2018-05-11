$('#orderInfo').datagrid(
				{
					fitColumns : true,
					url : 'corder/list',
					singleSelect : true,
					pagination : true,
					columns : [ [
							{
								field : 'coid',
								title : '编号',
								width : 18,
								align : 'center'
							},
							{
								field : 'cordername',
								title : '订单名称',
								width : 30,
								align : 'center'
							},
							{
								field : 'ctotalprice',
								title : '价格',
								width : 18,
								align : 'center'
							},
							{
								field : 'corderdesc',
								title : '描述',
								width : 40,
								align : 'center'
							},
							{
								field : 'cordertime',
								title : '时间',
								width : 26,
								align : 'center'
							},
							{
								field : 'cstatus',
								title : '状态',
								width : 26,
								align : 'center'
							},
							{
								field : 'cfulladdress',
								title : '地址',
								width : 26,
								align : 'center'
							},
							{
								field : 'cpostalcode',
								title : '邮编',
								width : 26,
								align : 'center'
							},
							{
								field : 'cphone',
								title : '电话',
								width : 26,
								align : 'center'
							}
							] ]
				});

function getOrderBy() {
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
			$('#orderInfo').datagrid("loadData", returndata);
		}
	});
}

/*$(document).ready(function() {
	find();
//有模糊查询 不能实行
})

function find() {
	var url = "cuser/userlist";
	$.getJSON(url, function(json) {
		$('#cordid').combobox({
			data : json.rows,
			valueField : 'cuid',
			textField : 'cusername'
		});
	});
}*/