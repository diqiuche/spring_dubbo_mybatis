<html>
<head>
    <meta charset="utf-8" content="text/html"/>
    <title>webix html5前端框架</title>
    <link href="${baseDir.contextPath}/js/webix/codebase/webix.css" rel="stylesheet" type="text/css"/>
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/themes/icon.css" rel="stylesheet" type="text/css">
    <link href="${baseDir.contextPath}/js/jquery-easyui-1.4.3/demo/demo.css" rel="stylesheet" type="text/css">
    <link href="${baseDir.contextPath}/css/commons.css" type="text/css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${baseDir.contextPath}/js/webix/codebase/webix.js"></script>
    <!-- i18n 中文-->
    <script type="text/javascript" src="${baseDir.contextPath}/js/webix/codebase/i18n/zh.js"></script>

</head>
<body>
<script type="text/javascript">
    webix.i18n.setLocale("zh-CN");   //i18n ，中文
    var cities = [
        {id:'1',value:'上海'},
        {id:'2',value:'北京'},
        {id:'3',value:'广州'},
        {id:'4',value:'南京'},
        {id:'5',value:'无锡'},
        {id:'6',value:'长沙'},
        {id:'7',value:'武汉'},
        {id:'8',value:'湘潭'},
        {id:'9',value:'西安'},
        {id:'10',value:'云南'}


    ];

    function img(obj) {
        return '<img src="'+ obj.src +'"/>';
    }

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
            borderless:true,
            margin:0,
            padding:0,
            cells:[
                {
                    header:'国际新闻',
                    width:200,
                    height:200,
                    margin:0,
                    padding:0,
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
                    height:200,
                    margin:0,
                    padding:0,
                    body:{
                        id:'domesticNewsList',
                        view:'list',
                        //datatype:'jsarray',
                        select:true,
                        data:[
                            {"id":1,title:'马云的新闻标题',content:'出访中国',date:'2015年7月28日'},
                            {id:2,title:'陈天桥的新闻标题',content:'出访日本',date:'2015年7月28日'},
                            {id:3,title:'俞敏洪的新闻标题',content:'出访美国',date:'2015年7月28日'},
                            {id:4,title:'李彦宏的新闻标题',content:'出访中国',date:'2015年7月28日'},
                            {id:6,title:'马化腾的新闻标题',content:'游玩塞班岛',date:'2015年7月28日'},
                            {id:7,title:'古永铿的新闻标题',content:'制造宇宙飞船游太空',date:'2015年7月28日'},
                            {id:8,title:'王石的新闻标题',content:'发布windows 10',date:'2015年7月28日'},
                            {id:9,title:'王健林的新闻标题',content:'出访世界各地',date:'2015年7月28日'}
                        ],
                        template:"#id#---#title#---#content#,时间：#date#"
                    }
                },
                {
                    header: '热点图片',
                    width: 200,
                    height:200,
                    margin: 0,
                    padding:0,
                    body: {
                        type:'clean',
                        cols:[
                             {
                                 type:'clean',
                                 cols:[
                                     {
                                         view:'template',borderless:true
                                     },
                                    {
                                        id:'pictureCarousel',
                                        view:'carousel',
                                        width:200,
                                        height:180,
                                        borderless:true,
                                        cols:[
                                            {css:'image',template:img,data:{src:"${baseDir.contextPath}/images/beautiful/image_1.jpg"}},
                                            {css:'image',template:img,data:{src:"${baseDir.contextPath}/images/beautiful/image_2.jpg"}},
                                            {css:'image',template:img,data:{src:"${baseDir.contextPath}/images/beautiful/image_3.jpg"}},
                                            {css:'image',template:img,data:{src:"${baseDir.contextPath}/images/beautiful/image_4.jpg"}},
                                            {css:'image',template:img,data:{src:"${baseDir.contextPath}/images/beautiful/image_5.jpg"}},
                                            {css:'image',template:img,data:{src:"${baseDir.contextPath}/images/beautiful/image_6.jpg"}}
                                        ]
                                    },
                                     {
                                         view:'template',borderless:true
                                     }
                                ]
                            }
                        ]
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
                header:"航班预定",
                headerHeight:32,
                headerAltHeight:32,  //折叠时的高度
                animate:{type:"slide", subtype:"in"},
                //height:600,
                collapsed:true, //默认关闭
                body:
                {
                    view:"form", elements:[
                        {
                            view:"radio", id:"tripRadio", value:1, options:[{id:1, value:"单程"}, {id:2, value:"往返"}], label:"旅程",
                            on:{
                                onChange:function(newValue, oldValue) {
                                    var $$endDate = $$("endDate");
                                    if(newValue == 2) {
                                        $$endDate.show();
                                    }else {
                                        $$endDate.hide();
                                    }
                                }
                            }
                        },
                        {
                            view:"combo", label:"从", options:cities, placeholder:"请选择出发地",value:1,
                            required:true,tooltip:'请选择出发地'
                        },
                        {
                            view:"combo", label:"至", options:cities, placeholder:"请选择目的地",
                            required:true,tooltip:'请选择目的地'
                        },
                        {view:"datepicker", id:"startDate",label:"出发日期", value:new Date(), format:"%Y-%m-%d"},
                        {view:"datepicker", id:"endDate", label:"回程日期", format:"%Y-%m-%d", hidden:true},
                        /*{view:"checkbox", id:"flexible", value:0, label: "不固定日期"},*/
                        {
                            cols:[
                                {view:"label",  label: "乘客", width: 100,align:'left'},
                                {view:"counter",  labelPosition: "top", label:"成年人", value:1, min:1},
                                {view:"counter",  labelPosition: "top", label:"儿童"}
                            ]
                        },
                        /*{ height: 2},*/
                        {view:"button", type:"form", value:"现在预定", inputWidth:140, align: "center"}, {}

                    ],
                    elementsConfig:{
                        labelWidth:100, labelAlign:"left"
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
                    rows:[
                        {
                            id:'buttonBar',
                            view:'toolbar',
                            height:40,
                            cols:[
                                {
                                    id:'addVideoButton',
                                    view:"button", type:"icon",  label:"新增", width:50,align:'left',type:'form',disabled:true,
                                    on:{
                                        onItemClick:function(id, event) {
                                            $$("uploadWindow").show();
                                        }
                                    }
                                },
                                {
                                    id:'deleteVideoButton',
                                    view:"button", type:"icon",  label:"删除", width:50,align:'left',type:'danger',disabled:true,
                                    on:{
                                        onItemClick:function(id, event) {

                                        }
                                    }
                                }
                            ]
                        },
                        {
                            id:'videoTree',
                            view:'tree',
                            url:'${baseDir.contextPath}/user/getAllVideoInTree',
                            dataType:'jsarray',
                            type:'lineTree',
                            select:true,
                            on:{
                                onItemClick:function(id, event, htmlNode) {
                                    var treeNodeData = $$("videoTree").getItem(id);
                                    if(treeNodeData.id != -1) {  //视频节点
                                        $$("rightFrame").getIframe().src="${baseDir.contextPath}/user/playVideoViaWebIX/"+treeNodeData.id;
                                        $$("deleteVideoButton").enable();
                                        $$("addVideoButton").disable();
                                    }else {  //根节点
                                        $$("deleteVideoButton").disable();
                                        $$("addVideoButton").enable();
                                    }

                                }
                            }
                        }
                    ]
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

        webix.ui({
            id:'uploadWindow',
            view:'window',
            head:{
                view:"toolbar",
                height:40,
                cols:[
                    {view:"label", label: "上传视频",align:'center',height:40 },
                    { view:"button", label: '关闭', width: 40, align: 'right', click:"$$('uploadWindow').hide();"}
                ]
            },
            width:430,
            height:300,
            hidden:true,
            modal:true,
            move:true,
            position:"center",
            body:{
                id:'videoUploadForm',
                view:'form',
                elements:[
                    {
                        cols:[
                            {
                                id:'videoFileUploader',
                                view:'uploader',
                                value:'请选择MP4或者flv格式的视频文件',
                                accept:'video/mp4,video/x-flv',
                                height:60,
                                name:'videoFile',
                                link:'myfiletemplate'   //用来显示被选中的文件
                            },
                            {view:'label',label:'文件名',width:60},
                            {
                                id:'myfiletemplate',autoheight:true,
                                template:function(data) {
                                    var filenames = [];
                                    if(data.each) {
                                        data.each(function(obj){
                                           filenames.push('<div style="padding-top: 20px;">'+obj.name+'</div>');
                                        });
                                    }
                                    return filenames.join("&nbsp;&nbsp;&nbsp;");
                                },
                                height:60,
                                borderless:true
                            }
                        ]
                    },
                    {
                        cols:[
                            { view:'template',borderless:true },
                            {
                                view:'button',type:'form',label:'提交',width:50,
                                on:{
                                    onItemClick:function(id, event) {
                                        $$("videoUploadForm").getValues;
                                    }
                                }
                            },
                            { view:'template',borderless:true  }
                        ]
                    }
                ]
            }
        });

    });

</script>
</body>
</html>