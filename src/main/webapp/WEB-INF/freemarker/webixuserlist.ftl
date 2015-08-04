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
        rows:[
            {view:'template',type:'header',template:"tangsi's App!"},
            {view:'datatable',
                /*autoConfig:true,*/
                editable:true,
                /*data:[{   //load data from datasource obj
                    name:'tangsi',username:'root',email:'tangside163@163.com',phone:18670950325
                }],*/
                url:'${baseDir.contextPath}/user/getWebIXUsers',
                autoheight:true,
               /* autowidth:true,*/
                resizeColumn:true,
                resizeRow:true,
                container:'body',
                columns:[
                     {id:'name',header:'姓名',fillspace:true,sort:'server'},  //force some of columns to widen for filling the unused space
                     {id:'username',header:'用户名',fillspace:true,sort:'server'},
                     {id:'email',header:'邮箱',fillspace:true,sort:'server'},
                     {id:'phone',header:'电话',fillspace:true,sort:'server'}
                ],
                on:{
                    "onBeforeSort":function(by, dir, as) {
                        alert("by = " + by + " , dir = " + dir + ", as = " + as);
                        return true;
                    },
                    onBeforeLoad:function(){
                        console.dir("Loading...");
                    },
                    "onAfterSort":function(by, dir, as) {
                        alert("排序后：by = " + by + " , dir = " + dir + ", as = " + as);
                    }
                }

            }
        ]
    });
</script>
</body>
</html>