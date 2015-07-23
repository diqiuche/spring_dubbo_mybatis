<!DOCTYPE html>
<html>
    <meta charset="utf-8" content="text/html"/>
    <title>this html page is rendered by freemarker</title>
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.2/themes/default/easyui.css" rel="stylesheet" type="text/css">
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.2/themes/icon.css" type="text/css">
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.2/demo/demo.css" type="text/css">
    <script type="text/javascript" src="${baseDir.contextPath}/js/jquery-1.11.3.js" ></script>
    <script type="text/javascript" src="${baseDir.contextPath}/js/jquery-easyui-1.4.2/jquery.easyui.min.js" ></script>
    <script type="text/javascript">
        var $table, cmenu;
        function createColumnMenu(){
            cmenu = $('<div/>').appendTo('body');
            cmenu.menu({
                onClick: function(item){
                    if (item.iconCls == 'icon-ok'){
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
            for(var i=0; i<fields.length; i++){
                var field = fields[i];
                var col = $table.datagrid('getColumnOption', field);
                cmenu.menu('appendItem', {
                    text: col.title,
                    name: field,
                    iconCls: 'icon-ok'
                });
            }
        }
        $(document).ready(function(){
            $table = $("#dataTable");
            $table.datagrid({
                url:'${baseDir.contextPath}/user/getUsers',
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
                onBeforeLoad:function(param) {
                    param.pageSize = param.rows;   //easyui 获取数据的字段定义为rows，分页控件请求参数rows却表示的页面大小,太逗了
                },
                onSelect:function(index,row) {  //单行选中事件
                    alert("选中行");
                    console.dir(row);
                },
                onHeaderContextMenu:function(e,index) {  //表格标题栏右键菜单事件
                    e.preventDefault();
                    if (!cmenu){
                        createColumnMenu();
                    }
                    cmenu.menu('show', {
                        left:e.pageX,
                        top:e.pageY
                    });
                }
            })
        });
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

    </body>
</html>
