<!DOCTYPE html>
<html>
<meta charset="utf-8" content="text/html"/>
<title>this html page is rendered by freemarker</title>
<link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/themes/black/easyui.css" rel="stylesheet" type="text/css">
<link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/themes/icon.css" rel="stylesheet" type="text/css">
<link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/demo/demo.css" rel="stylesheet" type="text/css">
<link href="${baseDir.contextPath}/css/commons.css" type="text/css">
<style type="text/css">
</style>
<script type="text/javascript" src="${baseDir.contextPath}/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${baseDir.contextPath}/js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript">
    var $table, cmenu, $messageDialog, $editUserForm,
        $addUserForm,$addMessageDialog;

    $.extend($.fn.validatebox.defaults.rules, {
        equals: {
            validator: function(value,param){
                return value == $(param[0]).val();
            },
            message: 'Password and ConfirmPassword not matched'
        }
    });

    //定制实现jquery easyui的手机号码的校验规则
    $.extend($.fn.validatebox.defaults.rules, {
        phone: {
            validator: function(value, param){
                return /^1\d{10}$/.test(value);
            },
            message: 'please enter 11 numbers which starts with 1'
        }
    });
    //密码必须是字母和数字的组合
    $.extend($.fn.validatebox.defaults.rules, {
        pwdPattern: {
            validator: function(value,param){
                return /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/.test(value);
            },
            message: '密码必须包含字母和数字,且长度必须在8至16之间'
        }
    });

    function createColumnMenu() {
        cmenu = $('<div/>').appendTo('body');
        cmenu.menu({
            onClick: function (item) {
                if (item.iconCls == 'icon-ok') {
                    $table.datagrid('hideColumn', item.name);
                    cmenu.menu('setIcon', {
                        target: item.target,
                        iconCls: 'icon-empty'
                    });
                } else {
                    $table.datagrid('showColumn', item.name);
                    cmenu.menu('setIcon', {
                        target: item.target,
                        iconCls: 'icon-ok'
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
        $addUserForm = $("#addUserForm").form({
            ajax: true,
            dataType: 'json',
            url: '${baseDir.contextPath}/user/addUser',
            success: function (data) {
                data = eval('(' + data + ')');  // change the JSON string to javascript object
                if (data.success) {
                    $addMessageDialog.dialog("close");//关闭编辑框
                    $table.datagrid("reload"); //重新加载数据
                } else {
                    alert(data.message);
                }
            }
        });
        $table.datagrid({
            fit:true,
            fitColumns:true, //列宽自适应，防止出现滚动条
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
            toolbar:[
                {iconCls:'icon-add',text:'新增',handler:function(){
                    clearAddForm();
                    $addMessageDialog.dialog("open");
                }}
            ],
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

        //tooltip 提示
        $table.datagrid('getPager').find('a.l-btn').tooltip({
            content: function(){
                var cc = $(this).find('span.l-btn-icon').attr('class').split(' ');
                var icon = cc[1].split('-')[1];
                return icon + ' page';
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

        $addMessageDialog = $("#addMessageDialog").dialog({
            title: '用户信息',
            width: 400,
            height: 350,
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

    function submitAddForm() {
        $addUserForm.form("submit");
    }

    function clearAddForm() {
        $addUserForm.form("clear");
    }

</script>
<body>

    <table id="dataTable" class="easyui-datagrid" title="用户列表"
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

    <div id="addMessageDialog">
        <div id="addContentPanel" class="easyui-panel" title="新增" style="width:400px" data-options="fit:true">
            <form action="" id="addUserForm" method="post">

                <table cellpadding="5">
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
                        <td><input class="easyui-textbox" type="text" name="email" data-options="required:true" validType="email"/></td>
                    </tr>
                    <tr>
                        <td>Phone:</td>
                        <td><input  class="easyui-validatebox" type="text" name="phone" data-options="required:true" validType="phone" /></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input id="password" class="easyui-validatebox" type="text" name="password" data-options="required:true" validType="pwdPattern" /></td>
                    </tr>
                    <tr>
                        <td>ConfirmPassword:</td>
                        <td><input class="easyui-textbox" type="text" name="confirmPassword" data-options="required:true,validType:{equals:['#password'],pwdPattern:[]}"/></td>
                    </tr>
                </table>
            </form>
            <div style="text-align:center;padding:5px">
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitAddForm()">Submit</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearAddForm()">Clear</a>
            </div>
        </div>

</div>
</body>
</html>
