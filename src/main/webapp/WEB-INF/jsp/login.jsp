<%@ page contentType="text/html;charset=UTF-8" language="java"
 %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" content="text/html">
    <title>登录页</title>
</head>
<body>
    <c:if test="${not empty error}">
        ${error}
    </c:if>
    <form method="post" action="${base}/user/login">
          姓名：<input type="text" name="username"/><br/>
          密码: <input type="text" name="password" /> <br/>
          <input type="submit" value="登录">
    </form>

</body>
</html>
