<%@ page contentType="text/html;charset=UTF-8" language="java"
 %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta charset="utf-8" content="text/html">
    <title>登录页</title>
</head>
<body>
    <c:if test="${not empty errorMessage}">
        ${errorMessage}
    </c:if>
    <form method="post" action="${base}/user/login">
          姓名：<input type="text" name="username"/><br/>
          密码: <input type="text" name="password" /> <br/>
          <input type="submit" value="登录">
    </form>

    <div>
      参数校验错误：  <form:errors path="username" />
        <spring:hasBindErrors name="user">
            <c:forEach items="${errors.fieldErrors}" var="error">
                <spring:message var="message" code="${error.code}" arguments="${error.arguments}" text="${error.defaultMessage}"/>
                ${error.field}------${message}<br/>
            </c:forEach>
        </spring:hasBindErrors>
    </div>
</body>
</html>
