<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/27
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>500|服务器内部错误</title>
    <link href="${base}/css/commons.css" rel="stylesheet" type="text/css"/>
</head>
<body class="errorBackground">
    异常栈信息：<%= exception %>
    <div class="backDiv">
        <button type="button"  class="backButton" onclick="window.history.go(-1);">返回</button>
    </div>
</body>
</html>
