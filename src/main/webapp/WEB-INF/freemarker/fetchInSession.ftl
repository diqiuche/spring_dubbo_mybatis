<html>
<head>
    <title>测试freemarker从session中取数据</title>
    <style type="text/css">
        .highlight {

        }
    </style>
</head>
<body>

    <div class="highlight">
        ${age}
    </div>

-----------------
    <#if names??>
        <#list names as name>
         ${name}
        </#list>
    </#if>
<#if !names??>
不存在
</#if>

</body>
</html>