function addPicPath(obj){
	var picStr=window.URL.createObjectURL(obj.files[0]);
	$("#pppcurrPic").attr("src",picStr);
}

//修改用户
function modifyUser(){
	 var formData = new FormData($("#modifyUser")[0]);	//FormData
	 $.ajax({  
		  url: 'cuser/modify',
		  type: 'POST',
		  data: formData,
		  async: false,  
		  cache: false,  
		  contentType: false,  
		  processData: false,  
		  success: function (returndata) {  
			 if(returndata.trim()=="true"){
				 alert("df");
				 parent.closePerson();
				 $('#userInfo').datagrid("reload");
			 }
			 $.messager.show({
					title:'修改用户',
					msg:returndata.trim()=="true"?"修改成功...":"修改失败!!!",
					showType:'show',
					style:{
						top:document.body.scrollTop+document.documentElement.scrollTop+40,
					}
				});
		  }
	 }); 
}