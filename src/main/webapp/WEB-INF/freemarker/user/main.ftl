<!DOCTYPE html>
<html>
    <title>首页</title>
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/themes/black/easyui.css" rel="stylesheet" type="text/css">
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/themes/icon.css" rel="stylesheet" type="text/css">
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/demo/demo.css" rel="stylesheet" type="text/css">
    <link href="${baseDir.contextPath}/css/commons.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="${baseDir.contextPath}/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="${baseDir.contextPath}/js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${baseDir.contextPath}/js/jquery.form.js"></script>
    <script type="text/javascript">

        //定制实现jquery easyui的视频上传校验规则，只能提交MP4或者flv
        $.extend($.fn.validatebox.defaults.rules, {
            mp4OrFlv: {
                validator: function(value, param){
                    //return /^(.+\.mp4)|(.+\.flv)|(.+\.MP4)|(.+\.FLV)$/.test(value);
                    return false;
                },
                message: '文件后缀类型只能是MP4或者flv'
            }
        });


        var $accordionManager, $userTree,$orderTree, $centralFrame,
             $classTree,$videoTree,$musicTree;
        var $addCategoryBtn,$addVideoBtn, //新增视频与视频分类的按钮
            $addCategoryDialog, $addCategoryForm;
        var $videoSubmitBtn,$addVideoDialog,$addVideoForm,$deleteVideoBtn     //提交视频
            ,$deleteVideoDialog, $videoDeleteSubmitBtn;

        var $refreshTreeBtn;  //刷新树按钮
        $(document).ready(function(){

            $accordionManager = $('#accordionManager');
            $centralFrame = $("#centralFrame");
            $addCategoryForm = $("#addCategoryForm").form({
                ajax:true,
                success: function (data) {
                    data = eval('(' + data + ')');  // change the JSON string to javascript object
                    $addCategoryDialog.dialog("close");  //不管添加成功或失败都关闭弹出层
                    if(data.success) {
                        $videoTree.tree("reload");
                    }else {
                        alert("新增失败,错误原因：" + data.message);//好吧，原生的提示，以后有时间改进
                    }

                }
            });

            $addVideoForm = $("#addVideoForm").form({});

            $addCategoryDialog = $('#addCategoryDialog').dialog({
                title: '新增分类',
                width: 300,
                height: 200,
                closed: true,
                cache: false,
                modal: true
            });

            $addVideoDialog = $("#addVideoDialog").dialog({
                title:'新增视频',
                width:300,
                height:200,
                closed:true,
                cache:false,
                modal:true
            });
            $deleteVideoDialog = $("#deleteVideoDialog").dialog({
                title:'确认删除视频',
                width:300,
                height:200,
                closed:true,
                cache:false,
                modal:true
            });

            $accordionManager.accordion('add', {
                title: '用户',
                content: '<div><ul id="userTree"></ul></div>',
                height:200,
                selected: false
            }).accordion('add', {
                title: '音乐',
                content: '<div><ul id="musicTree"></ul></div>',
                height:200,
                selected: false
            }).accordion('add', {
                title: '视频',
                content: '<div class="easyui-panel" style="padding:5px;" >'
                       +      '<a href="#" id="refreshTreeBtn" class="easyui-linkbutton" data-options="plain:true,iconCls:\'icon-reload\',disabled:false">刷新</a>'
                       +      '<a href="#" id="addCategoryBtn" class="easyui-linkbutton" data-options="plain:true,iconCls:\'icon-add\',disabled:true">新增分类</a>'
                       +      '<a href="#" id="addVideoBtn" class="easyui-linkbutton" data-options="plain:true,iconCls:\'icon_upload\',disabled:true">上传视频</a>'
                       +      '<a href="#" id="deleteVideoBtn" class="easyui-linkbutton" data-options="plain:true,iconCls:\'icon-no\',disabled:true">删除视频</a>'
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

            $refreshTreeBtn = $('#refreshTreeBtn').click(function() {
                $videoTree.tree("reload");
            });

            $addCategoryBtn = $('#addCategoryBtn').click(function(){
                var selectedNode  = $videoTree.tree("getSelected");
                $addCategoryForm.form("load",{
                   pid: selectedNode.id
                });
                $addCategoryDialog.dialog("open");
            });
            $addVideoBtn = $('#addVideoBtn').click(function(){
                var selectedNode  = $videoTree.tree("getSelected");
                var parentNode = $videoTree.tree('getParent',selectedNode.target);  //被点击的是视频节点，其父节点必定是视频分类节点，拿到其视频分类的id
                $addVideoForm.form("load",{
                    videoCategoryId:parentNode.id
                });
                $addVideoDialog.dialog('open');
            });

            //新增视频提交按钮点击事件逻辑
            $videoSubmitBtn = $("#videoSubmitBtn").click(function(){
                uploadFileHandler.upload();
            });

            $deleteVideoBtn = $("#deleteVideoBtn").click(function(){
                var selectedNode  = $videoTree.tree("getSelected");
                $("#tobeDeleteVideo").text(selectedNode.text);
                $deleteVideoDialog.dialog("open");
            });

            $userTree = $("#userTree").tree({
                url:'${baseDir.contextPath}/user/initUserTree',
                lines:true,
                onClick:function(node){
                    if(node.text=='用户列表') {
                        $centralFrame.attr("src", "${baseDir.contextPath}/user/listUsers");
                    }
                }
            });
            $orderTree = $("#orderTree");
            $classTree = $("#classTree");
            $videoTree = $("#videoTree").tree({
                url:'${baseDir.contextPath}/user/initVideoTree',
                lines:true,
                onClick:function(node){
                    if(node.videoFlag) {  //视频节点
                        $addVideoBtn.linkbutton("enable");
                        $deleteVideoBtn.linkbutton("enable");
                        $addCategoryBtn.linkbutton("disable");
                        $centralFrame.attr("src", "${baseDir.contextPath}/user/playvideo?videoid=" + node.id);
                    }else {  //视频分类节点
                        $addCategoryBtn.linkbutton("enable");
                        $addVideoBtn.linkbutton("disable");
                    }
                }
            });
            $musicTree = $("#musicTree").tree({
                url:'${baseDir.contextPath}/user/initMusicTree',
                lines:true,
                onClick:function(node){
                    if(node.musicFlag) {
                        $centralFrame.attr("src", "${baseDir.contextPath}/user/playmusic?musicid=" + node.id);
                    }
                }
            });

            $videoDeleteSubmitBtn = $("#videoDeleteSubmitBtn").click(function(){
                var selectedNode  = $videoTree.tree("getSelected");
                $.ajax({
                   url:'${baseDir.contextPath}/user/deleteVideo',
                   data:{'videoId': selectedNode.id},
                   dataType:'json',
                   type:'post',
                   success:function(data) {
                       $deleteVideoDialog.dialog('close');
                       if(data.success)
                            $videoTree.tree("reload");
                       else
                            alert("删除失败，错误信息：" + data.message);
                   }
                });
            });

        })


        function submitCategoryForm() {
            $addCategoryForm.form("submit");
        }

        function clearCategoryForm() {
            $addCategoryForm.form("clear");
        }

        var uploadFileHandler = {
            upload:function() {
               $addVideoForm.ajaxSubmit({
                  type:'post',
                  dataType:'json',
                  success:function(data) {
                      if(data.success) {
                          $addVideoDialog.dialog("close");
                           $videoTree.tree("reload");
                      }else {
                          alert("上传失败，错误信息：" + data.message);
                      }
                  }

               });
            }
        };

    </script>
<body class="easyui-layout">
    <div data-options="region:'north',title:'今日热点',split:true" style="height:200px;"></div>
    <div data-options="region:'west',title:'主菜单',split:true" style="width:320px;">
        <div id="accordionManager" class="easyui-accordion" style="height:250px;" data-options="fit:true">
        </div>
    </div>
    <div data-options="region:'center',title:'',border:false" style="padding:0px;background:#eee;overflow: hidden;border: 0px;">
        <iframe id="centralFrame" width="100%" height="100%" frameborder="0"></iframe>
    </div>

    <div id="addCategoryDialog">
        <div id="addCcategoryPanel" class="easyui-panel"  style="width:400px" data-options="fit:true">
            <form action="${baseDir.contextPath}/user/saveCategory" id="addCategoryForm" method="post">

                <table cellpadding="5">
                    <input type="hidden" name="pid"/>
                    <tr>
                        <td>Name:</td>
                        <td><input class="easyui-textbox" type="text" name="name" data-options="required:true"/></td>
                    </tr>
                </table>
            </form>
            <div style="text-align:center;padding:5px">
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitCategoryForm()">Submit</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearCategoryForm()">Clear</a>
            </div>
        </div>

    </div>

    <!-- 上传视频对话框 -->
    <div id="addVideoDialog">
        <div class="easyui-panel" title="" data-options="fit:true">
            <form action="${baseDir.contextPath}/user/saveVideo" id="addVideoForm" method="post" enctype="multipart/form-data">
                <input type="hidden" name="videoCategoryId"  id="videoCategoryId"/>
                <div style="margin-bottom:20px">
                    <div>视频文件:</div>
                    <input class=" easyui-validatebox easyui-filebox"  name="videoFile" id="videoFile" data-options="prompt:'Choose a video...',required:true" validType="mp4OrFlv" style="width:100%">
                </div>
            </form>
            <div style="width: 70px;margin: 0 auto;">
                <a href="#" id="videoSubmitBtn" class="easyui-linkbutton" style="width:70px;">上传</a>
            </div>
        </div>
    </div>

    <!-- 删除视频对话框 -->
    <div id="deleteVideoDialog">
        <div class="easyui-panel" title="" data-options="fit:true">
            <div id="tobeDeleteVideo" style="width:80px; margin: 0 auto; padding-top:20px;"></div>
            <div style="width: 70px;margin: 0 auto;padding-top:50px;">
                <a href="#" id="videoDeleteSubmitBtn" class="easyui-linkbutton" style="width:70px;">确定</a>
            </div>
        </div>
    </div>

 </body>

</html>