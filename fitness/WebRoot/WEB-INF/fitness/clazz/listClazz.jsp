<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>课程管理</title>
    
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
		$(function(){
			$("#dg").datagrid({    
			    url:"<%=request.getContextPath() %>/clazz/listClazz.do",
			    fitColumns:true,
			    rownumbers:true,
			    singleSelect:true,
			    pagination:true,
			    pageNumber:1,
			    pageSize:5,
			    pageList:[5,10,15],
			    columns:[[    
			        {field:"cno",title:"课程编号",width:100},    
			        {field:"cname",title:"课程名称",width:100},    
			        {field:"ctime",title:"课程时长（小时）",width:100},
			        {field:"cprice",title:"课程价格（元）",width:100},
			        {field:'caozuo',title:'操作', width:80,
						formatter: function(value,row,index){
							return "<a href='javascript:void(0)' onclick='del("+row.cid+")'>删除</a>"+
							"&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' onclick='update("+row.cid+")'>修改</a>";
						}
					}
			    ]]    
			}); 
		});
		
		function del(id){
		console.info(id);
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    if (r){    
			        location.href="<%=request.getContextPath() %>/clazz/deleteClazz.do?cid="+id;  
			    }    
			});  
		}
		
		function update(id){
			location.href="<%=request.getContextPath() %>/clazz/toUpdateClazz.do?cid="+id;  
		}
		
	</script>
  </head>
  
  <body>
    <table id="dg"></table>  
  </body>
</html>
