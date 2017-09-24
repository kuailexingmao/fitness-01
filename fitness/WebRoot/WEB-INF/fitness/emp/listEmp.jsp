<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'listEmp.jsp' starting page</title>
    
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
			    url:"<%=request.getContextPath() %>/emp/listEmp.do",
			    fitColumns:true,
			    rownumbers:true,
			    singleSelect:true,
			    pagination:true,
			    pageNumber:1,
			    pageSize:10,
			    pageList:[10,10,30,50],
			    columns:[[    
			        {field:"ename",title:"员工名称",width:100},    
			        {field:"tel",title:"联系方式",width:100},    
			        {field:"address",title:"联系地址",width:100},
			        {field:"email",title:"邮箱地址",width:100},
			        {field:"jointime",title:"入职时间",width:100},
			        {field:"username",title:"登录账号",width:100},
			        {field:"password",title:"登陆密码",width:100},
			        {field:"lastupdatetime",title:"最后修改时间",width:100},
			        {field:"isboss",title:"是否管理",width:100,
			        	formatter: function(value,row,index){
			        		if(row.isboss == "1"){
								return "是";
			        		}else if(row.isboss == "0"){
			        			return "否";
			        		}
						}
			        },
			        {field:'caozuo',title:'操作', width:80,
						formatter: function(value,row,index){
							return "<a href='javascript:void(0)' onclick='del("+row.id+")'>删除</a>";
						}
					}
			    ]]    
			}); 
		});
		
		function del(id){
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    if (r){    
			        alert('确认删除');    
			    }    
			});  
		}
	</script>
  </head>
  
  <body>
    <table id="dg"></table>  
  </body>
</html>
