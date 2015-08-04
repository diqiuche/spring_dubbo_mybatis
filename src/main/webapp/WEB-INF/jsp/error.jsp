<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/28
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <meta charset="utf-8" content="text/html"/>
    <title>服务器错误</title>
</head>
<body>
    错误信息：${ex},
    错误栈信息：<%=exception %>
</body>
</html>
