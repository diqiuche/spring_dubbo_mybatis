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
        <#if name_has_next>  <#-- 判断集合中是否有下一个元素 -->
            ,
        </#if>
        <#if name_index=1>
            <#break>  <#-- 提前终止循环 -->
        </#if>
        </#list>
    </#if>
<#if !names??>
不存在
</#if>

<br/>---------------------switch case 用法
<#switch height>
    <#case 12>
        12
        <#break>   <#-- 注意case穿透的问题 -->
    <#case 13>
        13
    <#break>
    <#case 160>
        160
    <#break>
    <#case 161>
    161
    <#break>
    <#default>
        默认高度
    <#break>
</#switch>

<br/>------------遍历map
  <#list testmap?keys as key>
      ${key}---->${testmap[key]}
      <#if key_has_next>
          ,<br/>
      </#if>
  </#list>

</body>
</html>