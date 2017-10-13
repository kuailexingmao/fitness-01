<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/ztree3/zTreeStyle/zTreeStyle.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/easyui/themes/metro/easyui.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/easyui/themes/icon.css"
	type="text/css"></link>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ztree3/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#win').window({
			title : "登陆窗口",
			width : 600,
			height : 400,
			modal : true,
			collapsible : false,
			minimizable : false,
			maximizable : false,
			closable : false,
			draggable : false,
			resizable : false, //不能拉伸
			shadow : true, //显示阴影
			width : 500,
			height : 300,
			top : 100
		});

		//重置表单
		$('#reset').bind('click', function() {
			$('#login_form').form('reset');

		});
		
		//重置表单
		$('#login').bind('click', function() {
			login();
		});
		
		function login(){
			var param = $("#login_form").serialize();
			$.ajax({
				type:"post",
				url:"<%=request.getContextPath()%>/login/login.do",
				data:param,
				dataType:"text",
				success:function(datas){
				console.info(datas);
					if(datas == "false"){
						$.messager.alert('消息提示','用户名或密码错误','info');
					}else if(datas == "true"){
						location.href="<%=request.getContextPath()%>/login/layout.do"
					}
				}
			});
		}
	})
</script>
</head>

<body class="easyui-layout">
	<div id="win" style="text-align: center;">
		<form id="login_form" method="post">
			<table style="text-align: center;margin:60px 0 0 120px;">
				<tr>
					<td>用户名:</td>
					<td><input type="text" id="username" name="username" />
					</td>
				</tr>
				<tr>
					<td>密&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
					<td><input type="password" id="password" name="password" />
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="radio" id="boss" name="isboss"
						value="1" />老板 &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
						id="employees" name="isboss" value="0" />员工</td>
				</tr>
				<tr>
					<td colspan="2"><a href="javascript:void(0);" id="login"
						class="easyui-linkbutton">登陆</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:void(0);" id="reset" class="easyui-linkbutton">重置</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
