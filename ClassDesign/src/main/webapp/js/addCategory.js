$("#amlevels").combobox({
	editable: false,
	onSelect : function(record) {
		var levels =record.text;
		$('#ambookname').combobox({
			editable : false,
			url : 'ccategory/lostFouns?levels='+levels,
			valueField : 'ccid',
			textField : 'ccname'
		});
	}
});

function addCategory() {
	$("#addCategoryFormD").form({
				url : "ccategory/add",
				success : function(data) {
					alert(data);
					if (data.trim() == "true") {
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
							msg : '添加失败,可能添加的目录已经存在',
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