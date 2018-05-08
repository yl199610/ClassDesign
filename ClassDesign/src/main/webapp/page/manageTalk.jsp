<%@page import="com.yl.cd.entity.Cadmin"%>
<%@page import="com.yl.cd.entity.Cuser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<base href="/ClassDesign/">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index</title>
</head>
<script type="text/javascript" src="easyui/jquery.min.js"></script>

<%
	Cadmin admin = (Cadmin)session.getAttribute("loginAdmin");
	if(admin!=null){
		session.setAttribute("user",admin.getCaname());
	}
%>
<script type="text/javascript">
var caname="${sessionScope.loginAdmin.caname}";
var cusername="${sessionScope.loginUser.cusername}";
/* $(function() {
	$('#name').val(cusername);
});
 */
	var ws = null;
	function startWebSocket() {
		if ('WebSocket' in window)
			ws = new WebSocket("ws://localhost:8080/ClassDesign/mywebsocket.do");
		else if ('MozWebSocket' in window)
			ws = new MozWebSocket("ws://localhost:8080/ClassDesign/mywebsocket.do");
		else
			alert("not support");

		ws.onmessage = function(evt) {
 			$("#xiaoxi").val(evt.data);

		};

		ws.onclose = function(evt) {
			//alert("close");
			$('#denglu').html('离线');
		};

		ws.onopen = function(evt) {
			//alert("open");
			$('#name').val(cusername);
			$('#denglu').html('在线');
			$('#userName').html(caname);
		};
	}

	function sendMsg() {
		var fromName = caname;
		var toName = $('#name').val(); //发给谁
		var content = $('#writeMsg').val(); //发送内容
		$('#writeMsg').val("");
		ws.send(fromName + "," + toName + "," + content);
	}
</script>
</head>
<body onload="startWebSocket();"style="width:1300px;height:600px;border:1px solid blue;text-align: center;">
	 <p>聊天窗口</p>
	登录状态：
	<span id="denglu" style="color: red;">正在登录</span>
	<br> 登录人：
	<span id="userName"></span>
	<br>
	<br>
	<div id="bigDiv"style="width:50%;height:65%;text-align: center;border:1px solid red;margin-left: 300px;">
		<div id="rightDiv" style="float:right;width:23%;height:100%;">	
			发送给<input type="text" id="name" value="${sessionScope.loginUser.cusername}"style="width:96%;height:5%;"></input>
		</div>
		
		<div id="leftDiv" style="float:left;width:76%;height:100%;">
			<div id="topDiv" style="background:#F8FCFD; float:left;width:100%;height:80%;">
				 聊天框：
				<textarea rows="19" cols="67" readonly id="xiaoxi">
				</textarea>
			</div>
			<div id="bottomDiv" style="background:#F7F5F5;float:left;width:100%;height:19%;">
				<textarea rows="4" cols="58" id="writeMsg" ></textarea>
				<input type="button" value="发送" onclick="sendMsg()" style="margin-top:20px; width: 11%;height:40%;"	></input>
			</div>
		</div>
	</div>
	<!--<<br> 发送给谁：
	<input type="text" id="name" value="小林"></input>
	<br> 发送内容：
	<input type="text" id="writeMsg"></input>
	<br> 聊天框：
	<textarea rows="13" cols="100" readonly id="xiaoxi"></textarea>
	<br>
	<input type="button" value="send" onclick="sendMsg()"></input>-->
</body>
</html>