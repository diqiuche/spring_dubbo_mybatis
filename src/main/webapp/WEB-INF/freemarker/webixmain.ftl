<html>
<head>
    <meta charset="utf-8" content="text/html"/>
    <title>webix html5前端框架</title>
    <link href="${baseDir.contextPath}/js/webix/codebase/webix.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${baseDir.contextPath}/js/webix/codebase/webix.js"></script>
</head>
<body>


<script type="text/javascript">
    webix.ui({
        type:'wide',
        rows:[
            {view:'template',template:'在线商城',type:'header'},
            {
                cols:[
                    {   view:'accordion',
                        /*gravity:0.3,*/
                        multi:true,
                        rows:[
                            {    header:'用户',
                                 animate:{type:"flip", subtype:"vertical"}
                            },
                            {
                                header:'音乐',
                                animate:{type:"flip", subtype:"vertical"}
                            },
                            {
                                header:'视频',
                                animate:{type:"flip", subtype:"vertical"}
                            },
                            {
                                header:'图片浏览',
                                animate:{type:"flip", subtype:"vertical"}
                            },
                            {
                                header:'系统设置',
                                animate:{type:"flip", subtype:"vertical"}
                            }
                        ]
                    },
                    {view : 'resizer'},
                    {
                        view:'datatable',
                        autoConfig:true,
                        gravity:2.5,
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
                    }
                ]
            }
        ]
    });
</script>
</body>
</html>