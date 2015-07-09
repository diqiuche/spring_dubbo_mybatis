<%@ page contentType="text/html;charset=UTF-8" language="java"
 %>
<html>
<head>
    <meta charset="utf-8" content="text/html">
    <title>登录页</title>
</head>
<body>
    根路径:${base}
    <form method="post" action="${base}/user/login">
          姓名：<input type="text" name="username"/><br/>
          密码: <input type="text" name="password" /> <br/>
          <input type="submit" value="登录">
    </form>

</body>
</html>
