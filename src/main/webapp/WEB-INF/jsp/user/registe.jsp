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
    <title>注册页</title>
    <script type="text/javascript" src="${base}/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" >
        $.ajax({
            url: '${base}/user/getjson',
            type: 'post',
            dataType: 'json',
            success:function(data) {
                console.dir(data);
            }
        })
    </script>
</head>
<body>

    <div class="container">

        <form class="form-signin" method="post" action="${base}/user/saveRegiste">
            <h2 class="form-signin-heading">Please registe</h2>
            <label for="email" class="sr-only">Email address</label>
            <input type="email" id="email" name="email" class="form-control" placeholder="Email" required autofocus>
            <c:if test="${email_not_valid != null}">
                <span class="validError">${email_not_valid}</span>
            </c:if>
            <label for="password" class="sr-only">Password</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
            <c:if test="${password_not_the_same != null || password_is_null != null || password_not_valid !=null }">
                <span class="validError">${password_not_the_same}${password_is_null}${password_not_valid}</span>
            </c:if>
            <label for="confirm_password" class="sr-only">Confirm Password</label>
            <input type="password" id="confirm_password" name="confirmPassword" class="form-control" placeholder="ConfirmPassword" required>
            <c:if test="${confirmPwd_not_valid != null}">
                <span class="validError">${confirmPwd_not_valid}</span>
            </c:if>
            <label for="name" class="sr-only">name</label>
            <input type="text" id="name" name="name" class="form-control" placeholder="Name" required >
            <label for="username" class="sr-only">username</label>
            <input type="text" id="username" name="username" class="form-control" placeholder="Username" required >
            <label for="phone" class="sr-only">phone</label>
            <input type="text" id="phone" name="phone" class="form-control" placeholder="Phone" required >
            <button class="btn btn-lg btn-primary btn-block" type="submit">Registe</button>
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
