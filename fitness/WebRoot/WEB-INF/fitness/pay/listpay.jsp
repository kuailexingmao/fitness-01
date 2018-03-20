<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>缴费记录</title>
    
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
                url:"<%=request.getContextPath() %>/pay/listPay.do",
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
                    {field:"pname",title:"客户名称",width:100},
                    {field:"ptel",title:"联系方式",width:100},
                    {field:"certifyno",title:"身份证号",width:100},
                    {field:"paytime",title:"支付时间",width:100,
                    	formatter: function (value, row, index) {
                            return dateFmt(row.paytime);
                        }
                    },
                    {field:"recordpeople",title:"收款人员",width:100},
                    {field:"payaccount",title:"付款总额",width:100},
                    {field:"note",title:"备注",width:100}
                ]]
            });
            
        });
        
        function dateFmt(shijian){
            var time = new Date(shijian);
            var year = time.getFullYear();  //年
            var month = time.getMonth() + 1;  //月
            var day = time.getDate();         //日
            var dateTimeStr= year + "-" +month + "-" + day ;
            return dateTimeStr;
        }
		
	</script>

  </head>
  
  <body>
    <span style="font-size: 12px;">名称查询:</span><input id="ss"></input> 
	<table id="dg"></table>
  </body>
</html>
