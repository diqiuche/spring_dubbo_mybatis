<html>
<head>
    <meta charset="utf-8" content="text/html"/>
    <title>webix html5前端框架</title>
    <link href="${baseDir.contextPath}/js/webix/codebase/webix.css" rel="stylesheet" type="text/css"/>
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/themes/icon.css" rel="stylesheet" type="text/css">
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/demo/demo.css" rel="stylesheet" type="text/css">
    <link href="${baseDir.contextPath}/css/commons.css" type="text/css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${baseDir.contextPath}/js/webix/codebase/webix.js"></script>

</head>
<body>
<script type="text/javascript">

    var topPanel = {
        borderless:true,
        margin:0,
        padding:0,
        header:'今日热点',
        headerHeight:35,
        headerAltHeight:35,
        gravity:0.4,
        body:{
            view:'tabview',
            cells:[
                {
                    header:'国际新闻',
                    width:200,
                    body:{
                        id:'internationalNewsList',
                        view:'list',
                        //datatype:'jsarray',
                        select:true,
                        data:[
                            {id:1,title:'奥巴马的新闻标题',content:'出访中国',date:'2015年7月28日'},
                            {id:2,title:'施罗德的新闻标题',content:'出访日本',date:'2015年7月28日'},
                            {id:3,title:'默克尔的新闻标题',content:'出访美国',date:'2015年7月28日'},
                            {id:4,title:'小泉的新闻标题',content:'出访中国',date:'2015年7月28日'},
                            {id:6,title:'威廉王子的新闻标题',content:'游玩塞班岛',date:'2015年7月28日'},
                            {id:7,title:'保罗艾伦的新闻标题',content:'制造宇宙飞船游太空',date:'2015年7月28日'},
                            {id:8,title:'比尔盖茨的新闻标题',content:'发布windows 10',date:'2015年7月28日'},
                            {id:9,title:'老习的新闻标题',content:'出访世界各地',date:'2015年7月28日'}
                        ],
                        template:"#id#---#title#---#content#,时间：#date#"

                    }
                },
                {
                    header:'国内新闻',
                    width:200,
                    body:{
                        id:'domesticNewsList',
                        view:'list',
                        //datatype:'jsarray',
                        select:true,
                        data:[
                            {"id":1,title:'奥巴马的新闻标题',content:'出访中国',date:'2015年7月28日'},
                            {id:2,title:'施罗德的新闻标题',content:'出访日本',date:'2015年7月28日'},
                            {id:3,title:'默克尔的新闻标题',content:'出访美国',date:'2015年7月28日'},
                            {id:4,title:'小泉的新闻标题',content:'出访中国',date:'2015年7月28日'},
                            {id:6,title:'威廉王子的新闻标题',content:'游玩塞班岛',date:'2015年7月28日'},
                            {id:7,title:'保罗艾伦的新闻标题',content:'制造宇宙飞船游太空',date:'2015年7月28日'},
                            {id:8,title:'比尔盖茨的新闻标题',content:'发布windows 10',date:'2015年7月28日'},
                            {id:9,title:'老习的新闻标题',content:'出访世界各地',date:'2015年7月28日'}
                        ],
                        template:"#id#---#title#---#content#,时间：#date#"
                    }
                }
            ]
        }
    };

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
                                {id:2,value:'用户列表',open:true  }
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
                    //url:'${baseDir.contextPath}/user/initVideoTree/false',
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
                collapsed:true,
                body:{
                    id:'pictureTree',
                    view:'tree',
                    dataType:'jsarray',
                    type:'lineTree',
                    select:true,
                    data:[
                        {id:1,open:true,value:'图片',data:[
                                {id:2,open:true,value:'瀑布流'}
                            ]
                        }
                    ],
                    on:{
                        onItemClick:function(id, event, htmlNode) {
                            var treeNodeData = $$("pictureTree").getItem(id);
                            if(treeNodeData.id==2) {
                                $$("rightFrame").getIframe().src="${baseDir.contextPath}/user/showPictureFall";
                            }
                        }
                    }
                }
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

    webix.ready(function(){
        webix.ui({
            view:'headerlayout',
            type:'space',
            borderless:true,
            margin:0,
            padding:0,
            rows:[
                topPanel,
                {view:'resizer'},
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