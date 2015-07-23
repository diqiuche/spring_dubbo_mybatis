<!DOCTYPE html>
<html>
    <meta charset="utf-8" content="text/html"/>
    <title>this html page is rendered by freemarker</title>
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.2/themes/default/easyui.css" rel="stylesheet" type="text/css">
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.2/themes/icon.css" type="text/css">
    <script type="text/javascript" src="${baseDir.contextPath}/js/jquery-1.11.3.js" ></script>
    <script type="text/javascript" src="${baseDir.contextPath}/js/jquery-easyui-1.4.2/jquery.easyui.min.js" ></script>
    <script type="text/javascript">
        var $table;
        $(document).ready(function(){
            $table = $("#dataTable")
            $table.datagrid({
                columns:[[
                    {field:'name',title:'姓名',sortable:true},
                    {field:'email',title:'邮箱',sortable:true},
                    {field:'phone',title:'电话',sortable:true}
                ]],
                pagination:true,  //启用分页
                pagePosition:'bottom', //分页栏的位置
                pageSize:20,
                ctrlSelect:true,  //按住ctrl键加click一行数据时才允许多选
                loadMsg:'正在努力的加载数据，不要着急哦^_^',
                singleSelect:true,
                onSelect:function(index,row) {  //单行选中事件
                    alert("选中行");
                    console.dir(row);
                }
            })
        });
    </script>
    <body>
    <dvi style="margin: 0 auto;">
        <table id="dataTable" class="easyui-datagrid" title="Basic DataGrid" style="width:700px;height:250px"
               data-options="singleSelect:true,collapsible:true,method:'get'">
            <tbody>
            <#list users as user>
            <tr>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>186</td>
            </tr>
            </#list>
            </tbody>
        </table>
    </dvi>

    </body>
</html>
