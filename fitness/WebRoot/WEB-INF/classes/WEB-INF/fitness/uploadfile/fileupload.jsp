<%--
  Created by IntelliJ IDEA.
  User: xingmao
  Date: 2018/2/9
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="download?filename=${requestScope.fileupload.image.originalFilename}">
    ${requestScope.fileupload.image.originalFilename}
</a>
</body>
</html>
