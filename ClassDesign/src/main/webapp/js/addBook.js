function addBook() {
	$("#addBookForm").form({
				url : "cbook/add",
				success : function(data) {
					if (data) {
						$("#getBookInfoForm").datagrid("reload"); // 刷新修改数据
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
							msg : '添加失败,可能添加的书籍已经存在',
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

function addPicPath(obj) {
	var picStr = window.URL.createObjectURL(obj.files[0]);
	$("#pic").attr("src", picStr);
	$("#pic").attr("height", "50px");
	$("#pic").attr("weight", "50px");
}


function addBookExcel(){
	var formData = new FormData($("#importForm")[0]); // FormData
	$.ajax({
		url : 'report/import',
		type : 'POST',
		data : formData,
		async : false,
		cache : false,
		contentType : false,
		processData : false,
		success : function(returndata) {
			alert("插入数据成功！！！");
		}
	});
}









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
