<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="/ClassDesign/">
<meta charset="UTF-8">
<title>忘记密码</title>
<link type="text/css" rel="stylesheet" href="css/forgetPassword.css">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
</head>
<script>
	function getPassword(){
		var cusername = $("#cusername").val();
		$.post("cuser/checkeamil?cusername="+cusername,function(data) {
			$("#cemail").val(data.cemail);
		}, "json");
	}
</script>
<body>
	<form  id="forgetForm" action="cuser/forget" method="post">
		<p><input name="cusername" id="cusername" required="required" placeholder="请求输入用户名" onblur="getPassword()"/></p>
		<p><input type="email" id="cemail" readonly="readonly" name="cemail" required="required" placeholder="请求输入找出密码邮箱"/></p>
		<p><input type="submit" id="forpwd" value="找回密码" /></p>
	</form>
</body>
</html>