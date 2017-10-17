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
            $("#dg").datagrid({
                url:"<%=request.getContextPath() %>/user/listUser.do",
                fitColumns:true,
                rownumbers:true,
                singleSelect:true,
                pagination:true,
                pageNumber:1,
                pageSize:5,
                pageList:[5,10,15],
                columns:[[
                    {field:"uname",title:"课程编号",width:100},
                    {field:"sex",title:"课程名称",width:100},
                    {field:"certifyno",title:"课程时长（小时）",width:100},
                    {field:"tel",title:"课程价格（元）",width:100},
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
