<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>删除页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<jsp:include page="/main/jslink.jsp"></jsp:include>
	<script type="text/javascript">
		 var alltime = 5;
		 function setTime() {
			  if (alltime <= 0) {
				   clearInterval(s);
				   location.href = "<%=request.getContextPath()%>/emp/toListEmp.do";
			  } else {
				   alltime--;
				   $("#time").html(alltime);
			  }
		 }
		 s = setInterval("setTime()", 1000);
	</script>
  </head>
  
  <body>
    <center>删除成功！！！<div id="time" style="display: inline;"></div>秒后跳回原页面。。。</center>
  </body>
</html>
