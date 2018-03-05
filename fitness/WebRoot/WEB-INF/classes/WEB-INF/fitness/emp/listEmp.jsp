<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>员工管理</title>
    
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
			        {field:"jointime",title:"入职时间",width:100,
			        	formatter: function(value,row,index){
			        		return dateFmt(row.jointime);
			        	}
			        },
			        {field:"username",title:"登录账号",width:100},
			        {field:"password",title:"登陆密码",width:100},
			        {field:"lastupdatetime",title:"最后修改时间",width:100,
			        	formatter: function(value,row,index){
			        		return dateFmtss(row.lastupdatetime);
			        	}
			        },
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
							return "<a href='javascript:void(0)' onclick='del("+row.eid+")'>删除</a>"+
							"&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' onclick='update("+row.eid+")'>修改</a>";
						}
					}
			    ]]    
			}); 
		});
		
		function del(id){
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
			    if (r){    
			        location.href="<%=request.getContextPath() %>/emp/deleteEmp.do?eid="+id;  
			    }    
			});  
		}
		
		function update(id){
			location.href="<%=request.getContextPath() %>/emp/toUpdateEmp.do?eid="+id;  
		}
		
		
		function dateFmt(shijian){
			var time = new Date(shijian);
		   	var year = time.getFullYear();  //年  
		   	var month = time.getMonth() + 1;  //月  
	        var day = time.getDate();         //日  
	        var hh = time.getHours();       //时  
	        var mm = time.getMinutes();    //分  
	        var ss = time.getSeconds();    //秒
	        var dateTimeStr= year + "-" +month + "-" + day ; 
		  return dateTimeStr;
		}
		
		function dateFmtss(shijian){
			var time = new Date(shijian);
		   	var year = time.getFullYear();  //年  
		   	var month = time.getMonth() + 1;  //月  
	        var day = time.getDate();         //日  
	        var hh = time.getHours();       //时  
	        var mm = time.getMinutes();    //分  
	        var ss = time.getSeconds();    //秒
	        var dateTimeStr= year + "-" +month + "-" + day+" "+hh+":"+mm+":"+ss; 
		  return dateTimeStr;
		}
	</script>
  </head>
  
  <body>
    <table id="dg"></table>  
  </body>
</html>
