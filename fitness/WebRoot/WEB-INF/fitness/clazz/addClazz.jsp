<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加课程</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<jsp:include page="/main/jslink.jsp"></jsp:include>
  </head>
  
  <body>
  <h2 style="text-align: center;">添加课程</h2>
    <form id="ff" method="post" action="<%=request.getContextPath() %>/clazz/addClazz.do" style="text-align: center;">   
	    <div>   
	        <label for="cno">课程编号:</label>   
	        <input class="easyui-validatebox" type="text" name="cno" data-options="required:true" />
	    </div>   
	    <div>   
	        <label for="cname">课程名称:</label>   
	        <input class="easyui-validatebox" type="text" name="cname" data-options="required:true" />   
	    </div>   
	    <div>   
	        <label for="ctime" style="padding-left: 30px;">课程时长:</label>   
	        <input class="easyui-validatebox" type="text" name="ctime" data-options="required:true"/>小时 
	    </div>  
	    <div>   
	        <label for="cprice" style="padding-left: 15px;">课程费用:</label>   
	        <input class="easyui-validatebox" type="text" name="cprice" data-options="required:true"/>元
	    </div>  
	    <div>   
	        <input class="easyui-validatebox" type="submit" value="确定添加"/>
	    </div>  
	</form>  
  </body>
</html>
