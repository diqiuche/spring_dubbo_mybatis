<%@ page import="java.io.StringWriter" %>
<%@ page import="java.io.PrintWriter" %>
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
    <link href="${base}/css/404style.css" rel="stylesheet" type="text/css"  media="all" />
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
            //background: url("${base}/images/commons/error2.jpg") no-repeat 0px 0px;
            background-color: #cccccc;
        }
    </style>
</head>
<body>
    错误信息：${ex},<br/>
    错误栈信息：<%
        StringWriter sw=new StringWriter();
        PrintWriter pw=new PrintWriter(sw);
        exception.printStackTrace(pw);
        out.write(sw.toString());
    %>
    <div class="content">
        <p><span><label>O</label>ops.....</span>出错了</p>
        <a href="#" onclick="window.history.go(-1);">返回</a>
    </div>
</body>
</html>
