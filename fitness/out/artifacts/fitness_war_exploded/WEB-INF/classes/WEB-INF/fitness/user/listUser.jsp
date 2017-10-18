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
<table id="dg"></table>
</body>
</html>
