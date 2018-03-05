<%--
  Created by IntelliJ IDEA.
  User: xingmao
  Date: 2017/10/16
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <jsp:include page="/main/jslink.jsp"></jsp:include>
    <script type="text/javascript">
        $(function(){
        	 var hideIndexs = new Array();
        	$("#ss").searchbox({ 
				searcher:function(value){ 
					hideIndexs.length = 0;
		            if (value == "请输入名称查询") {
		                value = "";
		            }
		            
		            //结束datagrid的编辑.
            		endEdit();
				    var rows = $("#dg").datagrid("getRows");

		            var cols = $("#dg").datagrid("options").columns[0];
		
		            for (var i = rows.length - 1; i >= 0; i--) {
		                var row = rows[i];
		                var isMatch = false;
		                for (var j = 0; j < cols.length; j++) {
		
		                    var pValue = row[cols[j].field];
		                    if (pValue == undefined) {
		                        continue;
		                    }
		                    if (pValue.toString().indexOf(value) >= 0) {
		                        isMatch = true;
		                        break;
		                    }
		                }
		                if (!isMatch)
		                    hideIndexs.push(i);
		                $("#dg").datagrid("refreshRow", i);
		            }
		
		
		        },
		        prompt: "请输入名称查询"
			}); 
        	
            $("#dg").datagrid({
                url:"<%=request.getContextPath() %>/user/listUser.do",
                fitColumns:true,
                rownumbers:true,
                singleSelect:true,
                pagination:true,
                rowStyler: function (index, row) {
	                if (hideIndexs.indexOf(index)>=0) { 
	                	return "background:red; display:none"; 
	                }
	            },
                pageNumber:1,
                pageSize:5,
                pageList:[5,10,15],
                columns:[[
                    {field:"uname",title:"客户名称",width:100},
                    {field:"sex",title:"课程名称",width:100,
                        formatter: function(value,row,index){
                            if(row.sex == "1"){
                                return "男";
                            }else if(row.sex == "0"){
                                return "女";
                            }
                        }
                    },
                    {field:"certifyno",title:"身份证号",width:100},
                    {field:"tel",title:"联系方式",width:100},
                    {field:"address",title:"居住地址",width:100},
                    {field:"email",title:"联系邮箱",width:100},
                    {field:"opentime",title:"开户时间",width:100,
                        formatter: function (value, row, index) {
                            return dateFmt(row.opentime);
                        }
                    },
                    {field:'caozuo',title:'操作', width:80,
                        formatter: function(value,row,index){
                            return "<a href='javascript:void(0)' onclick='del("+row.uid+")'>删除</a>"+
                                "&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' onclick='update("+row.uid+")'>修改</a>";
                        }
                    },
                    {field:'clazzcaozuo',title:'课程操作', width:80,
                        formatter: function(value,row,index){
                            return "<a href='javascript:void(0)' onclick='getClazz("+row.uid+")'>已选课程</a>"+
                                "&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' onclick='saveClazz("+row.uid+")'>选择课程</a>";
                        }
                    }
                ]]
            });
            
            $("#dd").dialog({    
			    title: "所选课程",    
			    width: 400,    
			    height: 200,    
			    closed: true,    
			    cache: true,    
			    href: "",    
			    modal: true
			}); 
        });

        function del(id){
            console.info(id);
            $.messager.confirm("确认","您确认想要删除记录吗？",function(r){
                if (r){
                    location.href="<%=request.getContextPath() %>/user/deleteUser.do?uid="+id;
                }
            });
        }

        function update(id){
            location.href="<%=request.getContextPath() %>/user/toUpdateUser.do?uid="+id;
        }

        function dateFmt(shijian){
            var time = new Date(shijian);
            var year = time.getFullYear();  //年
            var month = time.getMonth() + 1;  //月
            var day = time.getDate();         //日
            var dateTimeStr= year + "-" +month + "-" + day ;
            return dateTimeStr;
        }
        
        function endEdit() {
	        var rows = $("#dg").datagrid("getRows");
	        for (var i = 0; i < rows.length; i++) {
	            $("#dg").datagrid("endEdit", i);
	        }
	    }
	    
	    function getClazz(id){
	    	$("#dd").dialog({    
			    title: "所选课程",    
			    width: 400,    
			    height: 200,    
			    closed: false,    
			    cache: true,    
			    href: "<%=request.getContextPath()%>/user/getClazz.do?uid="+id,    
			    modal: true
			});  
	    }
	    
	    function saveClazz(id){
	    	$("#dd").dialog("open"); 
	    }

    </script>
</head>
<body>

<span style="font-size: 12px;">名称查询:</span><input id="ss"></input> 
<table id="dg"></table>

<div id="dd">
	<form action="">
		<table>
			<tr>
				<td colspan="2">选择课程</td>
			</tr>
			<tr>
				<td>课程编号
				:</td>
				<td></td>
			</tr>
		</table>
	</form>
</div> 
</body>
</html>
