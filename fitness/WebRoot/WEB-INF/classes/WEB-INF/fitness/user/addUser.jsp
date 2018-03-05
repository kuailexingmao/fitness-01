<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css" type="text/css"></link>
	 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/My97DatePicker/skin/WdatePicker.css">
 	 <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/My97DatePicker/WdatePicker.js"></script>
  </head>
  
  <body>
  <h2>增加客户</h2>
    <form action="<%=request.getContextPath() %>/user/addUser.do" method="post">
    	<table>
    		<tr>
    			<td>客户名称:</td>
    			<td><input type="text" id="uname" name="uname" />
    			</td>
    		</tr>
    		<tr>
    			<td>客户性别:</td>
    			<td>
    				<input type="radio" name="sex" value="1"/>男
    				&nbsp;&nbsp;&nbsp;&nbsp;
    				<input type="radio" name="sex" value="0"/>女
    			</td>
    		</tr>
    		<tr>
    			<td>客户身份证号:</td>
    			<td><input type="text" id="certifyno" name="certifyno" /></td>
    		</tr>
    		<tr>
    			<td>联系方式:</td>
    			<td><input type="text" id="tel" name="tel" /></td>
    		</tr>
    		<tr>
    			<td>客户住址:</td>
    			<td><input type="text" id="address" name="address" /></td>
    		</tr>
    		<tr>
    			<td>客户邮箱:</td>
    			<td><input type="text" id="email" name="email" /></td>
    		</tr>
    		<tr>
    			<td>开户时间:</td>
    			<td><input type="text" id="opentime" name="time" onclick="WdatePicker()" class="Wdate"/></td>
    		</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="确认添加"/>
				</td>
			</tr>
    	</table>
    </form>
  </body>
</html>
