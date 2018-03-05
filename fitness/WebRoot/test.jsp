<%--
  Created by IntelliJ IDEA.
  User: xingmao
  Date: 2018/1/31
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script type="text/javascript"
            src="./easyui/jquery.min.js"></script>
    <script type="text/javascript" src="./js/jquery-form.js"></script>
    <script type="text/javascript">

        function exportexcel() {
            location.href="<%=request.getContextPath() %>/user/exportuser";
        }

//        var x =0;
//        function checknum() {
//            x = x +1;
//            document.getElementById("span").innerHTML=x;
//        }

    </script>
</head>
<body>
<%--<input id="button" name="button" type="button" value="按钮" onclick="checknum()">--%>
<%--点击次数：<span id="span">0</span>--%>

<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/file/upload">
    <input id="uploadfile" name="file" type="file">
    <input id="button" name="button" type="submit" value="上传">
</form>


<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/file/newupload">
    <input name="filename" type="text">
    <input name="image" type="file">
    <input name="button" type="submit" value="上传">
</form>


<input type="submit" value="导出" onclick="exportexcel()">

<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/user/importuser">
    <input name="excel" type="file">
    <input type="submit" value="导入">
</form>
</body>
</html>
