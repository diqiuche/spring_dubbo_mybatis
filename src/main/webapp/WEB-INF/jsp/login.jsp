<%@ page contentType="text/html;charset=UTF-8" language="java"
 %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${base}/js/bootstrap-3.3.5-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="${base}/css/login.css" rel="stylesheet" type="text/css"/>
    <title>登录页</title>

    <script type="text/javascript" >

    </script>
</head>
<body>

    <div class="container">

        <form class="form-signin" method="post" action="${base}/user/login">
            <h2 class="form-signin-heading">Please sign in</h2>
            <label for="username" class="sr-only">Email address</label>
            <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus><span class="validError">${usernameValidMessage}</span>
            <label for="password" class="sr-only">Password</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Password" required><span class="validError">${passwordValidMessage}</span>
            <div class="checkbox">
                <label>
                    <input type="checkbox" value="remember-me"> Remember me
                </label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        </form>

    </div>

  <%--  <div>
      参数校验错误：  <form:errors path="username" />
        <spring:hasBindErrors name="user">
            <c:forEach items="${errors.fieldErrors}" var="error">
                <spring:message var="message" code="${error.code}" arguments="${error.arguments}" text="${error.defaultMessage}"/>
                ${error.field}------${message}<br/>
            </c:forEach>
        </spring:hasBindErrors>
    </div>--%>
    <script type="text/javascript" src="${base}/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="${base}/js/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
</body>
</html>
