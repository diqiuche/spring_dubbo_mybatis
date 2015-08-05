<html>
<head>
    <meta charset="utf-8" content="text/html"/>
    <title>webix html5前端框架</title>
    <link href="${baseDir.contextPath}/js/webix/codebase/webix.css" rel="stylesheet" type="text/css"/>
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/themes/icon.css" rel="stylesheet" type="text/css">
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/demo/demo.css" rel="stylesheet" type="text/css">
    <link href="${baseDir.contextPath}/css/commons.css" type="text/css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${baseDir.contextPath}/js/webix/codebase/webix.js"></script>
    <script type="text/javascript" src="${baseDir.contextPath}/js/jquery-1.11.3.js"></script>
</head>
<body>
<script type="text/javascript">

    var $rightFrame;

    var leftAccordionPanel = {
        view:'accordion',
        multi:false,  //默认只能展开一项,
        rows:[
            {
                header:'用户',
                headerHeight:32,
                headerAltHeight:32,  //折叠时的高度
                animate:{type:"slide", subtype:"in"},
                //height:600,
                collapsed:false, //默认展开
                body:{
                    id:'userTree',
                    view:'tree',
                    //url:'${baseDir.contextPath}/user/initUserTree',
                    dataType:'jsarray',
                    type:'lineTree',
                    select:true,
                    data:[
                        {id:1,value:'用户',open:true,
                            data:[
                                {id:2,value:'用户列表',open:true, data:[
                                       {id:3,value:'用户1',open:true,data:[
                                            {id:4,value:'用户2',open:true}
                                            ]
                                       }
                                    ]
                                }
                            ]
                        }
                    ],
                    on:{
                        onItemClick:function(id, event, htmlNode) {
                            var treeNodeData = $$("userTree").getItem(id);
                            if(treeNodeData.value == '用户列表') {
                                $$("rightFrame").getIframe().src="${baseDir.contextPath}/user/webixuserlist";
                            }
                        }
                    }

                }
            },
            {
                header:'音乐',
                headerHeight:32,
                headerAltHeight:32,  //折叠时的高度
                animate:{type:"slide", subtype:"in"},
                collapsed:true
            },
            {
                header:'视频',
                headerHeight:32,
                headerAltHeight:32,  //折叠时的高度
                animate:{type:"slide", subtype:"in"},
                collapsed:true,
                body:{
                    id:'videoTree',
                    view:'tree',
                    url:'${baseDir.contextPath}/user/initVideoTree',
                    dataType:'jsarray',
                    type:'lineTree',
                    select:true,
                    on:{
                        onItemClick:function(id, event, htmlNode) {
                            var treeNodeData = $$("videoTree").getItem(id);
                            alert(treeNodeData.value);
                        }
                    }

                }
            },
            {
                header:'图片浏览',
                headerHeight:32,
                headerAltHeight:32,  //折叠时的高度
                animate:{type:"slide", subtype:"in"},
                collapsed:true
            },
            {
                header:'系统设置',
                headerHeight:32,
                headerAltHeight:32,  //折叠时的高度
                animate:{type:"slide", subtype:"in"},
                collapsed:true
            }
        ]
    };

    var datatableObj = {
        view:'datatable',
        autoConfig:false,
        /*gravity:2.5,*/
        columns:[
            {id:'name',header:'姓名',fillspace:true},
            {id:'username',header:'用户名',fillspace:true},
            {id:'email',header:'邮箱',fillspace:true},
            {id:'phone',header:'电话',fillspace:true}
        ],
        resizeColumn:true,
        resizeRow:true,
        data:[
            { name:'tangsi',username:'root',email:'tangside163@163.com',phone:18670950325},
            { name:'用户1',username:'root1',email:'tangside163@163.com',phone:18670950325},
            { name:'用户2',username:'root2',email:'tangside163@163.com',phone:18670950325},
            { name:'用户3',username:'root3',email:'tangside163@163.com',phone:18670950325}
        ],
        footer:true,
        select:true,//点击时选中该行
        scroll:false  //禁止滚动条
    };

    webix.ready(function(){

        $rightFrame = $("#rightFrame");

        webix.ui({
            type:'space',
            borderless:true,
            margin:0,
            padding:0,
            rows:[
                {
                    borderless:true,
                    margin:0,
                    padding:0,
                    header:'今日热点',
                    headerHeight:40,
                    gravity:0.3,
                    body:{}
                },
                {
                    cols:[
                        {
                            header:'主菜单',
                            //width:350,
                            gravity:0.25,
                            headerHeight:40,
                            body:leftAccordionPanel
                        } ,
                        {view : 'resizer'},
                        {
                            margin:0,
                            padding:0,
                            //body:'<iframe id="rightFrame" style="margin: 0;padding: 0;" frameborder="0" width="100%" height="100%" ></iframe>'
                            body:{
                                view:'iframe',
                                borderless:true,
                                id:'rightFrame'
                            }
                        }
                    ]
                }
            ]
        });
    });

</script>
</body>
</html>