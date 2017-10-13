<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateEmp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<jsp:include page="/main/jslink.jsp"></jsp:include>
  	<%--  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css" type="text/css"></link> --%>
	 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/My97DatePicker/skin/WdatePicker.css">
 	 <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/My97DatePicker/WdatePicker.js"></script>
 	 
 	 <script type="text/javascript">
 	 	$(function(){
 	 	});
 	 </script>
  </head>
  
  <body>
  <h2 style="text-align: center;">添加员工</h2>
    <form id="ff" method="post" action="<%=request.getContextPath() %>/emp/addEmp.do" style="text-align: center;">   
    <div>   
        <label for="ename">员工名称:</label>   
        <input class="easyui-validatebox" type="text" name="ename" data-options="required:true" />
    </div>   
    <div>   
        <label for="tel">员工电话:</label>   
        <input class="easyui-validatebox" type="text" name="tel" />   
    </div>   
    <div>   
        <label for="address">员工住址:</label>   
        <input class="easyui-validatebox" type="text" name="address"/>   
    </div>  
    <div>   
        <label for="email">员工邮箱:</label>   
        <input class="easyui-validatebox" type="text" name="email" />   
    </div>  
    <div>   
        <label for="time">入职时间:</label>   
		<input type="text" name="time" id="jointime" onclick="WdatePicker()" class="Wdate" ></input>
    </div>  
    <div>   
        <label for="username">员工账号:</label>   
        <input class="easyui-validatebox" type="text" name="username" data-options="required:true" />   
    </div>  
    <div>   
        <label for="password">员工密码:</label>   
        <input class="easyui-validatebox" type="text" name="password" data-options="required:true" />   
    </div>
    <div>   
        <label for="isboss">是否管理人员:</label>   
        <input class="easyui-validatebox" type="radio" name="isboss" value="1"/>是 
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input class="easyui-validatebox" type="radio" name="isboss" value="0"/>否
    </div>  
    <div>   
        <input class="easyui-validatebox" type="submit" value="确定添加"/>
    </div>  
</form>  
  </body>
</html>
