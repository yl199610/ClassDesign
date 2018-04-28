	$("#apspcaid").combobox({
		editable: false,
		url : 'ccategory/getallthridtype',
		valueField : 'ccid',
		textField : 'ccname'
	});
	$("#apcbcpid").combobox({
		editable: false,
		url : 'cbook/listallbook',
		valueField : 'cbid',
		textField : 'bookname',
		onSelect : function(record) {
			var newPtion = $("#apcbcpid").combobox('getText');
			alert(newPtion);
			var levels =record.text;
			alert(levels);
		}
	});	



function myformatter(date) {
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	var d = date.getDate();
	return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
}
function myparser(s) {
	if (!s)
		return new Date();
	var ss = (s.split('-'));
	var y = parseInt(ss[0], 10);
	var m = parseInt(ss[1], 10);
	var d = parseInt(ss[2], 10);
	if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
		return new Date(y, m - 1, d);
	} else {
		return new Date();
	}
}
function addProduct() {
	$("#addProductForm").form({
				url : "cproduct/add",
				success : function(data) {
					alert(data);
					if (data == "true") {
						$("#getProInfoForm").datagrid("reload"); // 刷新修改数据
						$.messager.show({
							title : '添加信息',
							msg : '添加成功',
							showType : 'show',
							style : {
								right : '',
								top : document.body.scrollTop
										+ document.documentElement.scrollTop,
							}
						});
					} else {
						$.messager.show({
							title : '添加信息',
							msg : '添加失败,可能插入的产品已经存在',
							showType : 'show',
							style : {
								right : '',
								top : document.body.scrollTop
										+ document.documentElement.scrollTop,
							}
						});
					}
				}
			});
}