<!DOCTYPE html>
<html>
    <title>首页</title>
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/themes/black/easyui.css" rel="stylesheet" type="text/css">
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/themes/icon.css" rel="stylesheet" type="text/css">
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/demo/demo.css" rel="stylesheet" type="text/css">
    <link href="${baseDir.contextPath}/css/commons.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="${baseDir.contextPath}/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="${baseDir.contextPath}/js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>

    <script type="text/javascript">

        var $accordionManager, $userTree,$orderTree, $centralFrame,
             $classTree,$videoTree;
        var $addCategoryBtn,$addVideoBtn;  //新增视频与视频分类的按钮

        $(document).ready(function(){
            $accordionManager = $('#accordionManager');
            $centralFrame = $("#centralFrame");
            $accordionManager.accordion('add', {
                title: '用户',
                content: '<div><ul id="userTree"></ul></div>',
                height:200,
                selected: false
            }).accordion('add', {
                title: '视频',
                content: '<div class="easyui-panel" style="padding:5px;">'
                       +      '<a href="#" id="addCategoryBtn" class="easyui-linkbutton" data-options="plain:true,iconCls:\'icon-add\',disabled:true">新增分类</a>'
                       +      '<a href="#" id="addVideoBtn" class="easyui-linkbutton" data-options="plain:true,iconCls:\'icon-add\',disabled:true">新增视频</a>'
                       + '</div>'
                       + '<div><ul id="videoTree"></ul></div>',
                height:200,
                selected: false
            }).accordion('add', {
                title: '订单',
                content: '<div><ul id="orderTree"></ul></div>',
                height:200,
                selected: false
            }).accordion('add', {
                title: '课程',
                content: '<div><ul id="classTree"></ul></div>',
                height:200,
                selected: false
            });

            $addCategoryBtn = $('#addCategoryBtn').click(function(){

            });
            $addVideoBtn = $('#addVideoBtn').click(function(){

            });

            $userTree = $("#userTree").tree({
                url:'${baseDir.contextPath}/user/initUserTree',
                onClick:function(node){
                    if(node.text=='用户列表') {
                        $centralFrame.attr("src", "${baseDir.contextPath}/user/listUsers");
                    }
                }
            });
            $orderTree = $("#orderTree");
            $classTree = $("#classTree");
            $videoTree = $("#videoTree").tree({
                url:'${baseDir.contextPath}/user/initMusicTree',
                onClick:function(node){
                    if(node.musicFlag) {  //视频节点
                        $addVideoBtn.linkbutton("enable");
                        $addCategoryBtn.linkbutton("disable");
                        $centralFrame.attr("src", "${baseDir.contextPath}/user/playvideo?videoname=" + node.text);
                    }else {  //视频分类节点
                        $addCategoryBtn.linkbutton("enable");
                        $addVideoBtn.linkbutton("disable");
                    }
                }
            });

        })

    </script>
<body class="easyui-layout">
    <div data-options="region:'north',title:'今日热点',split:true" style="height:200px;"></div>
    <div data-options="region:'west',title:'主菜单',split:true" style="width:300px;">
        <div id="accordionManager" class="easyui-accordion" style="height:250px;" data-options="fit:true">
        </div>
    </div>
    <div data-options="region:'center',title:'',border:false" style="padding:0px;background:#eee;overflow: hidden;border: 0px;">
        <iframe id="centralFrame" width="100%" height="100%" frameborder="0"></iframe>
    </div>
 </body>

</html>