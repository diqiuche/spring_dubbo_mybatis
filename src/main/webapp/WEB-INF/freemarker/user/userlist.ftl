<!DOCTYPE html>
<html>
<meta charset="utf-8" content="text/html"/>
<title>this html page is rendered by freemarker</title>
<link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/themes/default/easyui.css" rel="stylesheet" type="text/css">
<link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/themes/icon.css" type="text/css">
<link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/demo/demo.css" type="text/css">
<style type="text/css">
    .myicon-ok{
        background:url('../ok.png') no-repeat center center;
    }
</style>
<script type="text/javascript" src="${baseDir.contextPath}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${baseDir.contextPath}/js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript">
    var $table, cmenu, $messageDialog, $editUserForm;
    function createColumnMenu() {
        cmenu = $('<div/>').appendTo('body');
        cmenu.menu({
            onClick: function (item) {
                if (item.iconCls == 'myicon-ok') {
                    $table.datagrid('hideColumn', item.name);
                    cmenu.menu('setIcon', {
                        target: item.target,
                        iconCls: 'icon-empty'
                    });
                } else {
                    $table.datagrid('showColumn', item.name);
                    cmenu.menu('setIcon', {
                        target: item.target,
                        iconCls: 'myicon-ok'
                    });
                }
            }
        });
        var fields = $table.datagrid('getColumnFields');
        for (var i = 0; i < fields.length; i++) {
            var field = fields[i];
            var col = $table.datagrid('getColumnOption', field);
            cmenu.menu('appendItem', {
                text: col.title,
                name: field,
                iconCls: 'icon-ok'
            });
        }
    }
    $(document).ready(function () {
        $table = $("#dataTable");
        $editUserForm = $("#editUserForm").form({
            ajax: true,
            dataType: 'json',
            url: '${baseDir.contextPath}/user/updateUser',
            success: function (data) {
                data = eval('(' + data + ')');  // change the JSON string to javascript object
                if (data.success) {
                    $messageDialog.dialog("close");//关闭编辑框
                    $table.datagrid("reload"); //重新加载数据
                } else {
                    alert(data.message);
                }
            }
        });
        $table.datagrid({
            url: '${baseDir.contextPath}/user/getUsers',   //数据源
            columns: [
                [
                    {field: 'name', title: '姓名', sortable: true},
                    {field: 'username', title: '用户名', sortable: true},
                    {field: 'email', title: '邮箱', sortable: true},
                    {field: 'phone', title: '电话', sortable: true}
                ]
            ],
            pagination: true,  //启用分页
            pagePosition: 'bottom', //分页栏的位置
            pageSize: 20,
            ctrlSelect: true,  //按住ctrl键加click一行数据时才允许多选
            loadMsg: '正在努力的加载数据，不要着急哦^_^',
            singleSelect: true,
            onBeforeLoad: function (param) {
                param.pageSize = param.rows;   //easyui 获取数据的字段定义为rows，分页控件请求参数rows却表示的页面大小,太逗了
            },
            onSelect: function (index, row) {  //单行选中事件
                // alert("选中行,姓名:" + row.name + ", 用户名：" + row.username + ", 邮箱：" + row.email + ", 电话: " + row.phone);
                $editUserForm.form("load", {
                    id: row.id,
                    name: row.name,
                    username: row.username,
                    email: row.email,
                    phone: row.phone
                });
                $messageDialog.dialog("open");
            },
            onHeaderContextMenu: function (e, index) {  //表格标题栏右键菜单事件
                e.preventDefault();
                if (!cmenu) {
                    createColumnMenu();
                }
                cmenu.menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            }
        });

        $messageDialog = $("#messageDialog").dialog({
            title: '用户信息',
            width: 400,
            height: 300,
            closed: true,
            cache: false,
            modal: true
        });
    });

    function submitForm() {
        $editUserForm.form("submit");
    }

    function clearForm() {
        $editUserForm.form("clear");
    }

</script>
<body>
<dvi style="margin: 0 auto;">
    <table id="dataTable" class="easyui-datagrid" title="用户列表" style="width:700px;height:250px"
           data-options="singleSelect:true,collapsible:true,method:'get'">
        <tbody>
        <#-- <#list users as user>
            <tr>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>186</td>
            </tr>
            </#list>-->
        </tbody>
    </table>
</dvi>

<div id="messageDialog">
    <div id="contentPanel" class="easyui-panel" title="修改" style="width:400px" data-options="fit:true">
        <form action="" id="editUserForm" method="post">

            <table cellpadding="5">
                <input type="hidden" name="id"/>
                <tr>
                    <td>Name:</td>
                    <td><input class="easyui-textbox" type="text" name="name" data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>Username:</td>
                    <td><input class="easyui-textbox" type="text" name="username" data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input class="easyui-textbox" type="text" name="email" data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><input class="easyui-textbox" type="text" name="phone" data-options="required:true"/></td>
                </tr>
            </table>
        </form>
        <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
        </div>
    </div>
</div>
</body>
</html>
